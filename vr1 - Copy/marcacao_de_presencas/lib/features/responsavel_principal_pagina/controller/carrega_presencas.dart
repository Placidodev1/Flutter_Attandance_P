import 'package:marcacao_de_presenca/features/responsavel_principal_pagina/model/presenca_model.dart';
import 'package:marcacao_de_presenca/utils/helpers/helper_functions.dart';
import 'package:marcacao_de_presenca/utils/http/http_client.dart';

class CarregaPresencas {
  static Future<List<PresencaModel>> carregarPresencas(int idaluno) async {


    try {
      final response = await THttpHelper.get('/Presenca_aluno/semana/$idaluno');
      if (response.containsKey('data')) {
        final jsonData = response['data'] as List<dynamic>;

        List<PresencaModel> presencaList = jsonData.map((json) {
        String dataString = json['Data_presenca'];

        List<String> partes = dataString.split(",");
        String dataFormatada = partes[1];
        String data = dataFormatada.substring(1, 12);

        String estado1 = (json['Local_subida_casa_escola'] != 'faltou' &&
                json['Local_subida_casa_escola'].isNotEmpty)
            ? "presente"
            : "ausente";

        String estado2 = (json['Local_subida_casa_escola'] != 'faltou' &&
                json['Local_subida_casa_escola'].isNotEmpty)
            ? "presente"
            : "ausente";
          return PresencaModel(
            idpresenca: json["idpresenca"],
            estado1: estado1,
            estado2: estado2,
            data: data,
          );
        }).toList();
        
        return presencaList;
      } else {
        THelperFunctions.showAlert(
          "Erro ao carregar dados",
          "Resposta inválida do servidor",
        );
        return [];
      }
    } catch (error) {
      THelperFunctions.showAlert(
          "Erro ao carregar dados $error", "Por se personalizar");
      return [];
    }
  }
}


 