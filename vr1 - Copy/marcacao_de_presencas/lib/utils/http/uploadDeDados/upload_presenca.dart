import 'package:marcacao_de_presenca/features/pagina_principal/model/funcionario_model.dart';
import 'package:marcacao_de_presenca/utils/helpers/helper_functions.dart';
import 'package:marcacao_de_presenca/utils/http/http_client.dart';

class CarregaFuncionariosLocal {
  static Future<List<FuncionarioModel>> guardaLocalmeteFuncionarios() async {
    try {
      final response = await THttpHelper.get('/Get_funcionario');

      if (response.containsKey('data')) {
        final jsonData = response['data'] as List<dynamic>;
        List<FuncionarioModel> funcionariosList = jsonData.map((json) {
          return FuncionarioModel.fromMap(json);
        }).toList();

        return funcionariosList;
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
