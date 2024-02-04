import os
from flask import jsonify, request
from Models import Aluno
from db import connection

class LoadResponsavelService():
    def buscaDados(idAluno):
        try:
            query= """ SELECT *
                    FROM responsavel
                    INNER JOIN aluno ON responsavel.idResponsavel = aluno.id_Responsavel Where idAluno = %s;
                    """
            cursor = connection.cursor()
            cursor.execute(query, idAluno)
            responsavel = cursor.fetchall()
            cursor.close()
            return jsonify({"data": responsavel})
        except ValueError as e:
            return jsonify({"data":e})
        
    
    def buscaTodosDados():
        try:
            query= """ SELECT * FROM responsavel
                    """
            cursor = connection.cursor()
            cursor.execute(query)
            responsavel = cursor.fetchall()
            print(responsavel)
            cursor.close()
            return jsonify({"data": responsavel})
        except ValueError as e:
            return jsonify({"data":e})