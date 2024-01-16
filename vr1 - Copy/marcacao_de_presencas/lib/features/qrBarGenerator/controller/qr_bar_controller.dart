// // ignore_for_file: prefer_typing_uninitialized_variables

// import 'dart:io';
// import 'dart:math';

// import 'package:App_de_registo_de_dados/features/qrBarGenerator/model/alunos_para_pesquisa_model.dart';
// import 'package:flutter/material.dart' as meterial;
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:pdf/widgets.dart';
// import 'package:pretty_qr_code/pretty_qr_code.dart';
// import 'package:screenshot/screenshot.dart';

// class QrBarController extends GetxController {
//   static QrBarController get instance => Get.find();
//   var filtroalunos = meterial.TextEditingController();
//   RxList<AlunosModelGenCartao> originalList = <AlunosModelGenCartao>[].obs;
//   RxList<AlunosModelGenCartao> filteredList = <AlunosModelGenCartao>[].obs;
//   AlunosModelGenCartao? alunoSelecionado;
//   final selectedStudent = ''.obs;
//   Random random = Random();
//   var imageJpg;
//   var imageJpg2;
//   var imageJpg1;
//   Uint8List? fontData;
//   Uint8List? fontData1;
//   Uint8List? fontData2;
//   var semiboltPoppins;
//   var mediumPoppins;
//   var regularPoppins;
//   QrImage? qrCode;
//   final Rx<Barcode> _barcode = Barcode.code128().obs;
//   final RxString _data = '2024366'.obs;
//   final screenshotController = ScreenshotController();
//   Uint8List? imagemqrcode;
//   Uint8List? imagemBarCode;

//   Barcode get barcode => _barcode.value;
//   String get data => _data.value;

//   set data(String newData) {
//     _data.value = newData;
//   }

//   void setBarcodeType(Barcode newBarcode) {
//     _barcode.value = newBarcode;
//   }

//   void setData(String newData) {
//     _data.value = newData;
//   }

//   void qrCodeChanger() {
//     qrCode = QrImage(QrCode(
//       8,
//       QrErrorCorrectLevel.H,
//     )..addData(data));
//   }

//   imagens() async {
//     imageJpg = (await rootBundle.load('assets/imagens/background/backpc.JPG'))
//         .buffer
//         .asUint8List();
//     imageJpg1 = (await rootBundle.load('assets/imagens/alunos/person.jpg'))
//         .buffer
//         .asUint8List();
//     imageJpg2 = (await rootBundle.load('assets/logos/universo.png'))
//         .buffer
//         .asUint8List();
//     fontData = File('assets/fonts/Poppins-SemiBold.ttf').readAsBytesSync();

//     semiboltPoppins = Font.ttf(fontData!.buffer.asByteData());
//     fontData1 = File('assets/fonts/Poppins-Medium.ttf').readAsBytesSync();
//     mediumPoppins = Font.ttf(fontData1!.buffer.asByteData());
//     fontData2 = File('assets/fonts/Poppins-Regular.ttf').readAsBytesSync();
//     regularPoppins = Font.ttf(fontData2!.buffer.asByteData());
//   }

//   filterList(String query) {
//     filteredList.assignAll(
//       originalList
//           .where(
//               (item) => item.nome.toLowerCase().contains(query.toLowerCase()))
//           .toList(),
//     );
//   }

//   filterResUmAluno(String query) {
//     // Ajuste aqui, diretamente atribuindo a instância encontrada
//     alunoSelecionado = originalList
//         .firstWhere((item) => item.nome.toLowerCase().contains(query.toLowerCase()));
//     print(alunoSelecionado!.barcode);
//   }

//   void captureqr() async {
//     imagemqrcode =
//         await screenshotController.captureFromWidget(meterial.Material(
//       child: PrettyQrView(
//         qrImage: qrCode!,
//         decoration: const PrettyQrDecoration(),
//       ),
//     ));
//   }
// }
