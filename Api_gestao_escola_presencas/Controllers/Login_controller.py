from datetime import datetime, timedelta
from flask import Blueprint, jsonify, request
from flask_jwt_extended import create_access_token
import pymysql
from Services import get_funcionarios
from db import connection 

blp = Blueprint("Login",__name__)

@blp.route("/Login", methods=['POST'])
def login():
        try:
            usuario = request.json
            print(usuario)
            usuario1 = str(usuario['email'])
            print(usuario1)
            password = int(usuario['password'])
            print(password)
            cursor = connection.cursor()
            query = """SELECT id_Carrinha, Senha, idFuncionario, Email, Departamento, Cargo, Nome FROM funcionario WHERE (Email = %s AND Senha = %s)"""
            cursor.execute(query,( usuario1, password))
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
                cargo = user["Cargo"]
                departamento = user["Departamento"]
                access_token = create_access_token(identity=id)    

                return jsonify({"token": access_token, "id":id, "code":200, "Carinha": Carinha, "nome_user":user_name,  "cargo": cargo, "departamento": departamento } )
        except pymysql.err.InterfaceError as e:
            return(f"Erro de interface: {e}")
        except pymysql.err.DataError as e:
            return (f"Erro de formato de dados: {e}")
        except pymysql.err.IntegrityError as e:
            return f"Erro de integridade: {e}"
        except Exception as e:
            return(f"Erro desconhecido: {e}")




@blp.route("/Loginresponsavel", methods=['POST'])
def loginresponsavel():
            
            usuario = request.json
            cursor = connection.cursor()
            query = """SELECT idAluno, Senha, Email, Nome FROM aluno WHERE (Email = %s AND Senha = %s)"""
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
                id = int(user['idAluno'])
                
                user_name =  user['Nome']
                access_token = create_access_token(identity=id)    

                return jsonify({"token": access_token, "code":200, "nome_user":user_name, "idAluno":id  } )
            