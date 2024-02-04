import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:marcacao_de_presenca/utils/helpers/helper_functions.dart';
import 'package:marcacao_de_presenca/utils/http/http_client.dart';


class HttpServiceFinalizar {
  // static final _client = http.Client();

  static Future<bool> Finalizar(
      int tipodemarcacao, int idcarinha, BuildContext context) async {
    try {
      THelperFunctions.showProgress();

      final response = await THttpHelper.get('marcar_presenca_a_todos/$tipodemarcacao/$idcarinha')
      if (response == 200) {
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
        return true;
      } else {
        throw Exception('Erro');
      }
    } catch (error) {
      throw Exception('Erro $error');
    }
  }
}
