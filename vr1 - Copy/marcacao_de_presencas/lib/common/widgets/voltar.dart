import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marcacao_de_presenca/constants/sizes.dart';
import 'package:marcacao_de_presenca/constants/strings.dart';

class Voltar extends StatelessWidget {
  const Voltar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
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
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed: () {
                  Get.back();
                },
                child: const Text(TStrings.voltar)),
          ),
        ),
      ],
    );
  }
}
