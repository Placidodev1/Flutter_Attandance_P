import 'package:get/get.dart';
import 'package:marcacao_de_presenca/features/pagina_principal/controller/aluno_estado.dart';
import 'package:marcacao_de_presenca/features/pagina_principal/model/aluno_model.dart';
import 'package:marcacao_de_presenca/utils/helpers/helper_functions.dart';
import 'package:marcacao_de_presenca/utils/http/http_client.dart';

class CarregaAlunos {
  static Future<List<AlunosModel>> carregarDadosDoAluno() async {
    final controller = Get.put((AlunoEstado()));

    try {
      final response = await THttpHelper.get('/Alunos');

      if (response.containsKey('data')) {
        final jsonData = response['data'] as List<dynamic>;

        List<AlunosModel> alunosList = jsonData.map((json) {
          return AlunosModel.fromMap(json);
        }).toList();
        controller.originalList.assignAll(alunosList);
        return alunosList;
      } else {
        THelperFunctions.showAlert(
            "Erro ao carregar dados", "Resposta inválida do servidor");
        return [];
      }
    } catch (error) {
      THelperFunctions.showAlert("Erro ao carregar dados $error", "Por se personalizar");
      return [];
    }
  }
}
