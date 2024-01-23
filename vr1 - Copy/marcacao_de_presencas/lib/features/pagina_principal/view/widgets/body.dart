
// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:marcacao_de_presenca/common/widgets/voltar.dart';
import 'package:marcacao_de_presenca/constants/sizes.dart';
import 'package:marcacao_de_presenca/features/pagina_principal/view/widgets/alunos_lista_builder.dart';
import 'package:marcacao_de_presenca/features/pagina_principal/view/widgets/marcar_e_registar.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: TSizes.spaceBtwSections,
          ),
    
          Center(
            child: Text(
              'Carinha ',
              style: TextStyle(
                color: Color(0xfff000000),
                fontWeight: FontWeight.w600,
                fontSize: 17,
              ),
            ),
          ),
    
          SizedBox(
            height: TSizes.spaceBtwSections,
          ),
    
          //Traco
          Divider(
            thickness: 3,
            color: Color(0xfff000000),
          ),
    
          SizedBox(
            height: TSizes.spaceBtwSections
          ),
    
          BotoesDeCimaMarcarEFinalizar(),
    
          SizedBox(height: TSizes.spaceBtwSections),
          // Cria lista alunos
          ListaAlunosBuilder(),
    
    
          SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          Divider(
            thickness: 3,
            color: Color(0xfff000000),
          ),
    
          SizedBox(
            height: 15,
          ),
          Voltar()
        ],
      ),
    );
  }
}
