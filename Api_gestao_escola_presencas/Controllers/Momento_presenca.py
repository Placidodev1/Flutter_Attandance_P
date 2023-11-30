from flask import jsonify, abort, Blueprint, request

from db import connection   


blp = Blueprint("momentopresenca", __name__)

# Returna detalhes de cada presenca selecionada
@blp.route("/momentopresenca/<int:idpresenca>", methods=["GET"])
def retorna_detalhes(idpresenca):
    try:
        
        query= """ SELECT * FROM momento_de_marcacao WHERE idPresenca = %s"""
        cursor = connection.cursor()
        cursor.execute(query, idpresenca)
        detalhes_presenca = cursor.fetchall()
        cursor.close()
        print(detalhes_presenca)
        return jsonify({"data": detalhes_presenca})
    except ValueError as e:
        return jsonify({"Erro":e})



@blp.route("/getpresenca/<int:idpresenca>", methods=["GET"])
def retorna_presenc(idpresenca):
    try:
        
        query= """ SELECT * FROM presenca WHERE idPresenca = %s"""
        cursor = connection.cursor()
        cursor.execute(query, idpresenca)
        presenca = cursor.fetchall()
        cursor.close()
        print(presenca)
        return jsonify({"data": presenca})
    except ValueError as e:
        return jsonify({"Erro":e})