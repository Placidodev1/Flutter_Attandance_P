from flask import  Flask, request, jsonify
from flask_smorest import Api
from flask_sqlalchemy import SQLAlchemy
from Controllers import blpAluno, blpCArinha, blpPresenca, BlpFuncionario


app = Flask(__name__)
app.config.from_pyfile('config.py')

app.register_blueprint(BlpFuncionario)
app.register_blueprint(blpAluno)
app.register_blueprint(blpCArinha)
app.register_blueprint(blpPresenca)

app.run(debug=True)

# from flask import Flask, request, jsonify
# from flask_jwt_extended import JWTManager, jwt_required, create_access_token, get_jwt_identity

# app = Flask(__name__)

# # Configuração do Flask-JWT-Extended
# app.config['JWT_SECRET_KEY'] = 'super-secret'  # Chave secreta para assinar os tokens (deve ser mantida segura)
# jwt = JWTManager(app)

# # Lista de usuários (geralmente você terá um banco de dados)
# users = {
#     "usuario": "senha"
# }

# @app.route('/api/login', methods=['POST'])
# def login():
#     username = request.json.get('username')
#     password = request.json.get('password')

#     if username in users and users[username] == password:
#         # Cria um token de acesso com identidade do usuário
#         access_token = create_access_token(identity=username)
#         return jsonify(access_token=access_token), 200
#     return jsonify({"message": "Credenciais inválidas"}), 401

# @app.route('/api/secure', methods=['GET'])
# @jwt_required()
# def secure_resource():
#     current_user = get_jwt_identity()
#     return jsonify(message=f'Usuário autenticado: {current_user}')

# if __name__ == '__main__':
#     app.run(debug=True)



