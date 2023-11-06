# from db import db
# from sqlalchemy import Column, Integer, String, ForeignKey
# from sqlalchemy.orm import relationship

# class FuncionarioModel(db.Model):
#     __tablename__ = "Funcionario"

#     idFuncionario = Column(Integer, primary_key=True)
#     Nome = Column(String(100))
#     Genero = Column(String(45))
#     Email = Column(String(220), unique=True)
#     Telefone_do_responsavel = Column(Integer)
#     Endereco = Column(String(100))
#     Senha = Column(Integer)
#     Cargo = Column(String(45))
#     Departamento = Column(String(45))

#     id_Carrinha = Column(Integer, ForeignKey('Carinha.idCarinha', ondelete='CASCADE', onupdate='CASCADE'))
#     carrinha = relationship('CarrinhaModel') 
    