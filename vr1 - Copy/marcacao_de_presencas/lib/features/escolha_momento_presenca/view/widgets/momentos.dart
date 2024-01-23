import 'package:flutter/material.dart';
import 'package:marcacao_de_presenca/common/widgets/cabecalho_da_app.dart';
import 'package:marcacao_de_presenca/common/widgets/sair.dart';
import 'package:marcacao_de_presenca/constants/strings.dart';
import 'package:marcacao_de_presenca/features/escolha_momento_presenca/view/widgets/momento_generator.dart';

class Momentos extends StatelessWidget {
  const Momentos({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CabecalhoDaApp(),
        // 1
        Momento(
          texto: TStrings.casaEscolaDescida, numeroMomento: 1,
        ),
        // 2
        Momento(
          texto: TStrings.casaEscolaDescida, numeroMomento: 2,
        ),
        // 3
        Momento(
          texto: TStrings.escolaCasaSubida, numeroMomento: 3,
        ),
        // 4
        Momento(
          texto: TStrings.escolaCasaDescida, numeroMomento: 4,
        ),
        Sair()
      ],
    );
  }
}
