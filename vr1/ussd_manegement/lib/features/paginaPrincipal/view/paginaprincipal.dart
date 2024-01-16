// ignore_for_file: non_constant_identifier_names, use_full_hex_values_for_flutter_colors


import 'package:App_de_registo_de_dados/common/widgets/appBar.dart';
import 'package:App_de_registo_de_dados/common/widgets/bottom.dart';
import 'package:App_de_registo_de_dados/common/widgets/body_da_app.dart';
import 'package:App_de_registo_de_dados/features/qrBarGenerator/controller/busca_dados.dart';
import 'package:App_de_registo_de_dados/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'dart:core';


class PaginaprincipalRegistro extends StatefulWidget {
  const PaginaprincipalRegistro({super.key});

  @override
  State<PaginaprincipalRegistro> createState() =>
      _PaginaprincipalRegistroState();
}

class _PaginaprincipalRegistroState extends State<PaginaprincipalRegistro> {
  @override
  void initState() {
    super.initState();

    HttpServiceCarregaDados.carregarDadosDoAluno();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: const CustomAppBar(),
      body: BodyDaApp(widthmedia: THelperFunctions.screenWidth()),
      bottomNavigationBar: const BottomBar(),
    ));
  }

 
}
