// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: use_full_hex_values_for_flutter_colors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/zondicons.dart';
import 'package:marcacao_de_presenca/constants/sizes.dart';
import 'package:marcacao_de_presenca/features/aluno_detalhes/view/aluno_detalhes.dart';

import 'package:marcacao_de_presenca/features/pagina_principal/model/aluno_model.dart';

class PresencaFuncionario extends StatelessWidget {
  final AlunosModel aluno;
  const PresencaFuncionario({
    Key? key,
    required this.aluno,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.to(DetalhesAlunoInfo(aluno: aluno,));
          },
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xfffbacadc),
              borderRadius: BorderRadius.circular(3),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(120, 0, 0, 0),
                  blurRadius: 3,
                  spreadRadius: 0.1,
                  offset: Offset(0, 3.5),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: CircleAvatar(
                      radius: 15.0,
                      backgroundColor: Color(0xfffcbd5e0),
                      child: Iconify(
                        Zondicons.user,
                        size: 15,
                        color: Color(0xfff112d4e),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        aluno.nome,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          letterSpacing: 2,
                        ),
                      ),
                    ],
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                          radius: 15.0,
                          backgroundColor: Color(0xfffcbd5e0),
                          child: Icon(
                            Icons.remove_red_eye_outlined,
                            color: Color(0xfff003459),
                            size: 20,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems)
      ],
    );
  }
}
