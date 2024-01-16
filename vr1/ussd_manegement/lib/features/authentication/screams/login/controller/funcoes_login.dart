import 'package:App_de_registo_de_dados/features/authentication/screams/login/controller/controllerLoginN.dart';
import 'package:App_de_registo_de_dados/features/authentication/screams/login/controller/http_service.dart';
import 'package:get/get.dart';


class FuncoesLogin {
  final controller = Get.put(ControllerLogin());
  void _navigar() async {

      // showCustomDialog(context);

      // Verifica o controller ao se tentar iniciar sessao
      String username = (controller.controllerusername!.text.isEmpty)
          ? "vazio"
          : controller.controllerusername!.text;

      int password = (controller.passwordController!.text.isEmpty)
          ? 0
          : int.parse(controller.passwordController!.text);

      try {

        if (password != 0 || username != "vazio") {

            await HttpService.login();

        } else {
          
        }
      } catch (error) {
        print("Erro durante o login: $error");
      }
    }
  }

