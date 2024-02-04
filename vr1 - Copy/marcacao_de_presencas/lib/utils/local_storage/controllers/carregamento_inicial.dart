import 'package:marcacao_de_presenca/features/aluno_detalhes/model/responsavel_model.dart';
import 'package:marcacao_de_presenca/features/pagina_principal/model/cerinha_model.dart';
import 'package:marcacao_de_presenca/features/pagina_principal/model/funcionario_model.dart';
import 'package:marcacao_de_presenca/features/pagina_principal/model/presenca_model.dart';
import 'package:marcacao_de_presenca/utils/local_storage/sqlite/cria_base_e_tabelas.dart';
import 'package:marcacao_de_presenca/utils/local_storage/sqlite/modals/aluno_model.dart';
import 'package:marcacao_de_presenca/utils/local_storage/storingInLocalStorage/funcionario_storing_local.dart';
import 'package:marcacao_de_presenca/utils/local_storage/storingInLocalStorage/presenca_storing.dart';
import 'package:marcacao_de_presenca/utils/local_storage/storingInLocalStorage/responsavel_storing_local.dart';
import 'package:marcacao_de_presenca/utils/local_storage/storingInLocalStorage/storing_alunos.dart';
import 'package:marcacao_de_presenca/utils/local_storage/storingInLocalStorage/geting_carinhas.dart';
import 'package:marcacao_de_presenca/utils/logging/logger.dart';

Future<void> iniciaBaseLocal() async {
  // Dados vindo da base
  List<ModelAluno> dadosAluno = await DatabaseHelper.getAluno();
  List<ResponsavelModel> dadosResponsavel =
      await DatabaseHelper.getResponsavel();
  List<FuncionarioModel> dadosFuncionario =
      await DatabaseHelper.getFuncionario();
  List<CarinhaModel> dadosCarinha = await DatabaseHelper.getCarinha();
  List<PresencaModelFunc> dadosPresenca = await DatabaseHelper.getPresenca();
  print(dadosPresenca);

  // Dados da api
  final dadosAlunoCarregados = await CarregaAlunosGen.guardaLocalmeteAlunos();
  final dadoaResponsavelCarregados =
      await CarregaResponsaveisGen.guardaLocalmeteResponsaveis();
  final dadosFuncionarioCarregados =
      await CarregaFuncionariosLocal.guardaLocalmeteFuncionarios();
  final dadosCarinhaCarregados =
      await CarregaCarinhaGen.guardaLocalmeteCarinhas();
  final dadosPresencaCarregados =
      await CarregaPresencasRemotas.buscaPresencas();
  TloggerHelper.debug(dadosPresencaCarregados.toString());

  // Guarda na base
  // Guarda esponsavel
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
  // Guarda Alunos
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

  // Guarda funcionarios
  for (var item in dadosFuncionarioCarregados) {
    bool itemJaAdicionado = false;

    for (var funcionario in dadosFuncionario) {
      if (funcionario.idFuncionario == item.idFuncionario) {
        itemJaAdicionado = true;
        break;
      }
    }

    if (!itemJaAdicionado) {
      try {
        await DatabaseHelper.insertFuncionario(item);
      } catch (e) {
        // ignore: avoid_print
        print("Erro ao adicionar funcionario $e");
      }
    }
  }

  // Guarda carinha
  for (var item in dadosCarinhaCarregados) {
    bool itemJaAdicionado = false;

    for (var carinha in dadosCarinha) {
      if (carinha.idCarinha == item.idCarinha) {
        itemJaAdicionado = true;
        break;
      }
    }

    if (!itemJaAdicionado) {
      try {
        await DatabaseHelper.insertCarinha(item);
      } catch (e) {
        // ignore: avoid_print
        print("Erro ao adicionar funcionario $e");
      }
    }
  }

  // Guarda presenca
  for (var item in dadosPresencaCarregados) {
    bool itemJaAdicionado = false;
    for (var presenca in dadosPresenca) {
      if (presenca.idPresenca == item.idPresenca) {
        itemJaAdicionado = true;
        break;
      }
    }
    if (!itemJaAdicionado) {
      try {
        await DatabaseHelper.insertPresenca(item);
      } catch (e) {
        // ignore: avoid_print
        print("Erro ao adicionar funcionario $e");
      }
    }
  }
}
