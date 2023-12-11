import 'dart:convert';
import 'package:Registoflutterattandance/Urlproject.dart';
import 'package:http/http.dart' as http;
import 'package:Registoflutterattandance/pages/Funcionario_captura_de_dados/Pagina_principal.dart';
Uripadrao uri = Uripadrao();
  String uriausar = uri.Uri;
 dynamic fetchaAlunos() async {
  // Url de requesicao de alunos
  print('fetchUer');
  final url = '$uriausar/Alunos';
  final uri = Uri.parse(url);
  final response = await http.get(uri);
  final body = response.body;
  final alunos = jsonDecode(body);
  
  return alunos['data']; 
}
