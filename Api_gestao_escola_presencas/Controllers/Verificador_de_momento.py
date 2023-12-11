import json
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
                # Busca todos alunos de uma determinada carinha
                query = "SELECT idAluno FROM aluno WHERE Id_carrinha = %s"
                cursor = connection.cursor()
                cursor.execute(query, (idcarinha))
                alunos = cursor.fetchall()


                # Busca o local para os alunos da carinha em questao
                query = """
                    SELECT p.Local_subida_casa_escola
                    FROM Presenca p
                    JOIN Aluno a ON p.idaluno = a.idaluno
                    WHERE a.Id_carrinha = %s AND p.Data_presenca = %s
                """
                cursor = connection.cursor()
                cursor.execute(query, (idcarinha, data_formatada))
                locais = cursor.fetchall()
                # print(locais)

                # Verifica se as duas listas tem o mesmo tamanho para determinar o acesso a marcacao
                if(len(alunos) == len(locais)):
                    return jsonify({"situacao": True, "msg": "Marcacao feita"})
                else:
                    return jsonify({"situacao": False, "msg": "Pode efetuar"})
   
        except Exception as e:
                return str(e)         
            
            
    # Verifica se ja pode entrar no segundo ciclo
    def Verificar_presenca_casa_escola_volta ():

            
            try:
                # Requisicao para saber se ja se marcou acima
                data_atual = datetime.date.today()
                data_formatada = data_atual.strftime('%Y-%m-%d')
                # Busca todos alunos de uma determinada carinha
                query = "SELECT idAluno FROM aluno WHERE Id_carrinha = %s"
                cursor = connection.cursor()
                cursor.execute(query, (idcarinha))
                alunos = cursor.fetchall()
                

                # Busca o local para os alunos da carinha em questao para verificar se o momento acima foi marcado
                query = """
                    SELECT p.Local_subida_casa_escola
                    FROM Presenca p
                    JOIN Aluno a ON p.idaluno = a.idaluno
                    WHERE a.Id_carrinha = %s AND p.Data_presenca = %s
                """
                cursor = connection.cursor()
                cursor.execute(query, (idcarinha, data_formatada))
                locaisMomentoAnterior = cursor.fetchall()
                

                



                data_atual = datetime.date.today()
                data_formatada = data_atual.strftime('%Y-%m-%d')
                query = """
                    SELECT p.Local_descida_casa_escola
                    FROM Presenca p
                    JOIN Aluno a ON p.idaluno = a.idaluno
                    WHERE a.Id_carrinha = %s AND p.Data_presenca = %s
                """
                cursor = connection.cursor()
                cursor.execute(query, (idcarinha, data_formatada))
                locais = cursor.fetchall()
                # print(locais)
                # print(locais)
                # print("VVBJHBBJH")
                # print(locais)

                # Verificar se todos os locais estão preenchidos
                todos_preenchidos = True
                # print(todos_preenchidos)

                # Caso algum aluno nao estiver preechido ira retornar false
                for local in locais:
                    # print(local)
                    valor = local['Local_descida_casa_escola']
                    
                    if valor is None:
                        print(valor)
                        # print("ausdna")
                        todos_preenchidos = False
                        # print(todos_preenchidos)
                        break  # Se encontrar pelo menos um None, podemos parar a verificação
                

                # Verifica se as duas listas tem o mesmo tamanho para determinar o acesso a marcacao
                if(len(alunos) == len(locaisMomentoAnterior)):
                    print("yes")
                    if todos_preenchidos:
                        resultado = True
                        return jsonify({"situacao": bool(resultado), "msg": "Marcacao feita"})
                    else:
                        resultado = False
                        return jsonify({"situacao": bool(resultado), "msg": "Pode efetuar"})
                else:
                    resultado = True
                    return jsonify({"situacao": bool(resultado), "msg": "Termine a marcacao acima"})
                   
            except Exception as e:
                return str(e)
            



    def Verificar_presenca_escola_casa_ida():
        try:
                


                data_atual = datetime.date.today()
                data_formatada = data_atual.strftime('%Y-%m-%d')
                # Busca todos alunos de uma determinada carinha
                query = "SELECT idAluno FROM aluno WHERE Id_carrinha = %s"
                cursor = connection.cursor()
                cursor.execute(query, (idcarinha))
                alunos = cursor.fetchall()
                
                data_atual = datetime.date.today()
                data_formatada = data_atual.strftime('%Y-%m-%d')
                query = """
                    SELECT p.Local_descida_casa_escola
                    FROM Presenca p
                    JOIN Aluno a ON p.idaluno = a.idaluno
                    WHERE a.Id_carrinha = %s AND p.Data_presenca = %s
                """
                cursor = connection.cursor()
                cursor.execute(query, (idcarinha, data_formatada))
                locaisAcima = cursor.fetchall()
                
                # Verificar se todos os locais do momento anterior estão preenchidos
                todos_preenchidosAcima = True
                
                
                if len(locaisAcima) == 0:
                     todos_preenchidosAcima = False

                for local in locaisAcima:
                    # print(local)
                    # print("ahdad")
                    if local["Local_descida_casa_escola"] is None:
                        
                        todos_preenchidosAcima = False
                        break  # Se encontrar pelo menos um None, podemos parar a verificação

                # Agora 'todos_preenchidos' será True se todos os elementos forem diferentes de None
                # Caso contrário, será False

                # print("ujbjsjs")
                # print(todos_preenchidosAcima)
                


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
                
                todos_preenchidos = True

                for local in locais:
                    print(local)
                    print("ahdad")
                    if local["Local_subida_escola_casa"] is None:
                        
                        todos_preenchidos = False
                        break  # Se encontrar pelo menos um None, podemos parar a verificação

                # Agora 'todos_preenchidos' será True se todos os elementos forem diferentes de None
                # Caso contrário, será False
                print(todos_preenchidosAcima and len(alunos) == len(locaisAcima))
                if(todos_preenchidosAcima):
                    if todos_preenchidos:
                        resultado = True
                        return jsonify({"situacao": bool(resultado), "msg": "Marcacao feita"})
                    else:
                        resultado = False
                        return jsonify({"situacao": bool(resultado), "msg": "Pode efetuar"})
                else:
                    resultado = True
                    return jsonify({"situacao": bool(resultado), "msg": "Termine a marcacao acima"})
                
        except Exception as e:
                return str(e)
        
    def Verificar_presenca_escola_casa_volta():
        try:
                
                
                # Busca todos alunos de uma determinada carinha
                query = "SELECT idAluno FROM aluno WHERE Id_carrinha = %s"
                cursor = connection.cursor()
                cursor.execute(query, (idcarinha))
                alunos = cursor.fetchall()
                


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
                # print("VVBJHBBJH")
                # print(locais)
                # Verificar se todos os locais estão preenchidos
                todos_preenchidosAcima = True
                
                if len(locaisAcima) == 0:
                     print("adada")
                     todos_preenchidosAcima = False

                for local in locaisAcima:
                    # print(local)
                    print("ahdad")
                    if local["Local_subida_escola_casa"] is None:
                        # print(local)
                        # print("ausdna")
                        todos_preenchidosAcima = False
                        break  # Se encontrar pelo menos um None, podemos parar a verificação

                
                


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
                    # print(local)
                    # print("ahdad")
                    if local["Local_descida_escola_casa"] is None:
                       
                        todos_preenchidos = False
                        break  # Se encontrar pelo menos um None, podemos parar a verificação

                

                if(todos_preenchidosAcima ):
                    if todos_preenchidos:
                        resultado = True
                        return jsonify({"situacao": bool(resultado), "msg": "Marcacao feita"})
                    else:
                        resultado = False
                        return jsonify({"situacao": bool(resultado), "msg": "Pode efetuar"})
                else:
                    resultado = True
                    return jsonify({"situacao": bool(resultado), "msg": "Termine a marcacao acima"})
        except Exception as e:
                return str(e)

    if(selected_case == 1):
        result = Verificar_presenca_casa_escola_ida()
    elif(selected_case == 2):
        result = Verificar_presenca_casa_escola_volta()
        print(result)
    elif(selected_case == 3):
        result = Verificar_presenca_escola_casa_ida()
    elif(selected_case == 4):
        result = Verificar_presenca_escola_casa_volta()

    
   

    resultadotxt = result.get_data(as_text=True)
    # Parse do JSON para um objeto Python
    objeto_json = json.loads(resultadotxt)

    # Acesse os valores associados às chaves
    valor_msg = objeto_json.get('msg')
    valor_situacao = objeto_json.get('situacao')

    print(resultadotxt)
    return jsonify({"situacao":valor_situacao, "code":200, "msg":valor_msg })


    