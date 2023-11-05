from db import db
from sqlalchemy import Column, Integer, String

class CarrinhaModel(db.Model):
    __tablename__ = "Carinha"

    idCarinha = Column(Integer, primary_key=True)
    Capacidade_Maxima = Column(Integer, nullable=True)
    Detalhes_Adicionais = Column(String(100), nullable=True)
    Tipo_de_Carinha = Column(String(45), nullable=True)
    Foto = Column(String(220), nullable=True)
