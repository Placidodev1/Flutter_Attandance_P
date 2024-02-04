import 'package:get/get.dart';
import 'package:marcacao_de_presenca/features/aluno_detalhes/model/responsavel_model.dart';

import 'package:marcacao_de_presenca/features/pagina_principal/controller/aluno_estado.dart';
import 'package:marcacao_de_presenca/utils/helpers/helper_functions.dart';
import 'package:marcacao_de_presenca/utils/http/http_client.dart';

class CarregaResponsavel {
  static Future<ResponsavelModel?> fetchDataFromResponsavel(int idAluno) async {
    final controller = Get.put(AlunoEstado());

    try {
      final response = await THttpHelper.get('/responsavel/$idAluno');

      if (response.containsKey('data')) {
        final jsonData = response['data'] as List<dynamic>;
        ResponsavelModel responsavel = ResponsavelModel.fromMap(jsonData[0]);
        controller.responsavel = responsavel;

        return responsavel;
      } else {
        THelperFunctions.showAlert(
            "Erro ao carregar dados", "Resposta inválida do servidor");
        return null;
      }
    } catch (error) {
      THelperFunctions.showAlert(
          "Erro ao carregar dados $error", "Por se personalizar");
      return null;
    }
  }
}
