import 'package:marcacao_de_presenca/features/pagina_principal/model/cerinha_model.dart';
import 'package:marcacao_de_presenca/utils/helpers/helper_functions.dart';
import 'package:marcacao_de_presenca/utils/http/http_client.dart';


class CarregaCarinhaGen {
  static Future<List<CarinhaModel>> guardaLocalmeteCarinhas() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      final response = await THttpHelper.get('/Carinha');

      if (response.containsKey('data')) {
        final jsonData = response['data'] as List<dynamic>;

        List<CarinhaModel> carinhasList = jsonData.map((json) {
          return CarinhaModel.fromMap(json);
        }).toList();
        return carinhasList;
      } else {
        THelperFunctions.showAlert(
          "Erro ao carregar dados",
          "Resposta inválida do servidor ao guardar dados da carinha",
        );
        return [];
      }
    } catch (error) {
      THelperFunctions.showAlert(
          "Erro ao carregar dados $error", "Erro ao carregar dados dCarrinha");
      return [];
    }
  }
}




