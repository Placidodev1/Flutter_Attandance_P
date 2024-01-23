
import 'package:flutter/material.dart';
import 'package:marcacao_de_presenca/features/aluno_detalhes/view/aluno_detalhes.dart';
import 'package:marcacao_de_presenca/features/aluno_detalhes/view/widgets/dados_do_aluno.dart';

class Alunos extends StatelessWidget {
  const Alunos({
    super.key,
    required this.widget,
  });

  final DetalhesAlunoInfo widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: CamposDeDados(aluno: widget.aluno),
          ),
        ],
      ),
    );
  }
}
