import 'dart:convert';

AlunosModelGenCartao alunosModelGenCartaoFromMap(String str) => AlunosModelGenCartao.fromMap(json.decode(str));

String alunosModelGenCartaoToMap(AlunosModelGenCartao data) => json.encode(data.toMap());

class AlunosModelGenCartao {
    final int idAluno;
    final String nome;
    final int codigoDaEscola;
    final String qrCode;
    final int barcode;
    final String filepath;

    AlunosModelGenCartao({
        required this.idAluno,
        required this.nome,
        required this.codigoDaEscola,
        required this.qrCode,
        required this.barcode,
        required this.filepath,
    });

    factory AlunosModelGenCartao.fromMap(Map<String, dynamic> json) => AlunosModelGenCartao(
        idAluno: json["idAluno"],
        nome: json["Nome"],
        codigoDaEscola: json["codigo_da_escola"],
        qrCode: json["QRCode"],
        barcode: json["Barcode"],
        filepath: json["filepath"],
    );

    Map<String, dynamic> toMap() => {
        "idAluno": idAluno,
        "Nome": nome,
        "codigo_da_escola": codigoDaEscola,
        "QRCode": qrCode,
        "Barcode": barcode,
        "filepath": filepath,
    };

  void assign(List<AlunosModelGenCartao> list) {}
}
