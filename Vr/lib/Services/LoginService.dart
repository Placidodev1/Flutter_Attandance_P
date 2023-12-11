import 'dart:convert';
import 'dart:io';
import 'package:Registoflutterattandance/Construtores/Idfuncionario.dart';
import 'package:Registoflutterattandance/Urlproject.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Uripadrao uri = Uripadrao();
String uriausar = uri.Uri;

class HttpService {
  //usa uma funcao do flutter para
  static final _client = http.Client();

  static final _loginUrl = Uri.parse('$uriausar/Login');
  //funcao reponsavel por iniciar  a sessao e guardar a sessao
  static Future<bool> login(
      String email, int password, BuildContext context) async {
    try {
      print(email);
      print(password);
      // Converta os dados para um formato JSON
      String requestBody = jsonEncode({
        "email": email,
        "password": password.toString(),
      });

      http.Response response = await _client.post(
        _loginUrl,
        headers: {
          'Content-Type': 'application/json',
        },
        body: requestBody,
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        print(data);
        if (data['code'] == 401) {
          final String errorMessage = data['msg'];
          // print('Erro durante o login: $errorMessage');
          // ignore: use_build_context_synchronously
          _showErrorDialog(context, errorMessage);
          return false;
        } else if (data['code'] == 200) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          print("essa vida");
          int idfuncionario = data['id'];
          print("essa vida haha");
          print(idfuncionario);
          print("essa vida hihi");
          await prefs.setString('token', data['token']);
          // ignore: use_build_context_synchronously
          Navigator.of(context).pop();
          Navigator.pushNamed(
            context,
            '/pagina_principal',
            arguments: Idfuncionario(idfuncionario: idfuncionario),
          );

          return true;
        }
      } else {
        throw Exception('Credenciais inválidas');
      }

      // Add a return statement to address the warning
      return false;
    } catch (error) {
      // ignore: use_build_context_synchronously
      _showErrorDialog(context, 'Erro durante o login: $error');
      return false;
    }
  }

  static void _showErrorDialog(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Erro de Login'),
          content: Text(errorMessage),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
