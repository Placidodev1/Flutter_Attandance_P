
import 'package:flutter/material.dart';
import 'package:marcacao_de_presenca/features/pagina_principal/controller/load_aluno.dart';
import 'package:marcacao_de_presenca/features/pagina_principal/view/widgets/lista_alunos.dart';
import 'package:marcacao_de_presenca/utils/helpers/helper_functions.dart';
import 'package:marcacao_de_presenca/utils/local_storage/sqlite/cria_base_e_tabelas.dart';

class ListaAlunosBuilder extends StatelessWidget {
  const ListaAlunosBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
    
        height: THelperFunctions.screenHeight() * 0.45,
        child: FutureBuilder(
          future: DatabaseHelper.getAluno(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return PresencaFuncionario(
                    aluno: snapshot.data![index],
                  );
                },
              );
            } else {
              return const Center(child: Text('Erro ao carregar dados'));
            }
          },
        ),
        
      ),
    );
  }
}
