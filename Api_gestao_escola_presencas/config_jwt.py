from flask_jwt_extended import create_access_token, jwt_required
from jwt_config import jwt
from flask import request, jsonify
from app import app

# Suas rotas relacionadas à autenticação vão aqui
# Exemplo:



users = {
    "usuario": "senha"
}


@app.route('/api/login', methods=['POST'])
def login():
    username = request.json.get('username')
    password = request.json.get('password')

    if username in users and users[username] == password:
        # Cria um token de acesso com identidade do usuário
        access_token = create_access_token(identity=username)
        return jsonify(access_token=access_token), 200
    return jsonify({"message": "Credenciais inválidas"}), 401