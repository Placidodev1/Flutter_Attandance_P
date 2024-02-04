import 'package:marcacao_de_presenca/features/pagina_principal/model/presenca_model.dart';
import 'package:marcacao_de_presenca/utils/helpers/helper_functions.dart';
import 'package:marcacao_de_presenca/utils/http/http_client.dart';

class CarregaPresencasRemotas {
  static Future<List<PresencaModelFunc>> buscaPresencas() async {
    try {
      final response = await THttpHelper.get('/Presenca/1');

      if (response.containsKey('data')) {
        final jsonData = response['data'] as List<dynamic>;
        
        List<PresencaModelFunc> presencaList = jsonData.map((json) {
          return PresencaModelFunc.fromMap(json);
        }).toList();

        return presencaList;
      } else {
        THelperFunctions.showAlert(
          "Erro ao carregar dados",
          "Resposta inválida do servidor para dados do funcionario",
        );
        return [];
      }
    } catch (error) {
      THelperFunctions.showAlert("Erro ao carregar dados $error",
          "Erro ao carregar dados do funcionario");
      return [];
    }
  }
}
