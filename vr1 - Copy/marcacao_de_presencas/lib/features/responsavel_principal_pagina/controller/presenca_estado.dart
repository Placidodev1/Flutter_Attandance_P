import 'package:get/get.dart';
import 'package:marcacao_de_presenca/features/responsavel_principal_pagina/model/presenca_model.dart';

class PresencaEstado extends GetxController {
  static PresencaEstado get instance => Get.find();
  RxList<PresencaModel> originalList = <PresencaModel>[].obs;
  PresencaModel? presencaSelecionado;
  // PresencaModel? responsavel ;
  

  // filterResUmAluno(int query) {
  //   presencaSelecionado = originalList
  //       .firstWhere((item) => item.nome.contains((query).toString()));
  // }
}
