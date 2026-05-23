from fastapi import FastAPI, Depends
from fastapi.responses import JSONResponse
from fastapi.middleware.cors import CORSMiddleware
from sqlalchemy import or_
from sqlalchemy.orm import Session
from sqlalchemy.sql.expression import func # Para ordenar de forma aleatoria
import uvicorn
from security import get_password_hash, verify_password
from pydantic import BaseModel
import random
from datetime import datetime, timedelta

# Importamos lo que creamos
from database import engine, SessionLocal, Base
import models

app = FastAPI()

# --- CONFIGURACIÓN DE BASE DE DATOS ---
# Esto crea las tablas en PostgreSQL si no existen al iniciar el servidor
models.Base.metadata.create_all(bind=engine)

# Dependencia para obtener la sesión de la BD en cada petición
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

# --- NUEVO BLOQUE: Configuración de CORS ---
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"], # Permite peticiones de cualquier origen (solo para desarrollo)
    allow_credentials=True,
    allow_methods=["*"], # Permite todos los métodos (POST, GET, OPTIONS, etc.)
    allow_headers=["*"], # Permite todos los headers
)
# -------------------------------------------

# --- MODELOS PYDANTIC (Lo que recibimos de Flutter) ---
class LoginData(BaseModel):
    email: str
    password: str

# Modelo para crear usuarios
class UserCreate(BaseModel):
    email: str
    name: str
    password: str

class UserUpdateData(BaseModel):
    coins: int
    inventory: dict
    equipped: dict

class ForgotPasswordRequest(BaseModel):
    email: str

class ResetPasswordRequest(BaseModel):
    email: str
    code: str
    new_password: str

class AddFriendRequest(BaseModel):
    friend_email: str

class ExamSaveRequest(BaseModel):
    score: int
    grade: str
    detailed_history: list # Para guardar en qué se equivocó exactamente

# 2. Creamos la ruta (endpoint) para el login
@app.post("/api/login")
async def login(user_data: LoginData, db: Session = Depends(get_db)):
    # Imprimimos en la consola del servidor lo que llegó desde Flutter
    print(f"Intento de login con: {user_data.email}")
    
    # 1. Buscamos al usuario en la base de datos por su email
    # Esto equivale a: SELECT * FROM users WHERE email = '...' LIMIT 1
    db_user = db.query(models.User).filter(models.User.email == user_data.email).first()

    # 2. Validamos si el usuario existe
    if not db_user:
        return JSONResponse(status_code=401, content={"message": "El usuario no existe"})
    
    # 3. --- AQUÍ APLICAMOS LA SEGURIDAD ---
    # Comparamos la contraseña enviada con el hash de la base de datos
    if not verify_password(user_data.password, db_user.password):
        return JSONResponse(status_code=401, content={"message": "Contraseña incorrecta"})

    # 4. Login exitoso
    return {
        "token": "fake-jwt-token-12345", # Token que usaremos más adelante
        "user": {
            "id": db_user.id,
            "name": db_user.name,
            "email": db_user.email
        }
    }

@app.post("/api/register")
async def register(user: UserCreate, db: Session = Depends(get_db)):
    # Verificamos si el email ya existe
    existing_user = db.query(models.User).filter(models.User.email == user.email).first()
    if existing_user:
        return JSONResponse(status_code=400, content={"message": "El correo ya está registrado"})
    
    hashed_pwd = get_password_hash(user.password)

    # Creamos la entidad User
    new_user = models.User(
        email=user.email,
        name=user.name,
        password=hashed_pwd, # Guardamos el Hash, NUNCA el texto plano
        exp=0,
        coins=500,
        lives=5,
        inventory={"hats": [], "glasses": [], "shirts": []},
        equipped={"hats": None, "glasses": None, "shirts": None}
    )
    
    # Guardamos en la base de datos
    db.add(new_user)
    db.commit()
    db.refresh(new_user)
    
    return {
        "token": "fake-jwt-token-12345", 
        "user": {
            "id": new_user.id,
            "name": new_user.name,
            "email": new_user.email
        }
    }

# Ruta 1: Obtener perfil del usuario
@app.get("/api/users/{user_id}")
async def get_user_profile(user_id: int, db: Session = Depends(get_db)):
    user = db.query(models.User).filter(models.User.id == user_id).first()
    if not user:
        return JSONResponse(status_code=404, content={"message": "Usuario no encontrado"})
    
    return {
        "id": user.id,
        "name": user.name,
        "exp": user.exp,
        "coins": user.coins,
        "lives": user.lives,
        "inventory": user.inventory,
        "equipped": user.equipped,
        "exam_history": user.exam_history
    }

# Ruta 2: Sincronizar compras y equipamiento
@app.put("/api/users/{user_id}/sync")
async def sync_user_data(user_id: int, data: UserUpdateData, db: Session = Depends(get_db)):
    user = db.query(models.User).filter(models.User.id == user_id).first()
    
    user.coins = data.coins
    user.inventory = data.inventory
    user.equipped = data.equipped
    
    db.commit()
    return {"success": True, "message": "Datos sincronizados"}

# --- ENDPOINT 1: Solicitar Código ---
@app.post("/api/forgot-password")
async def forgot_password(request: ForgotPasswordRequest, db: Session = Depends(get_db)):
    user = db.query(models.User).filter(models.User.email == request.email).first()
    
    if not user:
        # Por seguridad, siempre devolvemos éxito incluso si el correo no existe
        # Así los hackers no pueden usar esto para adivinar qué correos están registrados
        return {"success": True, "message": "Si el correo existe, se ha enviado un código."}
    
    # Generamos código de 6 dígitos
    code = str(random.randint(100000, 999999))
    expiration = datetime.utcnow() + timedelta(minutes=15)
    
    user.reset_code = code
    user.reset_code_expires = expiration
    db.commit()
    
    # EN PRODUCCIÓN: Aquí llamarías a SendGrid/AWS SES para enviar el email.
    # EN DESARROLLO: Lo imprimimos en consola para que puedas verlo y probar.
    print(f"========== EMAIL SIMULADO ==========")
    print(f"Para: {user.email}")
    print(f"Tu código de recuperación es: {code}")
    print(f"====================================")
    
    return {"success": True, "message": "Código enviado a tu correo."}

# --- ENDPOINT 2: Validar Código y Cambiar Contraseña ---
@app.post("/api/reset-password")
async def reset_password(request: ResetPasswordRequest, db: Session = Depends(get_db)):
    user = db.query(models.User).filter(models.User.email == request.email).first()
    
    if not user:
        return JSONResponse(status_code=400, content={"message": "Usuario no encontrado."})
        
    # Validaciones del código
    if user.reset_code != request.code:
        return JSONResponse(status_code=400, content={"message": "Código incorrecto."})
        
    if user.reset_code_expires < datetime.utcnow():
        return JSONResponse(status_code=400, content={"message": "El código ha expirado."})
        
    # Éxito: Cambiamos la contraseña
    user.password = get_password_hash(request.new_password)
    user.reset_code = None # Limpiamos el código por seguridad
    user.reset_code_expires = None
    
    db.commit()
    
    return {"success": True, "message": "Contraseña actualizada correctamente."}

# --- 1. OBTENER LEADERBOARD (Tú + Tus Amigos) ---
@app.get("/api/users/{user_id}/leaderboard")
async def get_leaderboard(user_id: int, db: Session = Depends(get_db)):
    user = db.query(models.User).filter(models.User.id == user_id).first()
    if not user:
        return JSONResponse(status_code=404, content={"message": "Usuario no encontrado"})
    
    # Armamos la lista de IDs a buscar (Tus amigos + Tú mismo)
    ids_to_fetch = user.friends + [user.id]
    
    # Buscamos a todos y los ordenamos por experiencia de mayor a menor
    leaderboard_users = db.query(models.User).filter(models.User.id.in_(ids_to_fetch)).order_by(models.User.exp.desc()).all()
    
    # Formateamos la respuesta
    result = []
    for u in leaderboard_users:
        result.append({
            "id": u.id,
            "name": u.name,
            "exp": u.exp,
            "equipped": u.equipped
        })
        
    return {"success": True, "data": result}

# --- 2. AGREGAR AMIGO ---
@app.post("/api/users/{user_id}/add-friend")
async def add_friend(user_id: int, request: AddFriendRequest, db: Session = Depends(get_db)):
    user = db.query(models.User).filter(models.User.id == user_id).first()
    friend = db.query(models.User).filter(models.User.email == request.friend_email).first()
    
    if not friend:
        return JSONResponse(status_code=404, content={"message": "No se encontró ningún usuario con ese correo"})
    if friend.id == user.id:
        return JSONResponse(status_code=400, content={"message": "No puedes agregarte a ti mismo"})
    if friend.id in user.friends:
        return JSONResponse(status_code=400, content={"message": "Este usuario ya es tu amigo"})
        
    # Agregamos y guardamos
    updated_friends = list(user.friends)
    updated_friends.append(friend.id)
    user.friends = updated_friends
    db.commit()
    
    return {"success": True, "message": f"¡{friend.name} agregado a tu lista!"}

# --- 3. ELIMINAR AMIGO ---
@app.delete("/api/users/{user_id}/remove-friend/{friend_id}")
async def remove_friend(user_id: int, friend_id: int, db: Session = Depends(get_db)):
    user = db.query(models.User).filter(models.User.id == user_id).first()
    
    if friend_id in user.friends:
        updated_friends = list(user.friends)
        updated_friends.remove(friend_id)
        user.friends = updated_friends
        db.commit()
        return {"success": True, "message": "Amigo eliminado"}
        
    return JSONResponse(status_code=400, content={"message": "Este usuario no está en tu lista"})

# --- 1. RUTA PARA OBTENER 20 PREGUNTAS ALEATORIAS ---
@app.get("/api/questions")
async def get_exam_questions(db: Session = Depends(get_db)):
    # Usamos func.random() para traer 20 preguntas distintas en cada intento
    questions = db.query(models.Question).order_by(func.random()).limit(20).all()
    
    # Formateamos la respuesta
    result = []
    for q in questions:
        result.append({
            "id": q.id,
            "text": q.text,
            "options": q.options,
            "correct_answer_index": q.correct_answer_index
        })
    return {"success": True, "data": result}

# --- 2. RUTA PARA GUARDAR EL EXAMEN DEL USUARIO ---
@app.post("/api/users/{user_id}/exams")
async def save_exam(user_id: int, request: ExamSaveRequest, db: Session = Depends(get_db)):
    user = db.query(models.User).filter(models.User.id == user_id).first()
    
    if not user:
        return JSONResponse(status_code=404, content={"message": "Usuario no encontrado"})
        
    # Agregamos el nuevo resultado a su historial
    current_history = list(user.exam_history) if user.exam_history else []
    current_history.append({
        "score": request.score,
        "grade": request.grade,
        "date": datetime.utcnow().isoformat(),
        "details": request.detailed_history
    })
    
    user.exam_history = current_history
    
    # (Opcional) Podemos darle monedas o experiencia por aprobar
    if request.score >= 11:
        user.coins += 50
        user.exp += 100
        
    db.commit()
    return {"success": True, "message": "Resultado guardado correctamente"}

# --- 3. RUTA DE AYUDA PARA LLENAR TU BASE DE DATOS RÁPIDO ---
@app.post("/api/seed-questions")
async def seed_questions(db: Session = Depends(get_db)):
    # Si ya hay preguntas, no hacemos nada
    if db.query(models.Question).first():
        return {"message": "Ya hay preguntas en la base de datos"}
        
    preguntas_ejemplo = [
        models.Question(text="¿Cuánto es el 20% de 150?", options=["20", "30", "40", "50"], correct_answer_index=1),
        models.Question(text="¿Cuál es el MCM de 4 y 6?", options=["10", "12", "24", "8"], correct_answer_index=1),
        models.Question(text="Resuelve: 5 + 3 x 2", options=["16", "11", "10", "8"], correct_answer_index=1),
        # ... la idea es que tú luego agregues más desde pgAdmin ...
    ]
    
    # Agregamos 20 preguntas generadas automáticamente como relleno
    import random
    for _ in range(25):
        a = random.randint(2, 12)
        b = random.randint(2, 12)
        ans = a * b
        opts = [str(ans), str(ans+1), str(ans-2), str(ans+10)]
        random.shuffle(opts)
        idx = opts.index(str(ans))
        preguntas_ejemplo.append(models.Question(text=f"¿Cuánto es {a} x {b}?", options=opts, correct_answer_index=idx))
        
    db.add_all(preguntas_ejemplo)
    db.commit()
    return {"message": "Banco de preguntas poblado con éxito"}

# Este bloque es para poder ejecutar el archivo directamente
if __name__ == "__main__":
    uvicorn.run("main:app", host="0.0.0.0", port=3000, reload=True)