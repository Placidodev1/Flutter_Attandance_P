
// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

ModelAluno modelAlunoFromMap(String str) => ModelAluno.fromMap(json.decode(str));

String modelAlunoToMap(ModelAluno data) => json.encode(data.toMap());

class ModelAluno {
    final int? idAluno;
    final String Nome;
    final String Endereco;
    final int Telefone_do_responsavel;
    final int codigo_da_escola;
    final String QRCode;
    final String FaceId;
    final int Barcode;
    final int Id_carrinha;
    final int id_Responsavel;
    final String email;
    final String filepath;

    ModelAluno({this.idAluno,
      required this.Nome,
      required this.Endereco, 
      required this.Telefone_do_responsavel, 
      required this.codigo_da_escola, 
      required this.QRCode, 
      required this.FaceId, 
      required this.Barcode, 
      required this.Id_carrinha, 
      required this.id_Responsavel, 
      required this.email, 
      required this.filepath, 
            });

    factory ModelAluno.fromMap(Map<String, dynamic> json) => ModelAluno(
        idAluno: json["idAluno"],
        Nome: json["Nome"],
        Endereco: json["Endereco"],
        Telefone_do_responsavel: json["Telefone_do_responsavel"],
        codigo_da_escola: json["codigo_da_escola"],
        QRCode: json["QRCode"],
        FaceId: json["FaceId"],
        Barcode: json["Barcode"],
        Id_carrinha: json["Id_carrinha"],
        id_Responsavel: json["id_Responsavel"],
        email: json["email"],
        filepath: json["filepath"],
    );

    Map<String, dynamic> toMap() => {
        "idAluno": idAluno,
        "Nome": Nome,
        "Endereco": Endereco,
        "Telefone_do_responsavel": Telefone_do_responsavel,
        "codigo_da_escola": codigo_da_escola,
        "QRCode": QRCode,
        "FaceId": FaceId,
        "Barcode": Barcode,
        "Id_carrinha": Id_carrinha,
        "id_Responsavel": id_Responsavel,
        "email": email,
        "filepath": filepath,
    };
}
