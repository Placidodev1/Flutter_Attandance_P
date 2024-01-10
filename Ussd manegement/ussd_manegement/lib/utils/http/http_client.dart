import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class THttpHelper {
  static const String _baseUrl = 'hhtps://api.com';

  // Funcao para fazer get request
  static Future<Map<String, dynamic>> get(String endpoint) async {
    final Response = await http.get(Uri.parse('$_baseUrl/$endpoint'));
    return _handleResponse(Response);
  }

  // Funcao que faz requesicao post

  static Future<Map<String, dynamic>> post(
      String endpoint, dynamic data) async {
    final response = await http.post(Uri.parse('$_baseUrl/$endpoint'),
        headers: {'Content-Type': 'aplication/json'}, body: json.encode(data));
    return _handleResponse(response);
  }

  // Funcao que faz requesicao put

  static Future<Map<String, dynamic>> put(String endpoint, dynamic data) async {
    final response = await http.put(Uri.parse('$_baseUrl/$endpoint'),
        headers: {'Content-Type': 'application/json'}, body: json.encode(data));
    return _handleResponse(response);
  }

  // Funcao delete http
  static Future<Map<String, dynamic>> delete(String endpoint) async {
    final response = await http.delete(Uri.parse('$_baseUrl/$endpoint'));
    return _handleResponse(response);
  }

  // Trata respostas http

  static Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Falha ao carregar dados ${response.statusCode}');
    }
  }
}
