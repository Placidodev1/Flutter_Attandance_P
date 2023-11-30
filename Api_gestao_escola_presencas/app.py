from flask import  Flask, request, jsonify
from flask_jwt_extended import JWTManager
from flask_smorest import Api
from flask_sqlalchemy import SQLAlchemy
from Controllers import blpAluno, blpCArinha, blpPresenca, BlpFuncionario, BlpLogin, BlpVerificadordepresenca, BlpMomentoPresenca
import asyncio, aiohttp

app = Flask(__name__)
app.config.from_pyfile('config.py')
app.register_blueprint(BlpVerificadordepresenca)
app.register_blueprint(BlpFuncionario)
app.register_blueprint(blpAluno)
app.register_blueprint(blpCArinha)
app.register_blueprint(blpPresenca)
app.register_blueprint(BlpLogin)
app.register_blueprint(BlpMomentoPresenca)
app.config['JWT_SECRET_KEY'] = 'sua_chave_secreta_aqui'  # Substitua pela sua chave secreta
jwt = JWTManager(app)


app.run(debug=True)

# from flask import Flask, request, jsonify
# import jwt
# from functools import wraps

# app = Flask(__name__)
# app.config['SECRET_KEY'] = 'your_secret_key'

# # Simulando uma base de dados de usuários
# users = {'user1': 'password1', 'user2': 'password2'}

# # Função para gerar token JWT
# def generate_token(username):
#     payload = {'username': username}
#     token = jwt.encode(payload, app.config['SECRET_KEY'], algorithm='HS256')
#     return token

# # Função de autenticação
# def authenticate(username, password):
#     if username in users and users[username] == password:
#         return True
#     return False

# # Função para verificar token JWT
# def token_required(f):
#     @wraps(f)
#     def decorated(*args, **kwargs):
#         token = request.headers.get('Authorization')
#         if not token:
#             return jsonify({'message': 'Token está ausente'}), 401

#         try:
#             data = jwt.decode(token, app.config['SECRET_KEY'], algorithms=['HS256'])
#         except:
#             return jsonify({'message': 'Token é inválido'}), 401

#         return f(*args, **kwargs)

#     return decorated

# # Rota de autenticação
# @app.route('/login', methods=['POST'])
# def login():
#     auth = request.authorization

#     if not auth or not authenticate(auth.username, auth.password):
#         return jsonify({'message': 'Falha na autenticação'}), 401

#     token = generate_token(auth.username)
#     return jsonify({'token': token})

# # Rota protegida
# @app.route('/protected', methods=['GET'])
# @token_required
# def protected():
#     return jsonify({'message': 'Recurso protegido!'})

# if __name__ == '__main__':
#     app.run(debug=True)
