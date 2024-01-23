import 'package:get/get.dart';
import 'package:marcacao_de_presenca/features/authentication/screams/login/controller/controller_login.dart';
import 'package:marcacao_de_presenca/features/authentication/screams/login/model/funcionario_model.dart';
import 'package:marcacao_de_presenca/features/escolha_momento_presenca/view/escolha_momento_presenca.dart';
import 'package:marcacao_de_presenca/features/responsavel_principal_pagina/view/principal_pagina.dart';
import 'package:marcacao_de_presenca/utils/helpers/helper_functions.dart';
import 'package:marcacao_de_presenca/utils/http/http_client.dart';

//             await HttpService.login(username, password, context);
//           } else if (password.toString().length == 6) {
//             await HttpServiceEncarregado.login(username, password, context);

//           }else{
//             await HttpService.login(username, password, context);
//           }
//         } else {
//           dialogoCostumizado(context, "Username ou password vazio", "Ooops!!!");
//         }
//       } catch (error) {
//         print("Erro durante o login: $error");
//       }
//     }
class HttpService {
  static Future<bool> login() async {
    final controller = Get.put(ControllerLogin());

    try {
      String username = (controller.controllerusername!.value.text.isEmpty)
          ? "vazio"
          : controller.controllerusername!.value.text;

      int password = (controller.passwordController!.value.text.isEmpty)
          ? 0
          : int.parse(controller.passwordController!.value.text);

      Map<String, dynamic> postData = {
        "password": password,
        "email": username,
      };
      if (password != 0 || username != "vazio") {
        if (password.toString().length == 5) {
          THttpHelper.post('Login', postData).then((response) {
            try {
              if (response['code'] == 401) {
                final String errorMessage = response['msg'];
                THelperFunctions.showAlert("Erro de login", errorMessage);
                return false;
              } else if (response['code'] == 200) {
                String jsonExample =
                    '{"idFuncionario": ${response["id"]}, "Departamento": "${response["departamento"]}", "Cargo": "${response["cargo"]}", "id_Carrinha": ${response["Carinha"]}, "Nome": "${response["nome_user"]}"}';

                FuncionarioModel funcionario =
                    FuncionarioModel.fromJson(jsonExample);

                controller.funcionario = funcionario;
                Get.to(const MomentoPresenca());
                return true;
              }
            } catch (error) {
              THelperFunctions.showAlert(
                  "Erro de login", "Por se personalizar1");
            }
          }).catchError((error) {
            THelperFunctions.showAlert("Erro de login", error.toString());
            return false;
          });
        } else if (password.toString().length == 6) {
          THttpHelper.post('Loginresponsavel', postData).then((response) {
            try {
              if (response['code'] == 401) {
                final String errorMessage = response['msg'];
                THelperFunctions.showAlert("Erro de login", errorMessage);
                return false;
              } else if (response['code'] == 200) {

                Get.to(const PaginaprincipalResponsavel());

                return true;
              }
            } catch (error) {
              THelperFunctions.showAlert("Erro de login", error.toString());
            }
          }).catchError((error) {
            THelperFunctions.showAlert("Erro de login", error.toString());
            return false;
          });
        }
      }

      // Add a return statement to address the warning
      return false;
    } catch (error) {
      THelperFunctions.showAlert("Erro de login", "Por se personalizar");
      return false;
    }
  }
}
