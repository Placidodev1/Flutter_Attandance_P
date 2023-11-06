from flask import jsonify, abort, Blueprint
from db import connection

blp = Blueprint("Carinha", __name__)

@blp.route("/Carinha", methods=["GET"])
def get_carrinhas():
    try:
        query = "SELECT * FROM carinha;"
        cursor = connection.cursor()
        cursor.execute(query)
        carinha = cursor.fetchall()
        cursor.close()

        if not carinha:
            # Se a consulta retornar uma lista vazia, você pode retornar um HTTP 404.
            abort(404)
        else:
            return jsonify({"data": carinha})
    except pymysql.Error as db_error:
        # Captura exceções relacionadas ao banco de dados.
        return jsonify({"message": str(db_error), "code": 500}), 500
    except Exception as ex:
        # Captura exceções gerais.
        return jsonify({"message": str(ex), "code": 500}), 500
    
    
@blp.route("/Carinha/<int:id>", methods=["GET"])
def get_carrinha(id):
    try:
        query = f"SELECT * FROM carinha WhERE idCarinha = {id};"
        cursor = connection.cursor()
        cursor.execute(query)
        carinha = cursor.fetchall()
        cursor.close()

        if not carinha:
            # Se a consulta retornar uma lista vazia, você pode retornar um HTTP 404.
            abort(404)
        else:
            return jsonify({"data": carinha})
    except pymysql.Error as db_error:
        # Captura exceções relacionadas ao banco de dados.
        return jsonify({"message": str(db_error), "code": 500}), 500
    except Exception as ex:
        # Captura exceções gerais.
        return jsonify({"message": str(ex), "code": 500}), 500