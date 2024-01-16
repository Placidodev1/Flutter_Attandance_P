
import 'package:get/get.dart';
import 'package:marcacao_de_presenca/features/authentication/screams/login/controller/controllerLoginN.dart';
import 'package:marcacao_de_presenca/utils/helpers/helper_functions.dart';
import 'package:marcacao_de_presenca/utils/http/http_client.dart';


class HttpService {
  static Future<bool> login() async {
    final controller = Get.put(ControllerLogin());

    try {
      Map<String, dynamic> postData = {
        "password": controller.passwordController!.value.text,
        "email": controller.controllerusername!.value.text,
      };
      THttpHelper.post('Login', postData).then((response) {
        try {
          if (response['code'] == 401) {
            final String errorMessage = response['msg'];
            THelperFunctions.showAlert("Erro de login", errorMessage);
            return false;
          } else if (response['code'] == 200) {
            // Get.to(() => const PaginaprincipalRegistro());

            return true;
          }
        } catch (error) {
          THelperFunctions.showAlert("Erro de login", "Por se personalizar");
          
        }
      }).catchError((error) {
        THelperFunctions.showAlert("Erro de login", "Por se personalizar");
        return false;
      });

      // Add a return statement to address the warning
      return false;
    } catch (error) {
      THelperFunctions.showAlert("Erro de login", "Por se personalizar");
      return false;
    }
  }
}
