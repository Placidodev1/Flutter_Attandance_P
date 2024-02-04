// ignore_for_file: non_constant_identifier_names, use_full_hex_values_for_flutter_colors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/zondicons.dart';
import 'package:marcacao_de_presenca/common/widgets/app_bar.dart';
import 'package:marcacao_de_presenca/common/widgets/botao.dart';
import 'package:marcacao_de_presenca/features/presenca_detalhes/controller/carrega_dados.dart';
import 'package:marcacao_de_presenca/features/presenca_detalhes/view/widgets/faixa_1_presenca.dart';
import 'package:marcacao_de_presenca/features/presenca_detalhes/view/widgets/faixa_2_presenca.dart';
import 'package:marcacao_de_presenca/utils/helpers/helper_functions.dart';

class Detalhesdafalta extends StatefulWidget {
  final int idpresenca;
  const Detalhesdafalta({super.key, required this.idpresenca});

  @override
  State<Detalhesdafalta> createState() => _DetalhesdafaltaState();
}

class _DetalhesdafaltaState extends State<Detalhesdafalta> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCBD5E0),
      appBar: CustomAppBar(),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Column(
              children: [
                SizedBox(height: THelperFunctions.screenHeight() * 0.025),
                const Center(
                  child: Text(
                    'Placido Nhapulo - Carinha 1',
                    style: TextStyle(
                      color: Color(0xFFF000000),
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                ),
                SizedBox(height: THelperFunctions.screenHeight() * 0.025),
                const Divider(
                  thickness: 3,
                  color: Color(0xFFF000000),
                ),
                CircleAvatar(
                  radius: THelperFunctions.screenHeight() * 0.10,
                  backgroundColor: const Color(0xFFFCBD5E0),
                  child: Iconify(
                    Zondicons.user,
                    size: THelperFunctions.screenHeight() * 0.10,
                    color: const Color(0xFFF112D4E),
                  ),
                ),
                SizedBox(height: THelperFunctions.screenHeight() * 0.025),
                const Text(
                  '25/05/2023',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: THelperFunctions.screenHeight() * 0.035),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: THelperFunctions.screenHeight() * 0.12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Parte 1
                      Faixa1Presenca(idPresenca: widget.idpresenca,),
                      Container(
                        width: 2,
                        color: const Color(0xFFF000000),
                        height: THelperFunctions.screenHeight() * 0.28,
                      ),
                      // faixa 2
                      Faixa2Presenca(),
                    ],
                  ),
                ),
                SizedBox(
                  height: THelperFunctions.screenHeight() * 0.035,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Botao(
                        cor: Colors.black, texto: "Voltar", rota: "Get.back()"),
                    SizedBox(
                      height: THelperFunctions.screenHeight() * 0.010,
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
