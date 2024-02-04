
import 'dart:convert';

ResponsavelModel responsavelModelFromMap(String str) => ResponsavelModel.fromMap(json.decode(str));

String responsavelModelToMap(ResponsavelModel data) => json.encode(data.toMap());

class ResponsavelModel {
    final int idResponsavel;
    final String nome;
    final String endereco;
    final String relacaoComAluno;

    ResponsavelModel({
        required this.idResponsavel,
        required this.nome,
        required this.endereco,
        required this.relacaoComAluno,
    });

    factory ResponsavelModel.fromMap(Map<String, dynamic> json) => ResponsavelModel(
        idResponsavel: json["idResponsavel"],
        nome: json["Nome"],
        endereco: json["Endereco"],
        relacaoComAluno: json["Relacao_com_aluno"],
    );

    Map<String, dynamic> toMap() => {
        "idResponsavel": idResponsavel,
        "Nome": nome,
        "Endereco": endereco,
        "Relacao_com_aluno": relacaoComAluno,
    };
}
