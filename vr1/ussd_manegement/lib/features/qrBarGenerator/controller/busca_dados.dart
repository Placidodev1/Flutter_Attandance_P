import 'package:App_de_registo_de_dados/features/qrBarGenerator/controller/qr_bar_controller.dart';
import 'package:App_de_registo_de_dados/features/qrBarGenerator/model/alunos_para_pesquisa_model.dart';
import 'package:App_de_registo_de_dados/utils/helpers/helper_functions.dart';
import 'package:App_de_registo_de_dados/utils/http/http_client.dart';
import 'package:get/get.dart';

class HttpServiceCarregaDados {
  static Future<List<AlunosModelGenCartao>> carregarDadosDoAluno() async {
    final controller = Get.put(QrBarController());

    try {
      final response = await THttpHelper.get('/Alunos');

      if (response.containsKey('data')) {
        final jsonData = response['data'] as List<dynamic>;

        List<AlunosModelGenCartao> alunosList = jsonData.map((json) {
          return AlunosModelGenCartao.fromMap(json);
        }).toList();
        controller.originalList.assignAll(alunosList);
        return alunosList;
      } else {
        THelperFunctions.showAlert(
            "Erro de login", "Resposta inválida do servidor");
        return [];
      }
    } catch (error) {
      THelperFunctions.showAlert("Erro de login", "Por se personalizar");
      return [];
    }
  }
}
