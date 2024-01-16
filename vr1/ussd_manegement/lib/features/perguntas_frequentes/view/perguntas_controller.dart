
import 'package:App_de_registo_de_dados/common/widgets/appBar.dart';
import 'package:App_de_registo_de_dados/common/widgets/body_da_app.dart';
import 'package:App_de_registo_de_dados/common/widgets/bottom.dart';

import 'package:App_de_registo_de_dados/utils/helpers/helper_functions.dart';

import 'package:flutter/material.dart';
import 'dart:core';



class RegistarAlunos extends StatefulWidget {
  const RegistarAlunos({super.key});

  @override
  State<RegistarAlunos> createState() => _RegistarAlunosState();
}

class _RegistarAlunosState extends State<RegistarAlunos> {
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      body: BodyDaApp(widthmedia: THelperFunctions.screenWidth()),
      bottomNavigationBar: const BottomBar(),
    ));
  }

}
