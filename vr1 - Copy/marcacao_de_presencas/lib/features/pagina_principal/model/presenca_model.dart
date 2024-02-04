import 'dart:convert';

PresencaModelFunc presencaModelFuncFromMap(String str) => PresencaModelFunc.fromMap(json.decode(str));

String presencaModelFuncToMap(PresencaModelFunc data) => json.encode(data.toMap());

class PresencaModelFunc {
    final int idPresenca;
    final String tipoDeMarcacaoSubidaCasaEscola;
    final String localSubidaEscolaCasa;
    final String localDescidaEscolaCasa;
    final String tipoDeMarcacaoDescidaCasaEscola;
    final String tipoDeMarcacaoSubidaEscolaCasa;
    final String tipoDeMarcacaoDescidaEscolaCasa;
    final String localDescidaCasaEscola;
    final String localSubidaCasaEscola;
    final int idAluno;
    final String dataPresenca;

    PresencaModelFunc({
        required this.idPresenca,
        required this.tipoDeMarcacaoSubidaCasaEscola,
        required this.localSubidaEscolaCasa,
        required this.localDescidaEscolaCasa,
        required this.tipoDeMarcacaoDescidaCasaEscola,
        required this.tipoDeMarcacaoSubidaEscolaCasa,
        required this.tipoDeMarcacaoDescidaEscolaCasa,
        required this.localDescidaCasaEscola,
        required this.localSubidaCasaEscola,
        required this.idAluno,
        required this.dataPresenca,
    });

    factory PresencaModelFunc.fromMap(Map<String, dynamic> json) => PresencaModelFunc(
        idPresenca: json["idPresenca"],
        tipoDeMarcacaoSubidaCasaEscola: json["Tipo_de_marcacao_subida_casa_escola"],
        localSubidaEscolaCasa: json["Local_subida_escola_casa"],
        localDescidaEscolaCasa: json["Local_descida_escola_casa"],
        tipoDeMarcacaoDescidaCasaEscola: json["Tipo_de_marcacao_descida_casa_escola"],
        tipoDeMarcacaoSubidaEscolaCasa: json["Tipo_de_marcacao_subida_escola_casa"],
        tipoDeMarcacaoDescidaEscolaCasa: json["Tipo_de_marcacao_descida_escola_casa"],
        localDescidaCasaEscola: json["Local_descida_casa_escola"],
        localSubidaCasaEscola: json["Local_subida_casa_escola"],
        idAluno: json["IdAluno"],
        dataPresenca: json["Data_presenca"],
    );

    Map<String, dynamic> toMap() => {
        "idPresenca": idPresenca,
        "Tipo_de_marcacao_subida_casa_escola": tipoDeMarcacaoSubidaCasaEscola,
        "Local_subida_escola_casa": localSubidaEscolaCasa,
        "Local_descida_escola_casa": localDescidaEscolaCasa,
        "Tipo_de_marcacao_descida_casa_escola": tipoDeMarcacaoDescidaCasaEscola,
        "Tipo_de_marcacao_subida_escola_casa": tipoDeMarcacaoSubidaEscolaCasa,
        "Tipo_de_marcacao_descida_escola_casa": tipoDeMarcacaoDescidaEscolaCasa,
        "Local_descida_casa_escola": localDescidaCasaEscola,
        "Local_subida_casa_escola": localSubidaCasaEscola,
        "IdAluno": idAluno,
        "Data_presenca": dataPresenca,
    };
}
