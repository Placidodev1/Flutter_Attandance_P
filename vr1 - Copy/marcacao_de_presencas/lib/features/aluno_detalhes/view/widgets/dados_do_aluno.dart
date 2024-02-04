import 'package:flutter/material.dart';
import 'package:marcacao_de_presenca/constants/sizes.dart';
import 'package:marcacao_de_presenca/features/aluno_detalhes/controller/load_responsavel.dart';
import 'package:marcacao_de_presenca/features/aluno_detalhes/model/responsavel_model.dart';
import 'package:marcacao_de_presenca/utils/local_storage/sqlite/modals/aluno_model.dart';

class CamposDeDados extends StatelessWidget {
  const CamposDeDados({
    super.key,
    required this.aluno,
  });

  final ModelAluno aluno;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ResponsavelModel?>(
      future: CarregaResponsavel.fetchDataFromResponsavel(aluno.idAluno!),
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

    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Casa: ${aluno.Endereco}',
            style: const TextStyle(
                color: Colors.black, fontSize: 17, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          Text(
            'Nome do Responsavel: ${responsavel.nome}',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
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
                aluno.Telefone_do_responsavel.toString(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
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
      ),
    );
  }
}
