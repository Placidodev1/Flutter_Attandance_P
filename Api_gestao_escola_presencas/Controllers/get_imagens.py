
import os
from flask import Blueprint, request, send_file


blp = Blueprint("get_imagens", __name__)


@blp.route('/get_image/<nomeImagem>')
def get_image( nomeImagem):
    # Retorna a imagem do diretório 'static/images'
    image_path = os.path.join('static/imagens/', nomeImagem)
    return send_file(image_path, mimetype='image/png')