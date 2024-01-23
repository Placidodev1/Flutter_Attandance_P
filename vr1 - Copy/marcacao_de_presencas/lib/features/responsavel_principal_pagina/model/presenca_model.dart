import 'dart:convert';

PresencaModel presencaModelFromMap(String str) => PresencaModel.fromMap(json.decode(str));

String presencaModelToMap(PresencaModel data) => json.encode(data.toMap());

class PresencaModel {
    final int idpresenca;
    final String estado1;
    final String estado2;
    final String data;

    PresencaModel({
        required this.idpresenca,
        required this.estado1,
        required this.estado2,
        required this.data,
    });

    factory PresencaModel.fromMap(Map<String, dynamic> json) => PresencaModel(
        idpresenca: json["idpresenca"],
        estado1: json["estado1"],
        estado2: json["estado2"],
        data: json["data"],
    );

    Map<String, dynamic> toMap() => {
        "idpresenca": idpresenca,
        "estado1": estado1,
        "estado2": estado2,
        "data": data,
    };
}
