from flask import jsonify
from db import connection

class get_funcionarios():
    def get_funcionarios():
        try:
            query = """
                SELECT * 
                FROM funcionario;
            """
            cursor = connection.cursor()
            cursor.execute(query)
            funcionarios = cursor.fetchall()
            cursor.close()

            return jsonify({"data": funcionarios})
        except Exception as ex:
            return jsonify({"message": str(ex), "code": 500}), 500
        
    def get_funcionario_especifico(idFuncionario):
        try: 
            query= f"""
                SELECT * FROM funcionario WHERE idFuncionario = {idFuncionario};
                """
            cursor = connection.cursor()
            cursor.execute(query)
            funcionario_especifico = cursor.fetchall()
            cursor.close()
            return jsonify({"data": funcionario_especifico})
        except Exception as ex:
            return jsonify({"data": str(ex), "code": 500}), 500
    

    def inserir_funcionario(idFuncionario, Nome, Genero, Email, Telefone_do_responsavel, Endereco, Senha, Cargo, Departamento, id_Carrinha):
        
        try:
            query = f"""
                INSERT INTO funcionario (idFuncionario, Nome, Genero, Email, Telefone_do_responsavel, Endereco, Senha, Cargo, Departamento, id_Carrinha)
                VALUES ('{idFuncionario}', '{Nome}', '{Genero}', '{Email}', {Telefone_do_responsavel}, '{Endereco}', '{Senha}', '{Cargo}', '{Departamento}', {id_Carrinha});
            """
            cursor = connection.cursor()
            cursor.execute(query)
            connection.commit()
            cursor.close()
            
            return {"message": "Funcionário inserido com sucesso"}
        except Exception as ex:
            return {"error": str(ex)}

