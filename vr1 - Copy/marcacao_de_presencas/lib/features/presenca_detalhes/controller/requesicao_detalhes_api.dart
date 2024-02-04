import 'package:marcacao_de_presenca/utils/http/http_client.dart';

class HttpServiceDetalhesPresenca {
  //faz fetch do momemnto de cada presenca
  static Future<dynamic> detalhes(int idpresenca) async {
    try {
      //query que faz tal requesicao dos 4 momentos
      final response = await THttpHelper.get("momentopresenca/$idpresenca");

      //verifica se a query teve algum resultado
      if (response.containsKey("data")) {
        return response["data"];
      } else if (response.containsKey("Erro")) {
        throw Exception('Erro de requisicao');
      }
    } catch (error) {
      throw Exception('Erro $error');
    }
  }

//  Faz fetch da presenca
  static Future<dynamic> presenca(int idpresenca) async {
    try {
      final response = await THttpHelper.get("getpresenca/$idpresenca");
      //verifica se a query teve algum resultado
      if (response.containsKey("data")) {
        return response["data"];
      } else if (response.containsKey("Erro")) {
        throw Exception('Erro de requisicao');
      }
    } catch (error) {
      throw Exception('Erro $error');
    }
  }
}
