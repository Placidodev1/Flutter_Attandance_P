import 'dart:convert';

ResponsavelModel alunosModelFromMap(String str) => ResponsavelModel.fromMap(json.decode(str));

String ResponsavelModelToMap(ResponsavelModel data) => json.encode(data.toMap());

class ResponsavelModel {

    final String nome;


    ResponsavelModel({
        required this.nome,
    });

    factory ResponsavelModel.fromMap(Map<String, dynamic> json) => ResponsavelModel(

        nome: json["Nome"],

    );

    Map<String, dynamic> toMap() => {
        "Nome": nome,

    };
}
