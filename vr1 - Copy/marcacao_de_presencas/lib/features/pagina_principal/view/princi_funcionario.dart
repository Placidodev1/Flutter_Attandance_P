// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:core';
import 'package:marcacao_de_presenca/common/widgets/appBar.dart';
import 'package:marcacao_de_presenca/constants/sizes.dart';
import 'package:marcacao_de_presenca/constants/strings.dart';
import 'package:marcacao_de_presenca/features/pagina_principal/controller/aluno_estado.dart';
import 'package:marcacao_de_presenca/features/pagina_principal/controller/load_aluno.dart';
import 'package:marcacao_de_presenca/features/pagina_principal/view/widgets/lista_alunos.dart';

class PaginaPrincipalMarcacao extends StatefulWidget {
  const PaginaPrincipalMarcacao({super.key});

  @override
  State<PaginaPrincipalMarcacao> createState() =>
      _PaginaPrincipalMarcacaoState();
}

class _PaginaPrincipalMarcacaoState extends State<PaginaPrincipalMarcacao> {
    @override
  void initState() {
    super.initState();
    CarregaAlunos.carregarDadosDoAluno();
  }
    

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AlunoEstado());
    return Scaffold(
      backgroundColor: const Color(0xfffcbd5e0),
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              
              const Center(
                child: Text(
                  'Carinha ',
                  style: TextStyle(
                    color: Color(0xfff000000),
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              //Traco
              const Divider(
                thickness: 3,
                color: Color(0xfff000000),
              ),

              const SizedBox(
                height: 20,
              ),

             
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(60, 0, 0, 0),
                            spreadRadius: 0.05,
                            blurRadius: 3.5,
                            offset: Offset(0, 2)),
                      ],
                    ),
                    child: SizedBox(
                      width: TSizes.buttonwidth,
                      height: TSizes.buttonHeight,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color(0xfff003459)),
                          ),
                          onPressed: () {},
                          child: const Text(TStrings.marcar)),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(60, 0, 0, 0),
                            spreadRadius: 0.05,
                            blurRadius: 3.5,
                            offset: Offset(0, 2)),
                      ],
                    ),
                    child: SizedBox(
                      width: TSizes.buttonwidth,
                      height: TSizes.buttonHeight,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.red),
                          ),
                          onPressed: () {},
                          child: const Text(TStrings.finalizar)),
                    ),
                  ),
                ],
              ),
            
              const SizedBox(height: TSizes.spaceBtwSections),
              // presenca
              const PresencaFuncionario(),

              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              const Divider(
                thickness: 3,
                color: Color(0xfff000000),
              ),

              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(60, 0, 0, 0),
                            spreadRadius: 0.05,
                            blurRadius: 3.5,
                            offset: Offset(0, 2)),
                      ],
                    ),
                    child: SizedBox(
                      width: TSizes.buttonwidth,
                      height: TSizes.buttonHeight,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.black),
                          ),
                          onPressed: () {},
                          child: const Text(TStrings.voltar)),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
