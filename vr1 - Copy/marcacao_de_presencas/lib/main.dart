import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marcacao_de_presenca/app_principal.dart';
import 'package:marcacao_de_presenca/features/pagina_principal/controller/aluno_estado.dart';


void main() {
  Get.put(AlunoEstado());
  runApp(const AppPrincipal());
}


