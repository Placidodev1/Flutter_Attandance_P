// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:get/get.dart';
import 'package:marcacao_de_presenca/constants/sizes.dart';

// ignore: must_be_immutable
class Botao extends StatelessWidget {
  final Color cor;
  final String texto;
  final String rota;
  const Botao({
    Key? key,
    required this.cor,
    required this.texto,
    required this.rota,
  }) : super(key: key);

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
                  backgroundColor: MaterialStateProperty.all<Color>(cor),
                ),
                onPressed: () {
                  // Get.toNamed();
                },
                child: Text(texto)),
          ),
        ),
      ],
    );
  }
}
