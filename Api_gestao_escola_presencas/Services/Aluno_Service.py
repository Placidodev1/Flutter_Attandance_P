# from flask import request, jsonify, json
# from flask_smorest import abort
# from sqlalchemy.exc import SQLAlchemyError, IntegrityError
# from Models import AlunoModel  # Import AlunoModel

# from db import db

# class AlunoService():
#     def reg_Aluno(self, idAluno, Nome, Genero, Telefone_do_responsavel, Endereco, Senha,codigo_da_escola, QRCode, FaceId, Barcode, Foto, Id_carrinha):
#         try:
#             # Create a new AlunoModel object and set its attributes
#             aluno = AlunoModel(
#                 idAluno=idAluno,
#                 Nome=Nome,
#                 Genero=Genero,
#                 Telefone_do_responsavel=Telefone_do_responsavel,
#                 Endereco=Endereco,
#                 Senha=Senha,
#                 codigo_da_escola=codigo_da_escola,
#                 QRCode=QRCode,
#                 FaceId=FaceId,
#                 Barcode=Barcode,
#                 Foto=Foto,
#                 Id_carrinha=Id_carrinha
#             )

#             db.session.add(aluno)
#             db.session.commit()

#             return jsonify({"message": "Aluno registrado com sucesso"}), 201

#         except IntegrityError as e:
#             # Handle integrity constraint violation, e.g., duplicate student
#             db.session.rollback()
#             return jsonify({"message": "Erro de integridade: Este aluno já está registrado"}), 400

#         except SQLAlchemyError as e:
#             # Handle other database-related errors
#             db.session.rollback()
#             return jsonify({"message": "Erro interno do servidor ao registrar o aluno"}), 500
