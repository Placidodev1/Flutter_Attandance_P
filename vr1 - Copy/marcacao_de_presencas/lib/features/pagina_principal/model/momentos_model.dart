import 'dart:convert';

MomentosModel momentosModelFromMap(String str) => MomentosModel.fromMap(json.decode(str));

String momentosModelToMap(MomentosModel data) => json.encode(data.toMap());

class MomentosModel {
    final String dataDeMarcacao;
    final int idFuncionario;
    final int idPresenca;
    final String momentoDeMarcacao;

    MomentosModel({
        required this.dataDeMarcacao,
        required this.idFuncionario,
        required this.idPresenca,
        required this.momentoDeMarcacao,
    });

    factory MomentosModel.fromMap(Map<String, dynamic> json) => MomentosModel(
        dataDeMarcacao: json["Data de marcacao"],
        idFuncionario: json["idFuncionario"],
        idPresenca: json["idPresenca"],
        momentoDeMarcacao: json["momento de marcacao"],
    );

    Map<String, dynamic> toMap() => {
        "Data de marcacao": dataDeMarcacao,
        "idFuncionario": idFuncionario,
        "idPresenca": idPresenca,
        "momento de marcacao": momentoDeMarcacao,
    };
}
