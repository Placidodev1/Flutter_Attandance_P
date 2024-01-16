import 'package:App_de_registo_de_dados/constants/strings.dart';
import 'package:get/get.dart';

class ControllerNovoFuncionario extends GetxController {
  var valorselecionado = TStrings.valorselecionado.obs;


  void onValSelecionado(String novoValor) {
    valorselecionado.value = novoValor;
  }
}