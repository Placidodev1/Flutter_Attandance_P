import 'package:get/get.dart';
import 'package:marcacao_de_presenca/features/aluno_detalhes/model/responsavel_model.dart';
import 'package:marcacao_de_presenca/features/pagina_principal/model/aluno_model.dart';

class AlunoEstado extends GetxController {
  static AlunoEstado get instance => Get.find();
  RxList<AlunosModel> originalList = <AlunosModel>[].obs;
  AlunosModel? alunoSelecionado;
  ResponsavelModel? responsavel ;
  

  filterResUmAluno(int query) {
    alunoSelecionado = originalList
        .firstWhere((item) => item.nome.contains((query).toString()));
  }
}
