import 'package:marcacao_de_presenca/features/aluno_detalhes/model/responsavel_model.dart';
import 'package:marcacao_de_presenca/utils/helpers/helper_functions.dart';
import 'package:marcacao_de_presenca/utils/http/http_client.dart';

class CarregaResponsaveisGen {
  static Future<List<ResponsavelModel>> guardaLocalmeteResponsaveis() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      final response = await THttpHelper.get('/responsaveis');

      if (response.containsKey('data')) {
        final jsonData = response['data'] as List<dynamic>;

        List<ResponsavelModel> alunosList = jsonData.map((json) {
          return ResponsavelModel.fromMap(json);
        }).toList();
        return alunosList;
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

