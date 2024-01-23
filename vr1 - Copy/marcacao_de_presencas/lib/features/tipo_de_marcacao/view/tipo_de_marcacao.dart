
// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:marcacao_de_presenca/common/widgets/app_bar.dart';
import 'package:marcacao_de_presenca/common/widgets/voltar.dart';
import 'package:marcacao_de_presenca/constants/sizes.dart';
import 'package:marcacao_de_presenca/features/tipo_de_marcacao/view/widgets/tipo.dart';



class TipoDeMarcacao extends StatelessWidget {
  const TipoDeMarcacao({super.key});

  @override
  Widget build(BuildContext context) {

    return const SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xfffcbd5e0),
      appBar: CustomAppBar(),
      body:  Padding(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              children: [
                Center(
                  child: Text("Placido Nhapulo - Carinha 1",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xfff000000),
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                      )),
                ),
                SizedBox(
                  height: TSizes.spaceBtwItems
                ),
                Divider(
                  thickness: 3,
                  color: Color(0xfff000000),
                ),
              ],
            ),
            PresencaTipoDeMarcacao(
              texto: "Bar code",
            ),

            PresencaTipoDeMarcacao(
              texto: "Qr code",
            ),
            PresencaTipoDeMarcacao(
              texto: "Face id",
            ),

            
             Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    Voltar(),
                   
                  ],
                )
          ],
        ),
      ),
    ));
  }
}
