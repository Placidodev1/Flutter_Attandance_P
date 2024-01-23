import 'dart:convert';

class FuncionarioModel {
  final int idFuncionario;
  final String departamento;
  final String cargo;
  final int idCarrinha;
  final String nome;

  FuncionarioModel({
    required this.idFuncionario,
    required this.departamento,
    required this.cargo,
    required this.idCarrinha,
    required this.nome,
  });

  // Manual deserialization from a Map<String, dynamic>
  factory FuncionarioModel.fromMap(Map<String, dynamic> json) {
    return FuncionarioModel(
      idFuncionario: json["idFuncionario"] as int,
      departamento: json["Departamento"] as String,
      cargo: json["Cargo"] as String,
      idCarrinha: json["id_Carrinha"] as int,
      nome: json["Nome"] as String,
    );
  }

  // Manual serialization to a Map<String, dynamic>
  Map<String, dynamic> toMap() {
    return {
      "idFuncionario": idFuncionario,
      "Departamento": departamento,
      "Cargo": cargo,
      "id_Carrinha": idCarrinha,
      "Nome": nome,
    };
  }

  // Manual serialization to JSON String
  String toJson() {
    return json.encode(toMap());
  }

  // Manual deserialization from JSON String
  factory FuncionarioModel.fromJson(String jsonString) {
    return FuncionarioModel.fromMap(json.decode(jsonString));
  }
}
