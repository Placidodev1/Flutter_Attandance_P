// ignore_for_file: sized_box_for_whitespace

import 'package:App_de_registo_de_dados/constants/sizes.dart';
import 'package:App_de_registo_de_dados/constants/strings.dart';
import 'package:App_de_registo_de_dados/features/qrBarGenerator/controller/qr_bar_controller.dart';
import 'package:App_de_registo_de_dados/features/qrBarGenerator/view/widget/qr__e_barcode.dart';
import 'package:App_de_registo_de_dados/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PesquisaAluno extends StatelessWidget {
  const PesquisaAluno({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(QrBarController());
    return SingleChildScrollView(
      child: Container(
        height: THelperFunctions.screenHeight() - TSizes.appBarHeight - 250,
        child: Column(
          children: [
            // pesquisa
            TextFormField(
              controller: controller.filtroalunos,
              onTap: () {
                controller.selectedStudent.value = '';
              },
              onChanged: (query) => controller.filterList(query),
              decoration: const InputDecoration(
                labelText: TStrings.nomedoaluno,
                prefixIcon: Icon(Icons.search),
              ),
            ),
            Obx(
              () {
                // Retorna Bar e Qr
                if (controller.selectedStudent.value != '') {
                  return const BarcodeEQrCode();
                } else {
                  //Res da pesquisa
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.filteredList.length,
                    itemBuilder: (context, index) {
                      final student = controller.filteredList[index];
                      return InkWell(
                        onTap: () {
                          controller.selectedStudent.value = student.nome;
                          controller.filterResUmAluno(student.nome);
                          controller.data = controller.alunoSelecionado!.barcode.toString();
                        },
                        child: ListTile(
                          title: Text(student.nome),
                        ),
                      );
                    },
                  );
                }
              },
            ),
            Obx(() {
              if (controller.selectedStudent.isEmpty) {
                return Container();
              }

              return Column(
                children: [
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Text('Aluno selecionado: ${controller.selectedStudent}'),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
