
import 'dart:convert';

FuncionarioModel funcionarioModelFromMap(String str) => FuncionarioModel.fromMap(json.decode(str));

String funcionarioModelToMap(FuncionarioModel data) => json.encode(data.toMap());

class FuncionarioModel {
    final int idFuncionario;
    final String nome;
    final String genero;
    final String email;
    final int telefoneDoResponsavel;
    final String endereco;
    final int senha;
    final String cargo;
    final String departamento;
    final int idCarrinha;

    FuncionarioModel({
        required this.idFuncionario,
        required this.nome,
        required this.genero,
        required this.email,
        required this.telefoneDoResponsavel,
        required this.endereco,
        required this.senha,
        required this.cargo,
        required this.departamento,
        required this.idCarrinha,
    });

    factory FuncionarioModel.fromMap(Map<String, dynamic> json) => FuncionarioModel(
        idFuncionario: json["idFuncionario"],
        nome: json["Nome"],
        genero: json["Genero"],
        email: json["Email"],
        telefoneDoResponsavel: json["Telefone_do_responsavel"],
        endereco: json["Endereco"],
        senha: json["Senha"],
        cargo: json["Cargo"],
        departamento: json["Departamento"],
        idCarrinha: json["id_Carrinha"],
    );

    Map<String, dynamic> toMap() => {
        "idFuncionario": idFuncionario,
        "Nome": nome,
        "Genero": genero,
        "Email": email,
        "Telefone_do_responsavel": telefoneDoResponsavel,
        "Endereco": endereco,
        "Senha": senha,
        "Cargo": cargo,
        "Departamento": departamento,
        "id_Carrinha": idCarrinha,
    };
}
