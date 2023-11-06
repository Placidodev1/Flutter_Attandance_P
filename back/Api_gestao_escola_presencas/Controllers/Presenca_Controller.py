import json
from flask import jsonify, abort, Blueprint, request
import pymysql
from db import connection   
import datetime
import logging

blp = Blueprint("presenca", __name__)

# Return all of the presenca of the day
@blp.route("/Presenca_dia/<string:date>", methods=["GET"])
def retorna_dia(date):
    try:
        date_obj = datetime.datetime.strptime(date, "%Y-%m-%d")
        query= f""" SELECT * FROM presenca WHERE Data_presenca = %s"""
        cursor = connection.cursor()
        cursor.execute(query, date_obj)
        presencadia = cursor.fetchall()
        cursor.close()
        return jsonify({"data": presencadia})
    except ValueError:
        return jsonify({"data":"abidanid"})

# Return all of the presenca of the day
@blp.route("/Presenca_dia_aluno/<string:date>/<int:idaluno>", methods=["GET"])
def retorna_dia_aluno(date, idaluno):
    try:
        date_obj = datetime.datetime.strptime(date, "%Y-%m-%d")
        query= f""" SELECT * FROM presenca WHERE (Data_presenca = %s) AND (idAluno = %s)"""
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

    return jsonify({"data": presenca})


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
        query = "SELECT * FROM Presenca WHERE idAluno = %s AND Data_de_Criacao = %s"
        cursor = connection.cursor()
        cursor.execute(query, (idAluno, data_formatada ))
        resultado = cursor.fetchone()
        if(resultado):
            return resultado
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
                # data = request.json
                data_atual = datetime.datetime.now()
                data_formatada = data_atual.strftime('%Y-%m-%d')
                
            
                query = """INSERT INTO presenca (idAluno) VALUES ( %s)"""
                cursor = connection.cursor()
                cursor.execute(query, (idAluno ))
                resultado = connection.commit()
                cursor.close()
                # data_atual = datetime.date.today()



                # # data_formatada = data_atual.strftime('%Y-%m-%d')
                # query = "SELECT idPresenca FROM Presenca WHERE idAluno = %s AND Data_presenca = %s"
                # cursor = connection.cursor()
                # cursor.execute(query, (idAluno, data_formatada))
                # resultado = cursor.fetchone()
                return resultado
            except pymysql.err.InterfaceError as e:
                return(f"Erro de interface: {e}")
            except Exception as e:
                return(f"Erro desconhecido: {e}")
            
            # except pymysql.err.DataError as e:
            #     return (f"Erro de formato de dados: {e}")
            # except pymysql.err.IntegrityError as e:
            #     return f"Erro de integridade: {e}"


                
        
    # Marca presenca do trajecto  ida casa a escola subida
    def marcar_presenca_casa_escola_ida():
        if Presenca is not None and "Local_subida_casa_escola" in Presenca:
            return "Presença já registrada" 
        elif Presenca is None :
            # return "niasdn"
            PresencaCriada = Criar_presenca()
            # return PresencaCriada
            try:
                data = request.json 
                Local_subida_casa_escola = data.get("Local_subida_casa_escola")
                Tipo_de_marcacao_subida_casa_escola = data.get("Tipo_de_marcacao_subida_casa_escola")
                idPresenca = PresencaCriada["idPresenca"]
                
                

                with connection.cursor() as cursor:
                    sql = "UPDATE Presenca SET `Local_subida_casa_escola` = %s, `Tipo_de_marcacao_subida_casa_escola` = %s WHERE `idPresenca` = %s"
                    cursor.execute(sql, (Local_subida_casa_escola, Tipo_de_marcacao_subida_casa_escola, idPresenca))
                    connection.commit()

                data_atual = datetime.date.today()
                tipo_de_marcacao = data.get("tipo_de_marcacao")
                local = data.get("local")
                id_funcionario = data.get("id_funcionario")

                

                with connection.cursor() as cursor:
                    sql = "INSERT INTO Momento_de_marcacao (`Data de marcacao`, `idFuncionario`, `idPresenca`, `Tipo_de_marcacao`) VALUES (%s, %s, %s, %s)"
                    cursor.execute(sql, (data_atual, id_funcionario, idPresenca, tipo_de_marcacao))
                    connection.commit()

                return "Dados inseridos"
            except Exception as e:
                return str(e)
            
            
    # Marca presenca do trajecto  casa a escola descida
    def marcar_presenca_casa_escola_volta():
        if Presenca["Local_descida_casa_escola"] is not None:
            return "Presença já registrada" 
        elif Presenca["Local_descida_casa_escola"] is None :
            
            try:
                data = request.json 
                Local_descida_casa_escola = data.get("Local_descida_casa_escola")
                Tipo_de_marcacao_descida_casa_escola = data.get("Tipo_de_marcacao_descida_casa_escola")
                data_atual = datetime.date.today()
                data_formatada = data_atual.strftime('%Y-%m-%d')
                

                query = "SELECT idPresenca FROM Presenca WHERE idAluno = %s AND Data_presenca = %s"
                cursor = connection.cursor()
                cursor.execute(query, (idAluno, data_formatada))
                idPresenca = cursor.fetchone()
                idPresenca_pego = idPresenca.get("idPresenca")  # Obtém o valor da chave "idAluno"
                idPresenca_parsed = int(idPresenca_pego)

                
                        
                
    
                with connection.cursor() as cursor:
                    sql = "UPDATE Presenca SET `Local_descida_casa_escola` = %s, `Tipo_de_marcacao_descida_casa_escola` = %s WHERE `idPresenca` = %s"
                    cursor.execute(sql, (Local_descida_casa_escola, Tipo_de_marcacao_descida_casa_escola, idPresenca_parsed))
                    connection.commit()

                data_atual = datetime.date.today()
                tipo_de_marcacao = data.get("tipo_de_marcacao")
                local = data.get("local")
                id_funcionario = data.get("id_funcionario")



            

                

                with connection.cursor() as cursor:
                    sql = "INSERT INTO Momento_de_marcacao (`Data de marcacao`, `idFuncionario`, `idPresenca`, `Tipo_de_marcacao`) VALUES ( %s, %s, %s, %s)"
                    cursor.execute(sql, (data_atual, id_funcionario, idPresenca_parsed, tipo_de_marcacao))
                    connection.commit()

                return "Dados inseridos"
            except Exception as e:
                return str(e)
            


# Marca presenca do trajecto escola casa subida
    def marcar_presenca_escola_casa_ida():
        if Presenca["Local_subida_escola_casa"] is not None :
            return "Presença já registrada" 
        elif Presenca["Local_subida_escola_casa"] is None :
            
            
            try:
                data = request.json 
                Local_subida_escola_casa = data.get("Local_subida_escola_casa")
                Tipo_de_marcacao_subida_escola_casa = data.get("Tipo_de_marcacao_subida_escola_casa")
                idPresenca = data["idPresenca"]
                
                

                with connection.cursor() as cursor:
                    sql = "UPDATE Presenca SET `Local_subida_escola_casa` = %s, `Tipo_de_marcacao_subida_escola_casa` = %s WHERE `idPresenca` = %s"
                    cursor.execute(sql, (Local_subida_escola_casa, Tipo_de_marcacao_subida_escola_casa, idPresenca))
                    connection.commit()

                data_atual = datetime.date.today()
                tipo_de_marcacao = data.get("tipo_de_marcacao")
                local = data.get("local")
                id_funcionario = data.get("id_funcionario")

                

                with connection.cursor() as cursor:
                    sql = "INSERT INTO Momento_de_marcacao (`Data de marcacao`, `idFuncionario`, `idPresenca`, `Tipo_de_marcacao`, `Local`) VALUES (%s, %s, %s, %s, %s)"
                    cursor.execute(sql, (data_atual, id_funcionario, idPresenca, tipo_de_marcacao, local))
                    connection.commit()

                return "Dados inseridos"
            except Exception as e:
                return str(e)

    def marcar_presenca_escola_casa_volta():
        if Presenca["Local_descida_escola_casa"] is not None:
            return "Presença já registrada" 
        elif Presenca["Local_descida_escola_casa"] is None :
            
            try:
                data = request.json 
                Local_descida_escola_casa = data.get("Local_descida_escola_casa")
                Tipo_de_marcacao_descida_escola_casa = data.get("Tipo_de_marcacao_descida_escola_casa")
                idPresenca = data["idPresenca"]
                
                

                with connection.cursor() as cursor:
                    sql = "UPDATE Presenca SET `Local_descida_escola_casa` = %s, `Tipo_de_marcacao_descida_escola_casa` = %s WHERE `idPresenca` = %s"
                    cursor.execute(sql, (Local_descida_escola_casa, Tipo_de_marcacao_descida_escola_casa, idPresenca))
                    connection.commit()

                data_atual = datetime.date.today()
                tipo_de_marcacao = data.get("tipo_de_marcacao")
                local = data.get("local")
                id_funcionario = data.get("id_funcionario")

                

                with connection.cursor() as cursor:
                    sql = "INSERT INTO Momento_de_marcacao (`Data de marcacao`, `idFuncionario`, `idPresenca`, `Tipo_de_marcacao`, `Local`) VALUES (%s, %s, %s, %s, %s)"
                    cursor.execute(sql, (data_atual, id_funcionario, idPresenca, tipo_de_marcacao, local))
                    connection.commit()

                return "Dados inseridos"
            except Exception as e:
                return str(e)

    if(selected_case == 1):
        result = marcar_presenca_casa_escola_ida()
    elif(selected_case == 2):
        result = marcar_presenca_casa_escola_volta()
    elif(selected_case == 3):
        result = marcar_presenca_escola_casa_ida()
    elif(selected_case == 4):
        result = marcar_presenca_escola_casa_volta()

    

    
    

    return jsonify({"Resultado": result, "Presenca":Presenca})


    
@blp.route("/marcar_presenca_a_todos/<int:marcadordefalta>", methods=['POST'])
def marcar_presenca_a_todos(marcadordefalta):
    
    # Instacia a presenca com dados basicos e o resto deixa null
    

    try:
        if marcadordefalta == 1:
                query = """SELECT idAluno FROM aluno"""
                cursor = connection.cursor()
                cursor.execute(query)
                idAlunoquery = cursor.fetchall()
                
            
                def Criar_presenca(idAluno):
            
                    # data = request.json
                    data_atual = datetime.date.today()
                    data_formatada = data_atual.strftime('%Y-%m-%d')
                    
                    idPresenca = 169

                
                    query = """INSERT INTO Presenca (idAluno,Data_presenca, idPresenca) VALUES (%s, %s, %s)"""
                    cursor = connection.cursor()
                    cursor.execute(query, (idAluno, data_formatada, idPresenca))
                    commit= connection.commit()
                    cursor.close()
                
                def Marcar_falta_ida_escola_casa(data_formatada, idAluno):
                    with connection.cursor() as cursor:
                        sql = "UPDATE Presenca SET `Local_subida_casa_escola` = %s, `Tipo_de_marcacao_subida_casa_escola` = %s WHERE `idPresenca` = %s  "
                        cursor.execute(sql, ("faltou", "nenhuma", 165))
                        connection.commit()
            
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
                            # Criar_presenca(idAluno)
                            Marcar_falta_ida_escola_casa(data_formatada, idAluno)
                            # return resultado
    finally:
        cursor.close()
    return "Res"
