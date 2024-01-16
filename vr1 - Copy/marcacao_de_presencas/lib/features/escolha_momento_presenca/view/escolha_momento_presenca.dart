// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:marcacao_de_presenca/common/widgets/appBar.dart';
import 'package:marcacao_de_presenca/features/escolha_momento_presenca/view/widgets/momentos.dart';
import 'package:marcacao_de_presenca/utils/helpers/helper_functions.dart';

class MomentoPresenca extends StatelessWidget {
  const MomentoPresenca({super.key});

  @override
  Widget build(BuildContext context) {



    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: THelperFunctions.screenWidth() * 0.05, vertical: 0),
        child: Momentos(),
      ),
    ));
  }
}
