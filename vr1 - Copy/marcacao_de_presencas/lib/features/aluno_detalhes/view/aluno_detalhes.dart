// ignore_for_file: non_constant_identifier_names, use_full_hex_values_for_flutter_colors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:marcacao_de_presenca/common/widgets/app_bar.dart';
import 'package:marcacao_de_presenca/common/widgets/voltar.dart';
import 'package:marcacao_de_presenca/constants/sizes.dart';
import 'package:marcacao_de_presenca/features/aluno_detalhes/view/widgets/alunos_list.dart';
import 'package:marcacao_de_presenca/features/aluno_detalhes/view/widgets/avatar.dart';
import 'package:marcacao_de_presenca/features/pagina_principal/controller/aluno_estado.dart';

import 'package:marcacao_de_presenca/utils/local_storage/sqlite/modals/aluno_model.dart';


// ignore: must_be_immutable
class DetalhesAlunoInfo extends StatefulWidget {
  DetalhesAlunoInfo({super.key, required this.aluno});
  ModelAluno aluno;

  @override
  State<DetalhesAlunoInfo> createState() => _DetalhesAlunoInfoState();
}

class _DetalhesAlunoInfoState extends State<DetalhesAlunoInfo> {
  final AlunoEstado controller = Get.find();
  DateTime currentDate = DateTime.now();


  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd/MM/yyyy').format(currentDate);
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xfffcbd5e0),
        appBar: const CustomAppBar(),
        body: Center(
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Column(
                children: [
                  const SizedBox(height: TSizes.spaceBtwSections),
                  Center(
                    child: Text(
                      'Carinha ${widget.aluno.Id_carrinha} ',
                      style: const TextStyle(
                        color: Color(0xFFF000000),
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  const Divider(
                    thickness: 3,
                    color: Color(0xFFF000000),
                  ),
                  const Avatar(),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  Text(
                    formattedDate.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  // A lista
                  Alunos(widget: widget),
                  
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Voltar(),
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}
