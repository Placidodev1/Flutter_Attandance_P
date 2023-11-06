from flask import Blueprint, jsonify, request
from Services import get_funcionarios
from db import connection


blp = Blueprint("Funcionarios",__name__)


@blp.route("/Get_funcionario", methods=["GET"])
def Get_funcionarios():
    return get_funcionarios.get_funcionarios()


@blp.route("/Get_funcionario_especifico/<int:idFuncionario>", methods=["GET"])
def Get_funcionario_especifico(idFuncionario):
    return get_funcionarios.get_funcionario_especifico(idFuncionario)


@blp.route("/funcionario", methods=["POST"])
def inserir_funcionario_controller():
    
    try:
        data = request.get_json()
        idFuncionario = data["idFuncionario"]
        nome = data["Nome"]
        genero = data["Genero"]
        email = data["Email"]
        telefone = data["Telefone_do_responsavel"]
        endereco = data["Endereco"]
        senha = data["Senha"]
        cargo = data["Cargo"]
        departamento = data["Departamento"]
        id_carrinha = data["id_Carrinha"]
        return get_funcionarios.inserir_funcionario(idFuncionario, nome, genero, email, telefone, endereco, senha, cargo, departamento, id_carrinha)
        # if get_funcionarios.inserir_funcionario(nome, genero, email, telefone, endereco, senha, cargo, departamento, id_carrinha):
        #     return jsonify({"message": "Funcionário inserido com sucesso"})
        # else:
        #     return jsonify({"error": "Erro ao inserir o funcionário", "code": 500}), 500
    except Exception as ex:
        return jsonify({"error": str(ex), "code": 500}), 500
