import string

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
from datetime import UTC, datetime, timedelta
from typing import Dict, Any, List
from fastapi import HTTPException # <-- Asegúrate de importar HTTPException en la parte superior

# Importamos lo que creamos
from database import engine, SessionLocal
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
    exp: int
    coins: int
    lives: int
    inventory: dict
    equipped: dict
    world_progress: dict
    lesson_progress: Dict[str, list] = {}
    skill_level: int

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

class NextExerciseRequest(BaseModel):
    world_id: str
    level_index: int
    current_skill_level: int
    exclude_ids: List[int] = [] # Memoria temporal de la sesión
    target_concept: str = None # <-- NUEVO: El tema exacto que queremos

class UpdateSkillRequest(BaseModel):
    user_id: int
    skill_level: int

class CodeGenerationRequest(BaseModel):
    student_id: int

class LinkStudentRequest(BaseModel):
    tutor_id: int
    code: str

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
        equipped={"hats": None, "glasses": None, "shirts": None},
        skill_level=3
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
    
    # LÓGICA DE TIEMPO OFFLINE
    seconds_until_next = 300 # Por defecto 5 minutos (300 seg)
    
    if user.lives < 5 and user.last_life_update:
        now = datetime.utcnow()
        delta = (now - user.last_life_update).total_seconds()
        
        recovered_lives = int(delta // 300) # Cuántas vidas de 5 mins recuperó
        
        if recovered_lives > 0:
            user.lives = min(5, user.lives + recovered_lives)
            
            if user.lives == 5:
                user.last_life_update = None # Ya está lleno
            else:
                # Adelantamos el reloj la cantidad exacta de vidas que se le dio
                user.last_life_update += timedelta(seconds=recovered_lives * 300)
            
            db.commit() # Guardamos las nuevas vidas calculadas
            
        # Calcular los segundos restantes para la próxima vida (para mandarlo a Flutter)
        if user.lives < 5 and user.last_life_update:
            delta_now = (datetime.utcnow() - user.last_life_update).total_seconds()
            seconds_until_next = 300 - int(delta_now)

    return {
        "id": user.id,
        "name": user.name,
        "email": user.email,
        "exp": user.exp,
        "coins": user.coins,
        "lives": user.lives,
        "inventory": user.inventory,
        "equipped": user.equipped,
        "exam_history": user.exam_history,
        "world_progress": user.world_progress,
        "next_life_in_seconds": seconds_until_next, 
        "lesson_progress": user.lesson_progress,
        "skill_level": user.skill_level
    }

# --- 2. AL ACTUALIZAR ESTADÍSTICAS (PUT /api/users/{user_id}/stats) ---
@app.put("/api/users/{user_id}/sync")
async def sync_user_data(user_id: int, data: UserUpdateData, db: Session = Depends(get_db)):
    user = db.query(models.User).filter(models.User.id == user_id).first()

    # Si bajó de 5 vidas a 4 vidas, ESTE es el momento exacto donde empieza a correr el reloj
    if data.lives < user.lives and user.lives == 5:
        user.last_life_update = datetime.utcnow()
    
    user.exp = data.exp
    user.coins = data.coins
    user.lives = data.lives
    user.inventory = data.inventory
    user.equipped = data.equipped
    user.world_progress = data.world_progress
    user.lesson_progress = data.lesson_progress
    user.skill_level = data.skill_level
    
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

# --- SISTEMA DE APRENDIZAJE POR REFUERZO (IA) ---
@app.post("/api/exercises/next")
async def get_next_dynamic_exercise(req: NextExerciseRequest, db: Session = Depends(get_db)):
    
    # 1. PARÁMETROS DEL ALGORITMO EPSILON-GREEDY
    epsilon = 0.20  # 20% de probabilidad de "Explorar"
    target_difficulty = req.current_skill_level
    is_epic_quest = False

    # 2. DECISIÓN DE LA IA: ¿Explotar o Explorar?
    if random.random() < epsilon:
        # FASE DE EXPLORACIÓN: Lanzamos un reto ligeramente superior a su nivel
        target_difficulty = min(10, target_difficulty + random.randint(1, 2))
        is_epic_quest = True
    else:
        # FASE DE EXPLOTACIÓN: Mantenemos su nivel para reforzar confianza
        pass 

    # 3. CONSTRUCCIÓN DE LA BÚSQUEDA EN BASE DE DATOS
    query = db.query(models.Exercise).filter(
        models.Exercise.world_id == req.world_id,
        models.Exercise.level_index == req.level_index
    )

    # <-- NUEVO FILTRO EXACTO -->
    if req.target_concept:
        query = query.filter(models.Exercise.concept_tag == req.target_concept)

    # 4. FILTRO DE MEMORIA: Excluimos lo que ya resolvió en esta sesión
    if req.exclude_ids and len(req.exclude_ids) > 0:
        query = query.filter(models.Exercise.id.notin_(req.exclude_ids))

    # Buscamos los que encajen con la dificultad decidida por la IA
    exercises = query.filter(models.Exercise.base_difficulty == target_difficulty).all()

    # --- SISTEMA DE RESPALDO (FALLBACKS) ---
    
    # Plan B: Si no hay ejercicios exactos de esa dificultad, traemos cualquiera que NO haya visto
    if not exercises:
        exercises = query.all()
        is_epic_quest = False # Apagamos el aviso de "Reto" porque la dificultad ya no es exacta

    # Plan C: Si ya resolvió TODOS los del nivel, ignoramos la memoria y le repetimos uno
    if not exercises:
        exercises = db.query(models.Exercise).filter(
            models.Exercise.world_id == req.world_id,
            models.Exercise.level_index == req.level_index
        ).all()

    # ESCUDO ANTI-CRASH: Si la tabla está literalmente vacía para este nivel
    if not exercises:
        raise HTTPException(status_code=404, detail="No hay ejercicios registrados para este nivel.")

    # 5. SELECCIÓN FINAL Y RESPUESTA
    chosen = random.choice(exercises)

    return {
        "is_epic_quest": is_epic_quest,
        "exercise": {
            "id": chosen.id,
            "question_text": chosen.question_text,
            "options": chosen.options,
            "correct_answer_index": chosen.correct_answer_index,
            "feedback": chosen.feedback,
            "difficulty": chosen.base_difficulty,
            "concept_tag": chosen.concept_tag
        }
    }

@app.post("/api/user/update-skill")
def update_user_skill(req: UpdateSkillRequest, db: Session = Depends(get_db)):
    user = db.query(models.User).filter(models.User.id == req.user_id).first()
    if not user:
        raise HTTPException(status_code=404, detail="Usuario no encontrado")
    
    # Restringimos que esté en el rango educativo del 1 al 10
    user.skill_level = max(1, min(10, req.skill_level))
    db.commit()
    
    return {"status": "success", "skill_level": user.skill_level}

# --- ENDPOINTS DE TUTORÍA Y SUPERVISIÓN ---

@app.post("/api/student/generate-code")
def generate_linking_code(req: CodeGenerationRequest, db: Session = Depends(get_db)):
    # 1. Verificar que el estudiante exista
    student = db.query(models.User).filter(models.User.id == req.student_id, models.User.role == "student").first()
    if not student:
        raise HTTPException(status_code=404, detail="Estudiante no encontrado")
    
    # 2. Limpiar códigos viejos que pertenezcan a este estudiante para no saturar
    db.query(models.LinkCode).filter(models.LinkCode.student_id == req.student_id).delete()
    
    # 3. Generar un código único y limpio de 6 caracteres alfanuméricos
    characters = string.ascii_uppercase + string.digits
    unique_code = ''.join(random.choices(characters, k=6))
    
    # 4. Registrar el nuevo código temporal en la base de datos (expira en 24h por defecto)
    new_code = models.LinkCode(code=unique_code, student_id=req.student_id)
    db.add(new_code)
    db.commit()
    
    return {"status": "success", "code": unique_code}

# 1. El estudiante genera su código desde la App Móvil
@app.post("/api/student/{student_id}/generate-code")
def generate_linking_code(student_id: int, db: Session = Depends(get_db)):
    student = db.query(models.User).filter(models.User.id == student_id).first()
    if not student:
        raise HTTPException(status_code=404, detail="Estudiante no encontrado")
    
    # Generar un código único de 6 caracteres alfanuméricos
    characters = string.ascii_uppercase + string.digits
    unique_code = ''.join(random.choices(characters, k=6))
    
    # Guardar en el perfil del estudiante con expiración de 24 horas
    student.link_code = unique_code
    student.link_code_expires_at = datetime.now(UTC) + timedelta(days=1)
    db.commit()
    
    return {"status": "success", "code": unique_code}

# 2. El tutor ingresa el código en la Web
@app.post("/api/tutor/link")
def link_student_to_tutor(req: LinkStudentRequest, db: Session = Depends(get_db)):
    tutor = db.query(models.Tutor).filter(models.Tutor.id == req.tutor_id).first()
    if not tutor:
        raise HTTPException(status_code=404, detail="Tutor no encontrado")
        
    input_code = req.code.strip().upper()
    
    # Buscar qué estudiante tiene este código activo
    student = db.query(models.User).filter(models.User.link_code == input_code).first()
    
    if not student:
        raise HTTPException(status_code=400, detail="Código inválido o no encontrado")
        
    # Verificar si el código expiró
    if student.link_code_expires_at.replace(tzinfo=UTC) < datetime.now(UTC):
        # Limpiamos el código expirado
        student.link_code = None
        student.link_code_expires_at = None
        db.commit()
        raise HTTPException(status_code=400, detail="El código de enlace ha expirado")
        
    # Verificar si ya están vinculados
    if student in tutor.students:
        return {"status": "success", "message": "El estudiante ya estaba vinculado."}
        
    # Crear el enlace en la tabla intermedia (tutor_student)
    tutor.students.append(student)
    
    # Eliminar el código del estudiante para que sea de un único uso
    student.link_code = None
    student.link_code_expires_at = None
    db.commit()
    
    return {"status": "success", "message": f"Estudiante {student.name} vinculado correctamente."}

# 3. El tutor consulta el Dashboard (Web)
@app.get("/api/tutor/{tutor_id}/dashboard")
def get_tutor_dashboard(tutor_id: int, db: Session = Depends(get_db)):
    tutor = db.query(models.Tutor).filter(models.Tutor.id == tutor_id).first()
    if not tutor:
        raise HTTPException(status_code=404, detail="Tutor no encontrado")
        
    students_data = []
    for s in tutor.students:
        students_data.append({
            "id": s.id,
            "name": s.name,
            "exp": s.exp,
            "skill_level": s.skill_level, # Dato crucial de la IA
            # Aquí podrías añadir los campos JSON de world_progress o exam_history si los tienes mapeados
        })
        
    return {"status": "success", "tutor_name": tutor.name, "students": students_data}

# Este bloque es para poder ejecutar el archivo directamente
if __name__ == "__main__":
    uvicorn.run("main:app", host="0.0.0.0", port=3000, reload=True)