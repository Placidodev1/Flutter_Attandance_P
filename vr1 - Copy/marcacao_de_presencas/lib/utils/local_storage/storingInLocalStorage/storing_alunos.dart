import 'package:marcacao_de_presenca/utils/helpers/helper_functions.dart';
import 'package:marcacao_de_presenca/utils/http/http_client.dart';
import 'package:marcacao_de_presenca/utils/local_storage/sqlite/modals/aluno_model.dart';

class CarregaAlunosGen {
  static Future<List<ModelAluno>> guardaLocalmeteAlunos() async {
    try {
      await Future.delayed(const Duration(seconds: 5));
      final response = await THttpHelper.get('/Alunos');

      if (response.containsKey('data')) {
        final jsonData = response['data'] as List<dynamic>;

        List<ModelAluno> alunosList = jsonData.map((json) {
          return ModelAluno.fromMap(json);
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




