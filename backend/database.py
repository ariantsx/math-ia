from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, declarative_base

# Cambia "usuario_postgres" y "tu_contraseña" por tus credenciales locales.
# "math_ia" es el nombre de la base de datos que creaste.
URL_DATABASE = "postgresql://postgres:12345@localhost:5432/math_ia"

# Motor de conexión
engine = create_engine(URL_DATABASE)

# Creador de sesiones (cada petición HTTP abrirá una sesión temporal)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

# Clase base de la que heredarán nuestros modelos
Base = declarative_base()