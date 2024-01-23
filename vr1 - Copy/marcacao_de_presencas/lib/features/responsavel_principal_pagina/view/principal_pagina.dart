// ignore_for_file: use_full_hex_values_for_flutter_colors
import 'package:flutter/material.dart';
import 'package:marcacao_de_presenca/common/widgets/app_bar.dart';
import 'package:marcacao_de_presenca/common/widgets/botao.dart';
import 'package:marcacao_de_presenca/constants/sizes.dart';
import 'package:marcacao_de_presenca/features/responsavel_principal_pagina/controller/carrega_presencas.dart';
import 'package:marcacao_de_presenca/features/responsavel_principal_pagina/view/wigets/prensenca_simples.dart';
import 'package:marcacao_de_presenca/utils/helpers/helper_functions.dart';

class PaginaprincipalResponsavel extends StatefulWidget {
  const PaginaprincipalResponsavel({super.key});

  @override
  State<PaginaprincipalResponsavel> createState() => _PaginaprincipalState();
}

class _PaginaprincipalState extends State<PaginaprincipalResponsavel> {
  List<dynamic> presenca = [];
  List<Presencasimples> presencaformatada = [];

  //Lista as presencas
  // void fetchalunos(int idaluno) async {
  //   await fetchaPresenca(idaluno);
  // }
  @override
  void initState() {
    super.initState();
    CarregaPresencas.carregarPresencas(1);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xfffcbd5e0),
      appBar: const CustomAppBar(),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: THelperFunctions.screenWidth() *0.02),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            const Center(
              child: Text(
                'Placido Nhapulo - Carinha 1',
                style: TextStyle(
                  color: Color(0xfff000000),
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),

            //Traco
            const Divider(
              thickness: 3,
              color: Color(0xfff000000),
            ),

            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            // Botoes de filtragem de presencas
            GestureDetector(
              onTap: () {
                // Lógica a ser executada quando qualquer parte do GestureDetector é tocada
                print('Alguma parte do GestureDetector foi tocada!');
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Botao(cor: Colors.black, texto: "Todas", rota: ""),
                      SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      Botao(
                        cor: Colors.black,
                        texto: 'Ultimo dia',
                        rota: '',
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Botao(
                        cor: Colors.black,
                        texto: 'Ultima semana',
                        rota: '',
                      ),
                      SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      Botao(cor: Colors.black, texto: "Ultimo mês", rota: '')
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            // Column(
            //   children: [
            //     for (var presencadisplay in presencaformatada)
            //       Column(
            //         children: [
            //           presencadisplay,
            //           const SizedBox(height: TSizes.spaceBtwItems),
            //         ],
            //       ),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  height: 15,
                )
              ],
            ),
          
        ),
      ),
    );
  }
}
