from flask import jsonify, abort, Blueprint, request
import pymysql
from db import connection   
import datetime

blp = Blueprint("Verificadordepresenca", __name__)


# Marca a presenca aos alunos
@blp.route("/verificador_presenca/<int:selected_case>/<int:idcarinha>", methods=['GET'])
def VerificarMomento(selected_case, idcarinha):
    

    # Verifica existencia das presencas
    def Verificar_presenca_casa_escola_ida():
        try:
                data_atual = datetime.date.today()
                data_formatada = data_atual.strftime('%Y-%m-%d')

                query = "SELECT idAluno FROM aluno WHERE Id_carrinha = %s"
                cursor = connection.cursor()
                cursor.execute(query, (idcarinha))
                alunos = cursor.fetchall()


                
                query = """
                    SELECT p.Local_subida_escola_casa
                    FROM Presenca p
                    JOIN Aluno a ON p.idaluno = a.idaluno
                    WHERE a.Id_carrinha = %s AND p.Data_presenca = %s
                """
                cursor = connection.cursor()
                cursor.execute(query, (idcarinha, data_formatada))
                locais = cursor.fetchall()
                print(locais)

                if(len(alunos) == len(locais)):
                    return True
                else:
                    return False
   
        except Exception as e:
                return str(e)         
            
            
    # Verifica se ja pode entrar no segundo ciclo
    def Verificar_presenca_casa_escola_volta ():

            
            try:
                # Requisicao para saber se ja se marcou acima
                data_atual = datetime.date.today()
                data_formatada = data_atual.strftime('%Y-%m-%d')

                query = "SELECT idAluno FROM aluno WHERE Id_carrinha = %s"
                cursor = connection.cursor()
                cursor.execute(query, (idcarinha))
                alunos = cursor.fetchall()


                
                query = """
                    SELECT p.Local_subida_escola_casa
                    FROM Presenca p
                    JOIN Aluno a ON p.idaluno = a.idaluno
                    WHERE a.Id_carrinha = %s AND p.Data_presenca = %s
                """
                cursor = connection.cursor()
                cursor.execute(query, (idcarinha, data_formatada))
                locaisMomentoAnterior = cursor.fetchall()
                print(locaisMomentoAnterior)

                



                data_atual = datetime.date.today()
                data_formatada = data_atual.strftime('%Y-%m-%d')
                query = """
                    SELECT p.Local_descida_escola_casa
                    FROM Presenca p
                    JOIN Aluno a ON p.idaluno = a.idaluno
                    WHERE a.Id_carrinha = %s AND p.Data_presenca = %s
                """
                cursor = connection.cursor()
                cursor.execute(query, (idcarinha, data_formatada))
                locais = cursor.fetchall()
                print(locais)
                print("VVBJHBBJH")
                # print(locais)
                # Verificar se todos os locais estão preenchidos
                todos_preenchidos = True
                

                for local in locais:
                    print(local)
                    print("ahdad")
                    if local["Local_descida_escola_casa"] is None:
                        print(local)
                        print("ausdna")
                        todos_preenchidos = False
                        break  # Se encontrar pelo menos um None, podemos parar a verificação

                # Agora 'todos_preenchidos' será True se todos os elementos forem diferentes de None
                # Caso contrário, será False

                print("ujbjsjs")
                print(todos_preenchidos)
                if(len(alunos) == len(locaisMomentoAnterior)):
                    if todos_preenchidos:
                        resultado = True
                        return bool(resultado)
                    else:
                        resultado = False
                        return bool(resultado)
                else:
                    resultado = True
                    return bool(resultado)
                   
            except Exception as e:
                return str(e)
            



    def Verificar_presenca_escola_casa_ida():
        try:
                
                data_atual = datetime.date.today()
                data_formatada = data_atual.strftime('%Y-%m-%d')
                query = """
                    SELECT p.Local_descida_escola_casa
                    FROM Presenca p
                    JOIN Aluno a ON p.idaluno = a.idaluno
                    WHERE a.Id_carrinha = %s AND p.Data_presenca = %s
                """
                cursor = connection.cursor()
                cursor.execute(query, (idcarinha, data_formatada))
                locaisAcima = cursor.fetchall()
                print(locaisAcima)
                print("VVBJHBBJH")
                # print(locais)
                # Verificar se todos os locais do momento anterior estão preenchidos
                todos_preenchidosAcima = True

                
                

                for local in locaisAcima:
                    print(local)
                    print("ahdad")
                    if local["Local_descida_escola_casa"] is None:
                        print(local)
                        print("ausdna")
                        todos_preenchidosAcima = False
                        break  # Se encontrar pelo menos um None, podemos parar a verificação

                # Agora 'todos_preenchidos' será True se todos os elementos forem diferentes de None
                # Caso contrário, será False

                print("ujbjsjs")
                print(todos_preenchidosAcima)
                


                print("adaudand")
                data_atual = datetime.date.today()
                data_formatada = data_atual.strftime('%Y-%m-%d')
                query = """
                    SELECT p.Local_subida_escola_casa
                    FROM Presenca p
                    JOIN Aluno a ON p.idaluno = a.idaluno
                    WHERE a.Id_carrinha = %s AND p.Data_presenca = %s
                """
                cursor = connection.cursor()
                cursor.execute(query, (idcarinha, data_formatada))
                locais = cursor.fetchall()
                print(locais)
                print("VVBJHBBJH")
                # print(locais)
                # Verificar se todos os locais estão preenchidos
                todos_preenchidos = True

                for local in locais:
                    print(local)
                    print("ahdad")
                    if local["Local_subida_escola_casa"] is None:
                        print(local)
                        print("ausdna")
                        todos_preenchidos = False
                        break  # Se encontrar pelo menos um None, podemos parar a verificação

                # Agora 'todos_preenchidos' será True se todos os elementos forem diferentes de None
                # Caso contrário, será False
                if(todos_preenchidosAcima):
                    if todos_preenchidos:
                        resultado = True
                        return bool(resultado)
                    else:
                        resultado = False
                        return bool(resultado)
                else:
                    resultado = True
                    return bool(resultado)
                
        except Exception as e:
                return str(e)
        
    def Verificar_presenca_escola_casa_volta():
        try:
                
                data_atual = datetime.date.today()
                data_formatada = data_atual.strftime('%Y-%m-%d')
                query = """
                    SELECT p.Local_subida_escola_casa
                    FROM Presenca p
                    JOIN Aluno a ON p.idaluno = a.idaluno
                    WHERE a.Id_carrinha = %s AND p.Data_presenca = %s
                """
                cursor = connection.cursor()
                cursor.execute(query, (idcarinha, data_formatada))
                locaisAcima = cursor.fetchall()
                print(locaisAcima)
                print("VVBJHBBJH")
                # print(locais)
                # Verificar se todos os locais estão preenchidos
                todos_preenchidosAcima = True

                for local in locaisAcima:
                    print(local)
                    print("ahdad")
                    if local["Local_subida_escola_casa"] is None:
                        print(local)
                        print("ausdna")
                        todos_preenchidos = False
                        break  # Se encontrar pelo menos um None, podemos parar a verificação

                # Agora 'todos_preenchidos' será True se todos os elementos forem diferentes de None
                # Caso contrário, será False
                


                data_atual = datetime.date.today()
                data_formatada = data_atual.strftime('%Y-%m-%d')
                query = """
                    SELECT p.Local_descida_escola_casa
                    FROM Presenca p
                    JOIN Aluno a ON p.idaluno = a.idaluno
                    WHERE a.Id_carrinha = %s AND p.Data_presenca = %s
                """
                cursor = connection.cursor()
                cursor.execute(query, (idcarinha, data_formatada))
                locais = cursor.fetchall()
                print(locais)
                print("VVBJHBBJH")
                # print(locais)
                # Verificar se todos os locais estão preenchidos
                todos_preenchidos = True

                for local in locais:
                    print(local)
                    print("ahdad")
                    if local["Local_descida_escola_casa"] is None:
                        print(local)
                        print("ausdna")
                        todos_preenchidos = False
                        break  # Se encontrar pelo menos um None, podemos parar a verificação

                # Agora 'todos_preenchidos' será True se todos os elementos forem diferentes de None
                # Caso contrário, será False

                if(todos_preenchidosAcima):
                    if todos_preenchidos:
                        resultado = True
                        return bool(resultado)
                    else:
                        resultado = False
                        return bool(resultado)
                else:
                    resultado = True
                    return bool(resultado)
        except Exception as e:
                return str(e)

    if(selected_case == 1):
        result = Verificar_presenca_casa_escola_ida()
    elif(selected_case == 2):
        result = Verificar_presenca_casa_escola_volta()
    elif(selected_case == 3):
        result = Verificar_presenca_escola_casa_ida()
    elif(selected_case == 4):
        result = Verificar_presenca_escola_casa_volta()

    

    
    
    # if(Presenca is None):
    #     return jsonify({"code":200, "msg": "Sucesso"})
    # else:
    print(result)
    return jsonify({"situacao":result, "code":200, "msg": "Dados ja existem"})


    