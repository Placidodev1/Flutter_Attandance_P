import json
from flask import jsonify, abort, Blueprint, request
import pymysql
from db import connection   
import datetime
import logging
import asyncio

blp = Blueprint("presenca", __name__)

# Return all of the presenca of the day
@blp.route("/Presenca_dia/<string:date>", methods=["GET"])
def retorna_dia(date):
    try:
        date_obj = datetime.datetime.strptime(date, "%Y-%m-%d")
        query= """ SELECT * FROM presenca WHERE Data_presenca = %s"""
        cursor = connection.cursor()
        cursor.execute(query, date_obj)
        presencadia = cursor.fetchall()
        cursor.close()
        return jsonify({"data": presencadia})
    except ValueError as e:
        return jsonify({"data":e})

# Return all of the presenca of the day
@blp.route("/Presenca_dia_aluno/<string:date>/<int:idaluno>", methods=["GET"])
def retorna_dia_aluno(date, idaluno):
    try:
        date_obj = datetime.datetime.strptime(date, "%Y-%m-%d")
        query= """ SELECT * FROM presenca WHERE (Data_presenca = %s) AND (idAluno = %s)"""
        cursor = connection.cursor()
        cursor.execute(query, (date_obj, idaluno))
        presencadia = cursor.fetchall()
        cursor.close()
        return jsonify({"data": presencadia})
    except ValueError:
        return jsonify({"data":"abidanid"})
    
    
# Return all of the presenca of the aluno
@blp.route("/Presenca_aluno/<string:filter_type>/<int:idaluno>", methods=["GET"])
def get_Presenca_aluno(filter_type, idaluno):
    try:
        sql_filtros = "1=1"
        if "dia" in filter_type:
            if filter_type == "dia":
                sql_filtros += f""" AND DAY(Data_presenca) = DAY(NOW()) """
                
        if "semana" in filter_type:
            if filter_type == "semana":
                sql_filtros += f""" AND WEEK(Data_presenca) = WEEK(NOW()) """

        if "mes" in filter_type:
            if filter_type == "mes":
                sql_filtros += f""" AND MONTH(Data_presenca) = MONTH(NOW()) """
                
                
        if "ano" in filter_type:
            if filter_type == "ano":
                sql_filtros += f""" AND YEAR(Data_presenca)  = YEAR(NOW()) """

        if "todos" in filter_type:
            if filter_type == "todos":
                querytodos = """SELECT * FROM presenca WHERE idAluno = %s"""
                cursor = connection.cursor()
                cursor.execute(querytodos, idaluno)
                presenca1 = cursor.fetchall()
                cursor.close
                return jsonify({"data": presenca1})
                        
        query = f"""SELECT * FROM presenca WHERE   {sql_filtros} AND idAluno = %s  ;"""
        cursor = connection.cursor()
        cursor.execute(query, idaluno)
        presenca = cursor.fetchall()
        cursor.close()
        print("aqui")
        print(presenca)

        return jsonify({"data": presenca})

    except Exception as e:
    
        return jsonify({"error": str(e)})


#  Return the presenca depending wheather is a day, week, niuth, year or all
@blp.route("/Presenca/<string:filter_type>", methods=["GET"])

def get_Presenca(filter_type):
    sql_filtros = "1=1"
    if "dia" in filter_type:
        if filter_type == "dia":
            sql_filtros += f""" AND DAY(Data_presenca) = DAY(NOW()) """
            
    if "semana" in filter_type:
        if filter_type == "semana":
            sql_filtros += f""" AND WEEK(Data_presenca) = WEEK(NOW()) """

    if "mes" in filter_type:
        if filter_type == "mes":
            sql_filtros += f""" AND MONTH(Data_presenca) = MONTH(NOW()) """
            
            
    if "ano" in filter_type:
        if filter_type == "ano":
            sql_filtros += f""" AND YEAR(Data_presenca)  = YEAR(NOW()) """

    if "todos" in filter_type:
        if filter_type == "todos":
            querytodos = """SELECT * FROM presenca"""
            cursor = connection.cursor()
            cursor.execute(querytodos)
            presenca1 = cursor.fetchall()
            cursor.close
            return jsonify({"data": presenca1})
                    
    query = f"""SELECT * FROM presenca WHERE   {sql_filtros}   ;"""
  
    cursor = connection.cursor()
    cursor.execute(query)
    presenca = cursor.fetchall()
    cursor.close()
    

    return jsonify({"data": presenca})




def Verificar_presenca(idAluno):
    try:
        data_atual = datetime.datetime.now()
        data_formatada = data_atual.strftime('%Y-%m-%d')
        query = "SELECT * FROM Presenca WHERE idAluno = %s AND Data_presenca = %s"
        cursor = connection.cursor()
        cursor.execute(query, (idAluno, data_formatada ))
        resultado = cursor.fetchone()
        if(resultado):
            print(resultado)
            return resultado
        # else:
        #     return jsonify({"msg":"Aluno nao existe", "code": 400})
        # else:
        #     return "ERRO"
    except pymysql.err.InterfaceError as e:
        return(f"Erro de interface: {e}")
    except Exception as e:
        return(f"Erro desconhecido: {e}")
    except logging as e: 
        return (f"Erro desconhecido: {e}")

# Marca a presenca aos alunos
@blp.route("/marcar_presenca/<int:idAluno>/<int:selected_case>", methods=['POST'])
def marcar_presenca(idAluno, selected_case):
    Presenca = Verificar_presenca(idAluno)
    # return jsonify({"iasia": Presenca})
    # Instacia a presenca com dados basicos e o resto deixa null
    def Criar_presenca():
            try:
                data = request.json
                data_atual = datetime.datetime.now()
                data_formatada = data_atual.strftime('%Y-%m-%d')
                
                # Cria a presenca
                query = """INSERT INTO presenca (IdAluno, Data_presenca) VALUES (%s, %s)"""
                cursor = connection.cursor()
                cursor.execute(query, (idAluno, data_formatada))
                resultado = connection.commit()
                cursor.close()

                # Busca id da presenca
                query = "SELECT idPresenca FROM Presenca WHERE idAluno = %s AND Data_presenca = %s"
                cursor = connection.cursor()
                cursor.execute(query, (idAluno, data_formatada))
                resultado = cursor.fetchone()
                print(resultado)
                if resultado is None:
                    return jsonify({"msg": "requisicao mal sucedida", "code":400,"resultado": None })
                return jsonify({"code": 200, "resultado": resultado, "msg": "Operacao bem sucedida"})
            

            except pymysql.err.InterfaceError as e:
                return(f"Erro de interface: {e}")
            except pymysql.err.DataError as e:
                return (f"Erro de formato de dados: {e}")
            except pymysql.err.IntegrityError as e:
                return f"Erro de integridade: {e}"
            except Exception as e:
                return(f"Erro desconhecido: {e}")
            finally: 
                return jsonify({"code": 200, "resultado": resultado, "msg": "Operacao bem sucedida"})
    def marcar_presenca_casa_escola_ida_atualizacao(PresencaCriada):
        
        try:
                
                data = request.json
                 
                Local_subida_casa_escola = data.get("Local_subida_casa_escola")
                
                Tipo_de_marcacao_subida_casa_escola = data.get("Tipo_de_marcacao_subida_casa_escola")
                momento_de_marcacao = data.get("momento de marcacao")
                print(momento_de_marcacao)

                with connection.cursor() as cursor:
                    sql = "UPDATE Presenca SET `Local_subida_casa_escola` = %s, `Tipo_de_marcacao_subida_casa_escola` = %s WHERE `idPresenca` = %s"
                    cursor.execute(sql, (Local_subida_casa_escola, Tipo_de_marcacao_subida_casa_escola, PresencaCriada))
                    connection.commit()

                 # Verifique o número de linhas afetadas
                num_linhas_afetadas = cursor.rowcount

                

                data_atual = datetime.date.today()
                tipo_de_marcacao = data.get("tipo_de_marcacao")
                local = data.get("local")
                id_funcionario = data.get("idFuncionario")

                

                with connection.cursor() as cursor:
                    sql = "INSERT INTO Momento_de_marcacao (`idFuncionario`, `idPresenca`, `momento de marcacao`) VALUES (%s, %s, %s)"
                    cursor.execute(sql, ( id_funcionario, PresencaCriada, momento_de_marcacao))
                    connection.commit()
                if num_linhas_afetadas > 0:
                    # return jsonify({"msg":"Dados inseridos", "code": 200, "PresencaCriada":PresencaCriada})
                    return jsonify({"code":200, "msg": "Operacao bem sucedida"})
        except Exception as e:
            return str(e)        
    
            
            


                
        
    # Marca presenca do trajecto  ida casa a escola subida
    def marcar_presenca_casa_escola_ida():
        # print(Presenca)
        # Veririca se a presenca existe e se ja foi marcada a presenca para o local em questao
        if Presenca is not None and "Local_subida_casa_escola" in Presenca:
            # print("hereadaddddddddddddddddddddddddddddddddddd")
            return jsonify({"msg":"Presença já registrada", "code": 400}) 
        elif Presenca is None :
            
            PresencaCriada = Criar_presenca()
            json_data = PresencaCriada.get_json()

            # Verifique se a chave "resultado" está presente e obtenha o valor associado a "idPresenca"
            if "resultado" in json_data:
                idPresenca = json_data["resultado"].get("idPresenca")
                print(idPresenca)
            else:
                return jsonify({"msg":"Presença nao existente", "code": 404})
            if(PresencaCriada is not None):
                Dadosatualizacao = marcar_presenca_casa_escola_ida_atualizacao(idPresenca)
                print(Dadosatualizacao)
            # return PresencaCriada
            print("Tentativa2")
            return Dadosatualizacao
            
            
            
    # Marca presenca do trajecto  casa a escola descida
    def marcar_presenca_casa_escola_volta():
        if Presenca["Local_descida_casa_escola"] is not None:
            print("humm, nao")
            return jsonify({"msg":"Presença já registrada", "code": 400})  
        elif Presenca["Local_descida_casa_escola"] is None :
            
            try:
                data = request.json 
                Local_descida_casa_escola = data.get("Local_descida_casa_escola")
                Tipo_de_marcacao_descida_casa_escola = data.get("Tipo_de_marcacao_descida_casa_escola")
                momento_de_marcacao = data.get("momento de marcacao")
                data_atual = datetime.date.today()
                data_formatada = data_atual.strftime('%Y-%m-%d')
                
                try:
                        query = "SELECT idPresenca FROM Presenca WHERE idAluno = %s AND Data_presenca = %s"
                        cursor = connection.cursor()
                        cursor.execute(query, (idAluno, data_formatada))
                        idPresenca = cursor.fetchone()
                        # idPresenca_pego = idPresenca.get("idPresenca")  # Obtém o valor da chave "idAluno"
                        # print("anidnidaida")
                        # idPresenca_parsed = int(idPresenca["id_funcionario"])
                        (print(idPresenca['idPresenca']))
                except Exception as e:
                    print( e)
                
                try:
                        with connection.cursor() as cursor:
                            sql = "UPDATE Presenca SET `Local_descida_casa_escola` = %s, `Tipo_de_marcacao_descida_casa_escola` = %s WHERE `idPresenca` = %s"
                            cursor.execute(sql, (Local_descida_casa_escola, Tipo_de_marcacao_descida_casa_escola, idPresenca['idPresenca']))
                            connection.commit()
                            # num_linhas_afetadas = cursor.rowcount

                        data_atual = datetime.date.today()
                        # tipo_de_marcacao = data.get("tipo_de_marcacao")
                        # local = data.get("local")
                        id_funcionario = data.get("id_funcionario")

                except Exception as e:
                    print( e)

            

                
                print(momento_de_marcacao)
                print("aquimome")
                print(idPresenca)
                print("pres")
                print(id_funcionario)
                print("func")
                
                with connection.cursor() as cursor:
                    sql = "INSERT INTO Momento_de_marcacao (`idFuncionario`, `idPresenca`, `momento de marcacao`) VALUES ( %s, %s,%s)"
                    cursor.execute(sql, ( 1, idPresenca["idPresenca"], momento_de_marcacao ))
                    connection.commit()
                    print(cursor)

                    # if num_linhas_afetadas > 0:
                    #     # return jsonify({"msg":"Dados inseridos", "code": 200, "PresencaCriada":PresencaCriada})
                    #     print("HEYHEY")
                    #     # return jsonify({"code":200, "msg": "Operacao bem sucedida"})
                return jsonify({"msg": "Operacao bem sucedida", "code":200,"resultado": None })
                    
            except Exception as e:
                print( e)
                return jsonify({"msg": "Presença nao existente", "code":200,"resultado": None })
            


# Marca presenca do trajecto escola casa subida
    def marcar_presenca_escola_casa_ida():
        if Presenca["Local_subida_escola_casa"] is not None :
            return jsonify({"msg":"Presença já registrada", "code": 400}) 
        elif Presenca["Local_subida_escola_casa"] is None :
            
            
            try:
                data = request.json 
                Local_subida_escola_casa = data.get("Local_subida_escola_casa")
                Tipo_de_marcacao_subida_escola_casa = data.get("Tipo_de_marcacao_subida_escola_casa")
                momento_de_marcacao = data.get("momento de marcacao")
                data_atual = datetime.date.today()
                data_formatada = data_atual.strftime('%Y-%m-%d')
                
                query = "SELECT idPresenca FROM Presenca WHERE idAluno = %s AND Data_presenca = %s"
                cursor = connection.cursor()
                cursor.execute(query, (idAluno, data_formatada))
                idPresenca = cursor.fetchone()
                # idPresenca_pego = idPresenca.get("idPresenca")  # Obtém o valor da chave "idAluno"
                # idPresenca_parsed = int(idPresenca[0])
                
                

                with connection.cursor() as cursor:
                    sql = "UPDATE Presenca SET `Local_subida_escola_casa` = %s, `Tipo_de_marcacao_subida_escola_casa` = %s WHERE `idPresenca` = %s"
                    cursor.execute(sql, (Local_subida_escola_casa, Tipo_de_marcacao_subida_escola_casa, idPresenca['idPresenca']))
                    connection.commit()
                
                num_linhas_afetadas = cursor.rowcount
                data_atual = datetime.date.today()
                
                id_funcionario = data.get("id_funcionario")

                
                print(momento_de_marcacao)
                print("aquimome")
                print(idPresenca)
                print("pres")
                print(id_funcionario)
                print("func")
                with connection.cursor() as cursor:
                    sql = "INSERT INTO Momento_de_marcacao ( `idFuncionario`, `idPresenca`, `momento de marcacao`) VALUES ( %s, %s, %s)"
                    cursor.execute(sql, ( 1, idPresenca["idPresenca"],momento_de_marcacao))
                    connection.commit()
                    # if num_linhas_afetadas > 0:
                    #     # return jsonify({"msg":"Dados inseridos", "code": 200, "PresencaCriada":PresencaCriada})
                    #     return jsonify({"code":200, "msg": "Operacao bem sucedida"})
                return jsonify({"msg": "Operacao bem sucedida", "code":200,"resultado": None })
                
            except Exception as e:
                print( e)
                return jsonify({"msg": "Presença nao existente", "code":200,"resultado": None })

    def marcar_presenca_escola_casa_volta():
        if Presenca["Local_descida_escola_casa"] is not None:
            return jsonify({"msg":"Presença já registrada", "code": 400}) 
        elif Presenca["Local_descida_escola_casa"] is None :
            
            try:
                data = request.json 
                Local_descida_escola_casa = data.get("Local_descida_escola_casa")
                Tipo_de_marcacao_descida_escola_casa = data.get("Tipo_de_marcacao_descida_escola_casa")
                momento_de_marcacao = data.get("momento de marcacao")
                data_atual = datetime.date.today()
                data_formatada = data_atual.strftime('%Y-%m-%d')
                
                query = "SELECT idPresenca FROM Presenca WHERE idAluno = %s AND Data_presenca = %s"
                cursor = connection.cursor()
                cursor.execute(query, (idAluno, data_formatada))
                idPresenca = cursor.fetchone()
                # idPresenca_pego = idPresenca.get("idPresenca")  # Obtém o valor da chave "idAluno"
                # idPresenca_parsed = int(idPresenca[0])
                
                

                with connection.cursor() as cursor:
                    sql = "UPDATE Presenca SET `Local_descida_escola_casa` = %s, `Tipo_de_marcacao_descida_escola_casa` = %s WHERE `idPresenca` = %s"
                    cursor.execute(sql, (Local_descida_escola_casa, Tipo_de_marcacao_descida_escola_casa, idPresenca['idPresenca']))
                    connection.commit()
                
                num_linhas_afetadas = cursor.rowcount
                data_atual = datetime.date.today()
                
                id_funcionario = data.get("idFuncionario")

                
                print(momento_de_marcacao)
                print("aquimome")
                print(idPresenca)
                print("pres")
                print(id_funcionario)
                print("func")
                with connection.cursor() as cursor:
                    sql = "INSERT INTO Momento_de_marcacao ( `idFuncionario`, `idPresenca`, `momento de marcacao`) VALUES (%s, %s, %s)"
                    cursor.execute(sql, ( 1, idPresenca["idPresenca"], momento_de_marcacao))
                    connection.commit()

                    # if num_linhas_afetadas > 0:
                    #     # return jsonify({"msg":"Dados inseridos", "code": 200, "PresencaCriada":PresencaCriada})
                    #     return jsonify({"code":200, "msg": "Operacao bem sucedida"})
                return jsonify({"msg": "Operacao bem sucedida", "code":200,"resultado": None })
            except Exception as e:
                print( e)
                return jsonify({"msg": "Presença nao existente", "code":200,"resultado": None })
    



    def marcar_presenca_marcacao_ja_feita():
        return jsonify({"msg": "Presença nao existente", "code":200,"resultado": None })
    
    
    if(selected_case == 1):
        result = marcar_presenca_casa_escola_ida()
    elif(selected_case == 2):
        result = marcar_presenca_casa_escola_volta()
    elif(selected_case == 3):
        result = marcar_presenca_escola_casa_ida()
    elif(selected_case == 4):
        result = marcar_presenca_escola_casa_volta()
    elif(selected_case == 0):
        result = marcar_presenca_marcacao_ja_feita()

    # print(result)
    # print("UJNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN")
    if(result):
        
        resultadotxt = result.get_data(as_text=True)
        # Parse do JSON para um objeto Python
        resjson = json.loads(resultadotxt)
        
    else:
        
        resjson["code"] = 200
        resjson["msg"] = "Presença já registrada"
        

    # print(resjson)
    # print(resultadotxt)
    # if(Presenca is None):
    #     return jsonify({"code":200, "msg": "Sucesso"})
    # else:
    return jsonify({"Presenca":Presenca, "code":resjson["code"], "msg": resjson["msg"]})


    
@blp.route("/marcar_presenca_a_todos/<int:marcadordefalta>/<int:idcarinha>", methods=['GET'])
async def marcar_presenca_a_todos(marcadordefalta, idcarinha):
    
    # Instacia a presenca com dados basicos e o resto deixa null
    

    try:
        if marcadordefalta == 1:
                query = """SELECT idAluno FROM aluno WHERE Id_carrinha = %s """
                cursor = connection.cursor()
                cursor.execute(query, idcarinha)
                idAlunoquery = cursor.fetchall()
                
            
                async def Criar_presenca (idAluno):
                    try:
                        # data = request.json
                        data_atual = datetime.date.today()
                        data_formatada = data_atual.strftime('%Y-%m-%d')
                        
                        # idPresenca = 169

                    
                        query = """INSERT INTO Presenca (idAluno,Data_presenca) VALUES (%s, %s)"""
                        cursor = connection.cursor()
                        cursor.execute(query, (idAluno, data_formatada, ))
                        commit= connection.commit()
                        cursor.close()
                        
                    except Exception as e:
                        return str(e)

                
                async def Marcar_falta_ida_escola_casa(data_formatada, idAluno):
                    try: 
                        query = "SELECT idPresenca FROM Presenca WHERE idAluno = %s AND Data_presenca = %s"
                        cursor = connection.cursor()
                        cursor.execute(query, (idAluno, data_formatada))
                        idPresenca = cursor.fetchone()
                        idPresenca_pego = idPresenca.get("idPresenca")
                        idPresenca_parsed = int(idPresenca_pego)

                        print(idPresenca_parsed)

                        with connection.cursor() as cursor:
                            sql = "UPDATE Presenca SET `Local_subida_casa_escola` = %s, `Tipo_de_marcacao_subida_casa_escola` = %s WHERE `idPresenca` = %s  "
                            cursor.execute(sql, ("faltou", "nenhuma", idPresenca_parsed))
                            connection.commit()
                    except Exception as e:
                        return str(e)
        
        
            
                for (aluno) in idAlunoquery:
                        # Para cada ID de aluno, verifique se há presença associada a ele.
                        data_atual = datetime.date.today()
                        data_formatada = data_atual.strftime('%Y-%m-%d')
                        idAluno = aluno.get("idAluno")  # Obtém o valor da chave "idAluno"
                        if idAluno is not None:
                            idAluno = int(idAluno)
                        query = "SELECT * FROM presenca WHERE idAluno = %s AND Data_presenca = %s"
                        
                        cursor.execute(query, (idAluno, data_formatada))
                        resultado = cursor.fetchone()
                        
                        if resultado is None:
                            await Criar_presenca(idAluno)
                            await Marcar_falta_ida_escola_casa(data_formatada, idAluno)
                            # return resultado





        if marcadordefalta == 2:
                query = """SELECT idAluno FROM aluno WHERE Id_carrinha = %s """
                cursor = connection.cursor()
                cursor.execute(query, idcarinha)
                idAlunoquery = cursor.fetchall()
                
 

                
                async def Marcar_falta_descida_escola_casa(data_formatada, idAluno):
                    print(idAluno)
                    try: 
                        query = "SELECT idPresenca FROM Presenca WHERE idAluno = %s AND Data_presenca = %s"
                        cursor = connection.cursor()
                        cursor.execute(query, (idAluno, data_formatada))
                        idPresenca = cursor.fetchone()
                        idPresenca_pego = idPresenca.get("idPresenca")
                        idPresenca_parsed = int(idPresenca_pego)

                        print(idPresenca_parsed)

                        with connection.cursor() as cursor:
                            sql = "UPDATE Presenca SET `Local_descida_casa_escola` = %s, `Tipo_de_marcacao_descida_casa_escola` = %s WHERE `idPresenca` = %s  "
                            cursor.execute(sql, ("faltou", "nenhuma", idPresenca_parsed))
                            connection.commit()
                    except Exception as e:
                        return str(e)
        
        
            
                for (aluno) in idAlunoquery:
                        # Para cada ID de aluno, verifique se há presença associada a ele.
                        data_atual = datetime.date.today()
                        data_formatada = data_atual.strftime('%Y-%m-%d')
                        idAluno = aluno.get("idAluno")  # Obtém o valor da chave "idAluno"
                        if idAluno is not None:
                            idAluno = int(idAluno)
                        query = "SELECT Local_descida_casa_escola FROM presenca WHERE idAluno = %s AND Data_presenca = %s"
                        
                        cursor.execute(query, (idAluno, data_formatada))
                        resultado = cursor.fetchone()
                        
                        if resultado['Local_descida_casa_escola'] is None:
                            
                            # await Criar_presenca(idAluno)
                            await Marcar_falta_descida_escola_casa(data_formatada, idAluno)
                            # return resultado
                            




          
        if marcadordefalta == 3:
                query = """SELECT idAluno FROM aluno WHERE Id_carrinha = %s """
                cursor = connection.cursor()
                cursor.execute(query, idcarinha)
                idAlunoquery = cursor.fetchall()
                
 

                
                async def Marcar_falta_subida_casa_escola(data_formatada, idAluno):
                    print(idAluno)
                    try: 
                        query = "SELECT idPresenca FROM Presenca WHERE idAluno = %s AND Data_presenca = %s"
                        cursor = connection.cursor()
                        cursor.execute(query, (idAluno, data_formatada))
                        idPresenca = cursor.fetchone()
                        idPresenca_pego = idPresenca.get("idPresenca")
                        idPresenca_parsed = int(idPresenca_pego)

                        print(idPresenca_parsed)

                        with connection.cursor() as cursor:
                            sql = "UPDATE Presenca SET `Local_subida_escola_casa` = %s, `Tipo_de_marcacao_subida_escola_casa` = %s WHERE `idPresenca` = %s  "
                            cursor.execute(sql, ("faltou", "nenhuma", idPresenca_parsed))
                            connection.commit()
                    except Exception as e:
                        return str(e)
        
        
            
                for (aluno) in idAlunoquery:
                        # Para cada ID de aluno, verifique se há presença associada a ele.
                        data_atual = datetime.date.today()
                        data_formatada = data_atual.strftime('%Y-%m-%d')
                        idAluno = aluno.get("idAluno")  # Obtém o valor da chave "idAluno"
                        if idAluno is not None:
                            idAluno = int(idAluno)
                        query = "SELECT Local_subida_escola_casa FROM presenca WHERE idAluno = %s AND Data_presenca = %s"
                        
                        cursor.execute(query, (idAluno, data_formatada))
                        resultado = cursor.fetchone()
                        
                        if resultado['Local_subida_escola_casa'] is None:
                            
                            # await Criar_presenca(idAluno)
                            await Marcar_falta_subida_casa_escola(data_formatada, idAluno)
                            # return resultado
              





        
        if marcadordefalta == 4:
                query = """SELECT idAluno FROM aluno WHERE Id_carrinha = %s """
                cursor = connection.cursor()
                cursor.execute(query, idcarinha)
                idAlunoquery = cursor.fetchall()
                
 

                
                async def Marcar_falta_descida_casa_escola(data_formatada, idAluno):
                    print(idAluno)
                    try: 
                        query = "SELECT idPresenca FROM Presenca WHERE idAluno = %s AND Data_presenca = %s"
                        cursor = connection.cursor()
                        cursor.execute(query, (idAluno, data_formatada))
                        idPresenca = cursor.fetchone()
                        idPresenca_pego = idPresenca.get("idPresenca")
                        idPresenca_parsed = int(idPresenca_pego)

                        print(idPresenca_parsed)

                        with connection.cursor() as cursor:
                            sql = "UPDATE Presenca SET `Local_descida_escola_casa` = %s, `Tipo_de_marcacao_descida_escola_casa` = %s WHERE `idPresenca` = %s  "
                            cursor.execute(sql, ("faltou", "nenhuma", idPresenca_parsed))
                            connection.commit()
                    except Exception as e:
                        return str(e)
        
        
            
                for (aluno) in idAlunoquery:
                        # Para cada ID de aluno, verifique se há presença associada a ele.
                        data_atual = datetime.date.today()
                        data_formatada = data_atual.strftime('%Y-%m-%d')
                        idAluno = aluno.get("idAluno")  # Obtém o valor da chave "idAluno"
                        if idAluno is not None:
                            idAluno = int(idAluno)
                        query = "SELECT Local_descida_escola_casa FROM presenca WHERE idAluno = %s AND Data_presenca = %s"
                        
                        cursor.execute(query, (idAluno, data_formatada))
                        resultado = cursor.fetchone()
                        
                        if resultado['Local_descida_escola_casa'] is None:
                            
                            # await Criar_presenca(idAluno)
                            await Marcar_falta_descida_casa_escola(data_formatada, idAluno)
                            # return resultado



    except Exception as e:
        return str(e)
    
    finally:
        cursor.close()

        return jsonify({"code":200, "msg": "Sucesso"})

