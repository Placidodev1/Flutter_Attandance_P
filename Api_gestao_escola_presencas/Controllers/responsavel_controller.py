from Services.dados_responsavel import LoadResponsavelService
from db import connection   
from flask import jsonify, abort, Blueprint, request


blp = Blueprint("DadosResponsavel", __name__)


# Busca responsavel especifico
@blp.route("/responsavel/<int:idAluno>", methods=['GET'])
def buscaResponsavel(idAluno):
    return LoadResponsavelService.buscaDados(idAluno)

# Busca todos os responsaveis 
@blp.route("/responsaveis", methods=['GET'])
def buscaTodosResponsaveis():
    return LoadResponsavelService.buscaTodosDados()
