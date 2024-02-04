import 'package:marcacao_de_presenca/features/aluno_detalhes/model/responsavel_model.dart';
import 'package:marcacao_de_presenca/utils/local_storage/sqlite/cria_base_e_tabelas.dart';
import 'package:marcacao_de_presenca/utils/local_storage/sqlite/modals/aluno_model.dart';
import 'package:marcacao_de_presenca/utils/local_storage/storingInLocalStorage/responsavel_storing_local.dart';
import 'package:marcacao_de_presenca/utils/local_storage/storingInLocalStorage/storing_alunos.dart';

Future<void> iniciaBaseLocal() async {
  List<ModelAluno> dadosAluno = await DatabaseHelper.getAluno();
  
  List<ResponsavelModel> dadosResponsavel =
      await DatabaseHelper.getResponsavel();
  
  final dadosAlunoCarregados = await CarregaAlunosGen.guardaLocalmeteAlunos();
  final dadoaResponsavelCarregados =
      await CarregaResponsaveisGen.guardaLocalmeteResponsaveis();
  
  
  for (var item in dadoaResponsavelCarregados) {
    bool itemJaAdicionado = false;

    for (var responsavel in dadosResponsavel) {
      if (responsavel.idResponsavel == item.idResponsavel) {
        itemJaAdicionado = true;
        break;
      }
    }

    if (!itemJaAdicionado) {
      try {
        await DatabaseHelper.insertResponsavel(item);
      } catch (e) {
        // ignore: avoid_print
        print("Erro ao inserir Responsavel $e");
      }
    }
  }

  for (var item in dadosAlunoCarregados) {
    bool itemJaAdicionado = false;

    for (var aluno in dadosAluno) {
      if (aluno.idAluno == item.idAluno) {
        itemJaAdicionado = true;
        break;
      }
    }

    if (!itemJaAdicionado) {
      try {
        await DatabaseHelper.insertAluno(item);
      } catch (e) {
        // ignore: avoid_print
        print("Erro ao adicionar aluno $e");
      }
    }
  }

}
