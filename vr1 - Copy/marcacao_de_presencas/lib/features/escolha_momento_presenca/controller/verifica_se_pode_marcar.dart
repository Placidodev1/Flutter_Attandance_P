import 'package:get/get.dart';
import 'package:marcacao_de_presenca/features/authentication/screams/login/controller/controller_login.dart';
import 'package:marcacao_de_presenca/features/pagina_principal/view/princi_funcionario.dart';
import 'package:marcacao_de_presenca/utils/helpers/helper_functions.dart';
import 'package:marcacao_de_presenca/utils/http/http_client.dart';

class PossibilidadeDeMarcaca {
  static void verificaSePodeSeListar(number) async {
    final controller = Get.put(ControllerLogin());

    if (number == 1) {
      dynamic situacao = await fetchaAlunos(1, controller.funcionario!.idCarrinha);
      if (situacao['situacao']  == false) {
        Get.to(const PaginaPrincipalMarcacao());
      } else {
        THelperFunctions.showAlert(
            "Ja efetuou todas marcações para este momento",
            "Por favou tente o momento abaixo");
      }
    }
    if (number == 2) {
      dynamic situacao =
          await fetchaAlunos(2, controller.funcionario!.idCarrinha);
      if (situacao['situacao'] == false) {
        Get.to(const PaginaPrincipalMarcacao());
      } else if (situacao["msg"] == "Marcacao feita") {
        THelperFunctions.showAlert(
            "Ja efetuou todas marcações para este momento",
            "Por favou tente o momento abaixo");
      } else if (situacao["msg"] == "Termine a marcacao acima") {
        THelperFunctions.showAlert(
            "Ja efetuou todas marcações para este momento",
            "Por favou tente o momento acima");
      }
    }
    if (number == 3) {
      dynamic situacao =
          await fetchaAlunos(3, controller.funcionario!.idCarrinha);
      if (situacao["situacao"] == false) {
        Get.to(const PaginaPrincipalMarcacao());
      } else if (situacao["msg"] == "Marcacao feita") {
        THelperFunctions.showAlert(
            "Ja efetuou todas marcações para este momento",
            "Por favou tente o momento abaixo");
      } else if (situacao["msg"] == "Termine a marcacao acima") {
        THelperFunctions.showAlert(
            "Ja efetuou todas marcações para este momento",
            "Por favou tente o momento abaixo");
      }
    }
    if (number == 4) {
      dynamic situacao =
          await fetchaAlunos(4, controller.funcionario!.idCarrinha);
      if (situacao["situacao"] == false) {
        Get.to(const PaginaPrincipalMarcacao());
      } else if (situacao["msg"] == "Marcacao feita") {
        THelperFunctions.showAlert(
            "Ja efetuou todas marcações para este momento",
            "Por favou tente o momento abaixo");
      } else if (situacao["msg"] == "Termine a marcacao acima") {
        THelperFunctions.showAlert(
            "Ja efetuou todas marcações para este momento",
            "Por favou tente o momento abaixo");
      }
    }
  }
}

Future<Map<String, dynamic>> fetchaAlunos(int arg1, arg2) async {
  final response = await THttpHelper.get('/verificador_presenca/$arg1/$arg2');

  return response;
}
