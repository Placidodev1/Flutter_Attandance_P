from Services.save_path_e_imagem import SalvaImagemEPath
from db import connection
import os
from colorama import Cursor
from flask import Blueprint, jsonify, request, send_file
from pymysql import DBAPISet
from Models import Aluno


blp = Blueprint("get_imagens", __name__)


@blp.route('/get_image/<nomeImagem>')
def get_image( nomeImagem):
    
    image_path = os.path.join('static/imagens/', nomeImagem)
    return send_file(image_path, mimetype='image/png')


# Rota para adicionar um aluno
@blp.route('/adicionar_aluno', methods=['POST'])
def adicionar_aluno():
    try:
            print(request.form['id'])
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