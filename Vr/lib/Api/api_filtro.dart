import 'dart:convert';

import 'package:Registoflutterattandance/Urlproject.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

Uripadrao uri = Uripadrao();
String uriausar = uri.Uri;

class HttpFiltroPesquisa {
  
  //faz fetch do momemnto de cada presenca
  static dynamic filtro(String nome, BuildContext context) async {
    try {
      //query que faz tal requesicao dos 4 momentos
      final url = Uri.parse('$uriausar/filtro_de_pesquisa/$nome');

      final response = await http.get(url);
      final body = response.body;
      final resjson = jsonDecode(body);
      // print(resjson);
      //verifica se a query teve algum resultado
      if (resjson["code"] == 200) {
        return resjson["data"];
      } else if(resjson["code"] == 500) {
        throw Exception(resjson["message"]);
      }
    } catch (error) {
      throw Exception('Erro $error');
    }
  }


// //  Faz fetch da presenca
//     static Future<dynamic> presenca(int idpresenca, BuildContext context) async {
//     try {
//       //query que faz tal requesicao dos 4 momentos
//       final url = Uri.parse('$uriausar/getpresenca/$idpresenca');

//       final response = await http.get(url);
//       final body = response.body;
//       final resjson = jsonDecode(body);
//       // print(resjson);
//       //verifica se a query teve algum resultado
//       if (response.statusCode == 200) {
//         return resjson;
//       } else {
//         throw Exception('Erro de requisicao');
//       }
//     } catch (error) {
//       throw Exception('Erro $error');
//     }
//   }
}
