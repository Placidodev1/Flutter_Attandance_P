import 'package:flutter/material.dart';
import 'package:marcacao_de_presenca/features/escolha_momento_presenca/controller/verifica_se_pode_marcar.dart';
import 'package:marcacao_de_presenca/utils/helpers/helper_functions.dart';

class Momento extends StatelessWidget {
  final String texto;
  final int numeroMomento;
  const Momento({
    super.key,
    required this.texto,
    required this.numeroMomento,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(120, 0, 0, 0),
            blurRadius: 3,
            spreadRadius: 0.1,
            offset: Offset(0, 3.5),
          ),
        ],
      ),
      child: SizedBox(
        width: THelperFunctions.screenWidth() * 0.95,
        height: THelperFunctions.screenHeight() * 0.1,
        child: ElevatedButton(
            onPressed: () {
              PossibilidadeDeMarcaca.verificaSePodeSeListar(numeroMomento);
            },
            child: Text(
              texto,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}
