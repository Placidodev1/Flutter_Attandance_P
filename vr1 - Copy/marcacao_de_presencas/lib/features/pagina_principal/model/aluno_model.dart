import 'dart:convert';

AlunosModel alunosModelFromMap(String str) => AlunosModel.fromMap(json.decode(str));

String alunosModelToMap(AlunosModel data) => json.encode(data.toMap());

class AlunosModel {
    final int idAluno;
    final String nome;
    final int codigoDaEscola;
    final String qrCode;
    final int barcode;
    final String filepath;
    final int telefoneDoResponsavel;
    final String endereco;
    final String foto;
    final int idCarrinha;

    AlunosModel({
        required this.idAluno,
        required this.nome,
        required this.codigoDaEscola,
        required this.qrCode,
        required this.barcode,
        required this.filepath,
        required this.telefoneDoResponsavel,
        required this.endereco,
        required this.foto,
        required this.idCarrinha,
    });

    factory AlunosModel.fromMap(Map<String, dynamic> json) => AlunosModel(
        idAluno: json["idAluno"],
        nome: json["Nome"],
        codigoDaEscola: json["codigo_da_escola"],
        qrCode: json["QRCode"],
        barcode: json["Barcode"],
        filepath: json["filepath"],
        telefoneDoResponsavel: json["Telefone_do_responsavel"],
        endereco: json["Endereco"],
        foto: json["Foto"],
        idCarrinha: json["Id_carrinha"],
    );

    Map<String, dynamic> toMap() => {
        "idAluno": idAluno,
        "Nome": nome,
        "codigo_da_escola": codigoDaEscola,
        "QRCode": qrCode,
        "Barcode": barcode,
        "filepath": filepath,
        "Telefone_do_responsavel": telefoneDoResponsavel,
        "Endereco": endereco,
        "Foto": foto,
        "Id_carrinha": idCarrinha,
    };
}
