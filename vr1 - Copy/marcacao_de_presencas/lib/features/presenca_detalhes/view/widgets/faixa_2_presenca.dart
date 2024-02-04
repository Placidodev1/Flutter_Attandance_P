import 'package:flutter/material.dart';
import 'package:marcacao_de_presenca/features/presenca_detalhes/controller/carrega_dados.dart';
import 'package:marcacao_de_presenca/utils/helpers/helper_functions.dart';

class Faixa2Presenca extends StatelessWidget {
  const Faixa2Presenca({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(const Duration(seconds: 3)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {

            return const Faixa2();
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}

class Faixa2 extends StatelessWidget {
  const Faixa2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: THelperFunctions.screenHeight() * 0.030),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Entrada',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 17,
            ),
          ),
          SizedBox(height: THelperFunctions.screenHeight() * 0.020),
          Text(
            DetalhesDaPresenca.entradaACarinhaIdaACasa,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 17,
            ),
          ),
          Text(
            DetalhesDaPresenca.horaEntradaACarinhaIdaACasa,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 17,
            ),
          ),
          SizedBox(height: THelperFunctions.screenHeight() * 0.020),
          const Text(
            'Saida',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 17,
            ),
          ),
          SizedBox(height: THelperFunctions.screenHeight() * 0.020),
          Text(
            DetalhesDaPresenca.descidaACarinhaIdaACasa,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 17,
            ),
          ),
          Text(
            DetalhesDaPresenca.horaDescidaACarinhaIdaACasa,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}
