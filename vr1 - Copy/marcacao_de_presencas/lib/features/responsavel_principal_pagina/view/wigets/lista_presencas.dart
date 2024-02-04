import 'package:flutter/material.dart';
import 'package:marcacao_de_presenca/constants/sizes.dart';
import 'package:marcacao_de_presenca/features/pagina_principal/model/aluno_model.dart';
import 'package:marcacao_de_presenca/features/responsavel_principal_pagina/controller/carrega_presencas.dart';
import 'package:marcacao_de_presenca/features/responsavel_principal_pagina/model/presenca_model.dart';
import 'package:marcacao_de_presenca/features/responsavel_principal_pagina/view/wigets/prensenca_simples.dart';

class CamposDeDadosPresenca extends StatelessWidget {
  const CamposDeDadosPresenca({
    super.key,
    required this.aluno,
  });

  final AlunosModel aluno;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PresencaModel>>(
      future: CarregaPresencas.carregarPresencas(1),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Erro: ${snapshot.error}');
        } else if (snapshot.data == null) {
          return const Text('Dados do responsável não carregados');
        } else {
          List<PresencaModel> presenca = snapshot.data!;

          return _buildCamposDeDados(context, presenca);
        }
      },
    );
  }

  Widget _buildCamposDeDados(
      BuildContext context, List<PresencaModel> presenca) {
    return Column(children: [
      for (var presencadisplay in presenca)
        Column(
          children: [
            Presencasimples(data: presencadisplay.data, estado1: presencadisplay.estado1, estado2: presencadisplay.estado2, idpresenca: presencadisplay.idpresenca),
            const SizedBox(height: TSizes.spaceBtwItems),
          ],
        ),
    ]);
  }
}
