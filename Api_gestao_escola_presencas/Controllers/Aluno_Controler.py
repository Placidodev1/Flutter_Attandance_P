
from flask import Blueprint
from db import  connection
from flask import jsonify,abort

blp = Blueprint("aluno", __name__)

# @blp.route("/Alunos")
# class Get_aluno():

# #   LISTAR TODOS Alunos 
#    def get_all_alunos(self):
#         try:
#             query = """SELECT * FROM aluno;"""
#             cursor = connection.cursor()
#             cursor.execute(query)
#             aluno = cursor.fetchall()
#             cursor.close()
#         except Exception as ex:
#             return jsonify({"message":str(ex),"code":500})
#         if aluno is None:
#             abort(404)
#         return jsonify({"data": aluno })


@blp.route("/Alunos", methods=["GET"])
def get_all_alunos():
    try:
        query = "SELECT * FROM aluno;"
        cursor = connection.cursor()
        cursor.execute(query)
        aluno = cursor.fetchall()
        cursor.close()

        if not aluno:
            # Se a consulta retornar uma lista vazia, você pode retornar um HTTP 404.
            abort(404)
        else:
            return jsonify({"data": aluno})
    # except pymysql.Error as db_error:
    #     # Captura exceções relacionadas ao banco de dados.
    #     return jsonify({"message": str(db_error), "code": 500}), 500
    except Exception as ex:
        # Captura exceções gerais.
        return jsonify({"message": str(ex), "code": 500}), 500
    

@blp.route("/Alunos_carinha/<int:nrcarinha>", methods=["GET"])
def get_all_alunos_carinha(nrcarinha):
    try:
        query = "SELECT * FROM aluno where id_Carrinha = %s;"
        cursor = connection.cursor()
        cursor.execute(query, nrcarinha)
        aluno = cursor.fetchall()
        cursor.close()

        if not aluno:
            # Se a consulta retornar uma lista vazia, você pode retornar um HTTP 404.
            abort(404)
        else:
            return jsonify({"data": aluno})
    # except pymysql.Error as db_error:
    #     # Captura exceções relacionadas ao banco de dados.
    #     return jsonify({"message": str(db_error), "code": 500}), 500
    except Exception as ex:
        # Captura exceções gerais.
        return jsonify({"message": str(ex), "code": 500}), 500
    


   
@blp.route("/Aluno_especifico/<int:idAluno>")

#   LISTAR unico aluno 
def get__1_aluno( idAluno):
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



@blp.route("/Aluno_especifico_Barcode/<int:Barcode>")

#   LISTAR unico aluno 
def get_1_Barcode_aluno( Barcode):
    try:
        query = """SELECT * FROM aluno WHERE Barcode = %s;"""
        cursor = connection.cursor()
        cursor.execute(query, Barcode)
        aluno_especifico = cursor.fetchall()
        cursor.close()
    except Exception as ex:
        return jsonify({"message":str(ex),"code":500})
    if aluno_especifico is None:
        abort(404)
    return jsonify({"data": aluno_especifico })


@blp.route("/Aluno_especifico_QRcode/<string:QRCode>")

#   LISTAR unico aluno 
def get_1_QRCode_aluno(QRCode):
    try:
        query = """SELECT * FROM aluno WHERE QRCode = %s;"""
        cursor = connection.cursor()
        cursor.execute(query, QRCode)
        aluno_especifico = cursor.fetchall()
        cursor.close()
    except Exception as ex:
        return jsonify({"message":str(ex),"code":500})
    if aluno_especifico is None:
        abort(404)
    return jsonify({"data": aluno_especifico })