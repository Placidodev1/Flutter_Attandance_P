import os
from flask import jsonify, request
from Models import Aluno
from db import connection

class LoadResponsavelService():
    def buscaNome(idAluno):
        try:
            query= """ SELECT responsavel.Nome
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