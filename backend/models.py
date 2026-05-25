from sqlalchemy import Column, Integer, String, JSON, DateTime
from database import Base

class User(Base):
    __tablename__ = "users"

    id = Column(Integer, primary_key=True, index=True)
    email = Column(String, unique=True, index=True)
    name = Column(String)
    password = Column(String) 
    
    # --- Nuevos campos de Gamificación ---
    exp = Column(Integer, default=0)
    coins = Column(Integer, default=500) # Regalamos 500 monedas de inicio
    lives = Column(Integer, default=5)
    
    # # --- NUEVAS COLUMNAS PARA RECUPERACIÓN ---
    reset_code = Column(String, nullable=True)
    reset_code_expires = Column(DateTime, nullable=True)
    
    # Guardamos los IDs de los items que posee (Ej. "h1", "s2")
    inventory = Column(JSON, default={
        "hats": [], 
        "glasses": [], 
        "shirts": []
    })
    
    # Guardamos lo que tiene puesto actualmente
    equipped = Column(JSON, default={
        "hats": None, 
        "glasses": None, 
        "shirts": None
    })

    # Lista de IDs de amigos (ej. [2, 5, 12])
    friends = Column(JSON, default=[])

    # Historial de exámenes ---
    exam_history = Column(JSON, default=[])

    # Guardaremos el progreso como un diccionario {"id_del_mundo": niveles_completados}
    world_progress = Column(JSON, default={})

    # Guardar el momento exacto en que empezó a regenerar vidas
    last_life_update = Column(DateTime, default=None)

# --- NUEVA TABLA: Banco de Preguntas ---
class Question(Base):
    __tablename__ = "questions"

    id = Column(Integer, primary_key=True, index=True)
    text = Column(String)
    options = Column(JSON) # Guardaremos la lista de 4 opciones aquí
    correct_answer_index = Column(Integer)