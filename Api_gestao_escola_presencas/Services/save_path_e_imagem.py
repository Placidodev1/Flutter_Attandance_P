import os
from flask import jsonify, request
from Models import Aluno
from db import connection

class SalvaImagemEPath():
    def adicionar_aluno_e_path():
        try:
            id = request.form['id']
            imagem = request.files['imagem']

            # Salvar a imagem no diretório static/imagens
            caminho_imagem = os.path.join('static/imagens', imagem.filename)
            imagem.save(caminho_imagem)

            novo_aluno = Aluno(id, caminho_imagem)

            query = "UPDATE aluno SET `Local_subida_casa_escola` = %s WHERE idAluno = %s"
            cursor = connection.cursor()
            cursor.execute(query, (novo_aluno.id, novo_aluno.imagem_caminho))
            connection.commit()
            resultado = cursor.fetchone()
            

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