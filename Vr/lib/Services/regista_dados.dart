import 'dart:convert';

import 'package:Registoflutterattandance/Urlproject.dart';
import 'package:http/http.dart' as http;

dynamic dadosAluno;
Uripadrao uri = Uripadrao();
String uriausar = uri.Uri;

fetchDadosDeMarcacao(int idAluno) async {
  try {
    final url = '$uriausar/Aluno_especifico/$idAluno';
    final uri = Uri.parse(url);

    final response = await http.get(uri);

    final body = response.body;
    print(body);
    dadosAluno = jsonDecode(body);
  } catch (e) {
    throw Exception(e);
  }

  String? barcode;
  String? qrCode;

  if (dadosAluno != null) {
    barcode = dadosAluno['data'][0]['Barcode'].toString();
    qrCode = dadosAluno['data'][0]['QRCode'].toString();
  }

  if (barcode != null && qrCode != null) {
    try {
      final url = '$uriausar/Aluno_especifico/$idAluno';
      final uri = Uri.parse(url);

      final resposta = await http.get(uri);

      
    } catch (e) {}
  }
}

// // ignore: non_constant_identifier_names
// registarDadosParaMarcacao(dynamic Aluno) async {
//   var dadosJson = jsonEncode(dados);

//   var headers = {'Content-Type': 'application/json'};

//   final url =
//       'http://192.168.18.65:5000/marcar_presenca/$idaluno/$tipodemarcacao';

//   final uri = Uri.parse(url);

//   final response = await http.post(uri, headers: headers, body: dadosJson);

//   final body = response.body;
//   final body1 = jsonDecode(body);
//   print(body1);
//   return {'body1': body1, 'tipodemarcacao': tipodemarcacao};
// }