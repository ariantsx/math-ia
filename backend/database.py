import os
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, declarative_base
from dotenv import load_dotenv

# Cargar las variables del archivo .env
load_dotenv()

# Obtener la URL de la base de datos de forma segura
URL_DATABASE = os.getenv("DATABASE_URL")

# Validar que la variable exista para evitar errores silenciosos
if not URL_DATABASE:
    raise ValueError("ERROR: No se encontró la variable DATABASE_URL en el entorno.")

# Motor de conexión
engine = create_engine(URL_DATABASE)

# Creador de sesiones (cada petición HTTP abrirá una sesión temporal)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

# Clase base de la que heredarán nuestros modelos
Base = declarative_base()