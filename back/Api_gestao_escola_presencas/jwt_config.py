# jwt_config.py

from flask_jwt_extended import JWTManager

jwt = JWTManager()

# Configure sua chave secreta
SECRET_KEY = 'your-secret-key'
                                                                                     
# Outras configurações do JWTManager vão aqui
