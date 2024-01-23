from Services.dados_responsavel import LoadResponsavelService
from db import connection   
from flask import jsonify, abort, Blueprint, request


blp = Blueprint("DadosResponsavel", __name__)


# Marca a presenca aos alunos
@blp.route("/responsavel/<int:idAluno>", methods=['GET'])
def buscaResponsavel(idAluno):
    return LoadResponsavelService.buscaNome(idAluno)
