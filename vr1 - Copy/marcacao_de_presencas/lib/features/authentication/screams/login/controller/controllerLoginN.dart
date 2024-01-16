import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControllerLogin extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController? controllerusername = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
}