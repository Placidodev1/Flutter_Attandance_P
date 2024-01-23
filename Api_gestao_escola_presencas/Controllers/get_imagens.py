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
    return SalvaImagemEPath.adicionar_aluno_e_path()