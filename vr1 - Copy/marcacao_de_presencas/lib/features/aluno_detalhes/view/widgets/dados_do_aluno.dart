import 'package:flutter/material.dart';
import 'package:marcacao_de_presenca/constants/sizes.dart';
import 'package:marcacao_de_presenca/features/aluno_detalhes/controller/load_responsavel.dart';
import 'package:marcacao_de_presenca/features/aluno_detalhes/model/responsavel_model.dart';
import 'package:marcacao_de_presenca/features/pagina_principal/model/aluno_model.dart';

class CamposDeDados extends StatelessWidget {
  const CamposDeDados({
    super.key,
    required this.aluno,
  });

  final AlunosModel aluno;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ResponsavelModel?>(
      future: CarregaResponsavel.fetchDataFromResponsavel(aluno.idAluno),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Erro: ${snapshot.error}');
        } else if (snapshot.data == null) {
          return const Text('Dados do responsável não carregados');
        } else {
          ResponsavelModel responsavel = snapshot.data!;
          return _buildCamposDeDados(context, responsavel);
        }
      },
    );
  }

  Widget _buildCamposDeDados(BuildContext context, ResponsavelModel responsavel) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Casa: ${aluno.endereco}',
          style: const TextStyle(
              color: Colors.black, fontSize: 17, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        Text(
          'Nome do Responsavel: ${responsavel.nome}',
          style: const TextStyle(
              color: Colors.black, fontSize: 17, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        Row(
          children: [
            const Text(
              'Numero do responsavel:',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              aluno.telefoneDoResponsavel.toString(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 17,
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
          ],
        ),
      ],
    );
  }
}
