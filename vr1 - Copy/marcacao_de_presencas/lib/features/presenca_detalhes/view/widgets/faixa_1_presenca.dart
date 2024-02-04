import 'package:flutter/material.dart';
import 'package:marcacao_de_presenca/features/presenca_detalhes/controller/carrega_dados.dart';
import 'package:marcacao_de_presenca/utils/helpers/helper_functions.dart';

class Faixa1Presenca extends StatelessWidget {
  final int idPresenca;
  const Faixa1Presenca({
    super.key, required this.idPresenca,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DetalhesDaPresenca.buscaDados(idPresenca),
      builder: (context, snapshot) {                                                                                                                   
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Erro: ${snapshot.error}');
        } else if (snapshot.data == null) {
          return const Text('Dados do responsável não carregados');
        } else {
          dynamic responsavel = snapshot.data!;
          return _buildCamposDeDados(context, responsavel);
        }
      },
    );
  }

  Widget _buildCamposDeDados(BuildContext context, responsavel) {

    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: THelperFunctions.screenHeight() * 0.035),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Alinhar à esquerda
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
            DetalhesDaPresenca.entradaACarinhaIdaAEscola,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 17,
            ),
          ),
          Text(
            DetalhesDaPresenca.horaEntradaACarinhaIdaAEscola,
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
            DetalhesDaPresenca.descidaACarinhaIdaAEscola,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 17,
            ),
          ),
          Text(
            DetalhesDaPresenca.horaDescidaACarinhaIdaAEscola,
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
