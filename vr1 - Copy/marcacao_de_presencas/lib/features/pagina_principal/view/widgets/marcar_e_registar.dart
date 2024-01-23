// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marcacao_de_presenca/constants/sizes.dart';
import 'package:marcacao_de_presenca/constants/strings.dart';
import 'package:marcacao_de_presenca/features/tipo_de_marcacao/view/tipo_de_marcacao.dart';

class BotoesDeCimaMarcarEFinalizar extends StatelessWidget {
  const BotoesDeCimaMarcarEFinalizar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(60, 0, 0, 0),
                  spreadRadius: 0.05,
                  blurRadius: 3.5,
                  offset: Offset(0, 2)),
            ],
          ),
          child: SizedBox(
            width: TSizes.buttonwidth,
            height: TSizes.buttonHeight,
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color(0xfff003459)),
                ),
                onPressed: () {
                  Get.to(const TipoDeMarcacao());
                },
                child: const Text(TStrings.marcar)),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(60, 0, 0, 0),
                  spreadRadius: 0.05,
                  blurRadius: 3.5,
                  offset: Offset(0, 2)),
            ],
          ),
          child: SizedBox(
            width: TSizes.buttonwidth,
            height: TSizes.buttonHeight,
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                onPressed: () {},
                child: const Text(TStrings.finalizar)),
          ),
        ),
      ],
    );
  }
}
