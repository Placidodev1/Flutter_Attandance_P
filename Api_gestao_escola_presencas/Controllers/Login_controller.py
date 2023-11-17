from datetime import datetime, timedelta
from flask import Blueprint, jsonify, request
from flask_jwt_extended import create_access_token
from Services import get_funcionarios
from db import connection 

blp = Blueprint("Login",__name__)

@blp.route("/Login", methods=['POST'])
def login():
            
            usuario = request.json
            cursor = connection.cursor()
            query = """SELECT id_Carrinha, Senha, idFuncionario, Email, Nome FROM funcionario WHERE (Email = %s AND Senha = %s)"""
            cursor.execute(query,( usuario['email'], int(usuario['password'])))
            user = cursor.fetchone()
            cursor.close()
            print(user)
            
            # expira
            exptime = datetime.now() + timedelta(minutes=15)
            exp_epoc_time = exptime.timestamp()


            

            if user is None:
                return jsonify({"msg": "Username ou password incorrecto", "code":401})
            else:
                id = int(user['idFuncionario'])
                Carinha= user['id_Carrinha']
                user_name =  user['Nome']
                access_token = create_access_token(identity=id)    

                return jsonify({"token": access_token, "id":user_name, "code":200, "Carinha": Carinha, "nome_user":user_name  } )
            