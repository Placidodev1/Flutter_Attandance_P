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

