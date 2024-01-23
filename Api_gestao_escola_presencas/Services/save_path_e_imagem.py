import os
from flask import jsonify, request
from Models import Aluno
from db import connection

class SalvaImagemEPath():
    def adicionar_aluno_e_path():
        try:

            id = request.form['id']
            imagem = request.files['imagem']
            print("2")
            # Salvar a imagem no diretório static/imagens
            caminho_imagem = os.path.join('static/imagens', imagem.filename)
            imagem.save(caminho_imagem)
            print("3")
            # novo_aluno = Aluno(id, str(caminho_imagem))
            print("4")
            query = "UPDATE aluno SET `filepath` = %s WHERE idAluno = %s"
            cursor = connection.cursor()
            cursor.execute(query, (caminho_imagem, id))
            connection.commit()
            resultado = cursor.fetchone()
            print(resultado)
            

            return jsonify({'message': 'Aluno adicionado com sucesso!'})
        except Exception as e:
            return jsonify({'error': str(e)})
    def getPath():
        try:
            id = request.form['id']
            

            novo_aluno = Aluno(id)

            query = "SELECT filepath from aluno  WHERE idAluno = %s"
            cursor = connection.cursor()
            cursor.execute(query, (novo_aluno.id))
            connection.commit()
            resultado = cursor.fetchone()
            

            return jsonify({'message': 'Aluno adicionado com sucesso!'})
        except Exception as e:
            return jsonify({'error': str(e)})