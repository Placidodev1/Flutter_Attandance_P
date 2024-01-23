// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'dart:core';
import 'package:marcacao_de_presenca/common/widgets/app_bar.dart';
import 'package:marcacao_de_presenca/features/pagina_principal/view/widgets/body.dart';



class PaginaPrincipalMarcacao extends StatefulWidget {
  const PaginaPrincipalMarcacao({super.key});

  @override
  State<PaginaPrincipalMarcacao> createState() =>
      _PaginaPrincipalMarcacaoState();
}

class _PaginaPrincipalMarcacaoState extends State<PaginaPrincipalMarcacao> {

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      backgroundColor: Color(0xfffcbd5e0),
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        // Corpo da app
        child: Body(),
      ),
    );
  }
}
