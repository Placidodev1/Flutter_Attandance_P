import 'dart:convert';

ResponsavelModel responsavelModelFromMap(String str) => ResponsavelModel.fromMap(json.decode(str));

String responsavelModelToMap(ResponsavelModel data) => json.encode(data.toMap());

class ResponsavelModel {
    final int idAluno;

    ResponsavelModel({
        required this.idAluno,
    });

    factory ResponsavelModel.fromMap(Map<String, dynamic> json) => ResponsavelModel(
        idAluno: json["idAluno"],
    );

    Map<String, dynamic> toMap() => {
        "idAluno": idAluno,
    };
}
