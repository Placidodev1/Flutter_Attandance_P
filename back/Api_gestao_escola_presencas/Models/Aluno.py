# from sqlalchemy import Column, Integer, String, ForeignKey
# from sqlalchemy.orm import relationship
# from app import db 

# class AlunoModel(db.Model):
#     __tablename__ = 'Aluno'

#     idAluno = Column(Integer, primary_key=True)
#     Nome = Column(String(100), nullable=True)
#     Genero = Column(String(45), nullable=True)
#     Telefone_do_responsavel = Column(Integer, nullable=True)
#     Endereco = Column(String(100), nullable=True)
#     Senha = Column(Integer, nullable=True)
#     codigo_da_escola = Column(Integer, nullable=True)
#     QRCode = Column(String(220), nullable=True)
#     FaceId = Column(String(220), nullable=True)
#     Barcode = Column(Integer, nullable=True)
#     Foto = Column(String(220), nullable=True)
#     Id_carrinha = Column(Integer, ForeignKey('Carinha.idCarinha'), nullable=False)

#     carrinha = relationship('Carinha', back_populates='alunos', cascade="all, delete")
