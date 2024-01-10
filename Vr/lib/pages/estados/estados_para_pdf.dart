import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class MeuController extends GetxController {
  RxList<String> numerosFiltrados = <String>[].obs;
  RxList<String> numerosFiltradosemail = <String>[].obs;
  Uint8List? pngBytes;
  Uint8List? pngBytesqr;
  var emailController = TextEditingController();
  var userController = TextEditingController();

  void onValStreamChanged(String novoValor) {
    // valStream.value = novoValor;
  }

  void onValEmailSelecionadoChanged(String novoValor) {
    // emailselecionado.value = novoValor;
  }

  void onValSelecionado(String novoValor) {
    // valorselecionado.value = novoValor;
  }

  void onValMegasChanged(String novoValor) {
    // valMegas.value = novoValor;
  }

  String validator(String value) {
    if (value.isEmpty) {
      return 'Please this field must be filled';
    }
    return '';
  }
}
