import 'dart:convert';

CarinhaModel carinhaModelFromMap(String str) => CarinhaModel.fromMap(json.decode(str));

String carinhaModelToMap(CarinhaModel data) => json.encode(data.toMap());

class CarinhaModel {
    final int idCarinha;
    final int capacidadeMaxima;
    final String detalhesAdicionais;
    final String tipoDeCarinha;
    final String foto;

    CarinhaModel({
        required this.idCarinha,
        required this.capacidadeMaxima,
        required this.detalhesAdicionais,
        required this.tipoDeCarinha,
        required this.foto,
    });

    factory CarinhaModel.fromMap(Map<String, dynamic> json) => CarinhaModel(
        idCarinha: json["idCarinha"],
        capacidadeMaxima: json["Capacidade_Maxima"],
        detalhesAdicionais: json["Detalhes_Adicionais"],
        tipoDeCarinha: json["Tipo_de_Carinha"],
        foto: json["Foto"],
    );

    Map<String, dynamic> toMap() => {
        "idCarinha": idCarinha,
        "Capacidade_Maxima": capacidadeMaxima,
        "Detalhes_Adicionais": detalhesAdicionais,
        "Tipo_de_Carinha": tipoDeCarinha,
        "Foto": foto,
    };
}
