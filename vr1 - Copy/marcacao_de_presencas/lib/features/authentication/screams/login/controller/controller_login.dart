import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marcacao_de_presenca/features/authentication/screams/login/model/funcionario_model.dart';

class ControllerLogin extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController? controllerusername = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  FuncionarioModel? funcionario;
}
