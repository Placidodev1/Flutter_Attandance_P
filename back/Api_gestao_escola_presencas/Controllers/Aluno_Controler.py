
from flask import Blueprint
from db import  connection
from flask import jsonify,abort

blp = Blueprint("aluno", __name__)

@blp.route("/Alunos")
class Get_aluno():

#   LISTAR TODOS Alunos 
   def get_all_alunos(self):
        try:
            query = """SELECT * FROM aluno;"""
            cursor = connection.cursor()
            cursor.execute(query)
            aluno = cursor.fetchall()
            cursor.close()
        except Exception as ex:
            return jsonify({"message":str(ex),"code":500})
        if aluno is None:
            abort(404)
        return jsonify({"data": aluno })
   
@blp.route("/Aluno_especifico/<int:idAluno>")

#   LISTAR unico aluno 
def get_all_alunos( idAluno):
    try:
        query = """SELECT * FROM aluno WHERE idAluno = %s;"""
        cursor = connection.cursor()
        cursor.execute(query, idAluno)
        aluno_especifico = cursor.fetchall()
        cursor.close()
    except Exception as ex:
        return jsonify({"message":str(ex),"code":500})
    if aluno_especifico is None:
        abort(404)
    return jsonify({"data": aluno_especifico })