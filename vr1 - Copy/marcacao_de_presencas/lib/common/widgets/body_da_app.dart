// ignore_for_file: sized_box_for_whitespace, use_full_hex_values_for_flutter_colors


import 'package:flutter/material.dart';
import 'package:marcacao_de_presenca/constants/image_strings.dart';
import 'package:marcacao_de_presenca/constants/sizes.dart';
import 'package:marcacao_de_presenca/constants/strings.dart';



class BodyDaApp extends StatelessWidget {
  const BodyDaApp({
    super.key,
    required this.widthmedia,
  });

  final double widthmedia;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                constraints: BoxConstraints(
                  maxHeight: widthmedia * 0.39,
                  maxWidth: widthmedia * 0.07,
                ),
                child: Image.asset(
                  TImages.logoNormal,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // estudantes
                  SizedBox(
                    width: TSizes.buttonwidth,
                    height: TSizes.buttonHeight,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: const BorderSide(color: Colors.transparent)),
                        onPressed: () {},
                        child: const Text(
                          TStrings.estudantes,
                          style: TextStyle(color: Color(0xfff003459)),
                        )),
                  ),

                  const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  // guiaDeUso
                  SizedBox(
                    width: TSizes.buttonwidth,
                    height: TSizes.buttonHeight,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: const BorderSide(color: Colors.transparent)),
                        onPressed: () {},
                        child: const Text(TStrings.guiaDeUso,
                            style: TextStyle(color: Color(0xfff003459)))),
                  ),

                  const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  // contacte
                  SizedBox(
                    width: TSizes.buttonwidth,
                    height: TSizes.buttonHeight,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(TStrings.contacte),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          // Pesquisa de aluno
          // const PesquisaAluno(),

          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // registar
                SizedBox(
                  width: TSizes.buttonwidth,
                  height: TSizes.buttonHeight,
                  child: GestureDetector(
                    onTap: () {
                      // Get.to(() => const RegistarAlunos());
                    },
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF005909),
                        side: const BorderSide(color: Colors.transparent),
                      ),
                      onPressed: () {
                        // Get.to(() => const RegistarAlunos());
                      },
                      child: const Text(TStrings.registar),
                    ),
                  ),
                ),

                // proximo
                SizedBox(
                  width: TSizes.buttonwidth,
                  height: TSizes.buttonHeight,
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text(TStrings.proximo)),
                ),
              ])
        ],
      ),
    );
  }
}
