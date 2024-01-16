// import 'dart:io';
// import 'package:App_de_registo_de_dados/features/qrBarGenerator/controller/qr_bar_controller.dart';
// import 'package:get/get.dart';
// import 'package:open_file/open_file.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart';

// class User {
//   final String name;
//   final int age;

//   const User({required this.name, required this.age});
// }

// class PdfApi {
//   static Future<File> generateImage(
//       ) async {
//     final controller = Get.put(QrBarController());
//     controller.imagens();
//     final pdf = Document();

    
//     final pageTheme = PageTheme(
//       pageFormat: const PdfPageFormat(600, 1050),
//       buildBackground: (context) {
//         if (context.pageNumber == 1) {
//           return FullPage(
//             ignoreMargins: true,
//             child: Image(MemoryImage(controller.imageJpg), fit: BoxFit.cover),
//           );
//         } else {
//           return Container();
//         }
//       },
//     );

//     final pageTheme1 = PageTheme(
//       pageFormat: const PdfPageFormat(600, 1050),
//       buildBackground: (context) {
//         if (context.pageNumber == 3) {
//           return FullPage(
//             ignoreMargins: true,
//             child: Column(children: [
//               Expanded(
//                 flex: 3,
//                 child: Container(
//                   color: PdfColors.white,
//                 ),
//               ),
//               Expanded(
//                   flex: 2,
//                   child: Container(
//                     color: const PdfColor.fromInt(0xFF293894),
//                   ))
//             ]),
//           );
//         } else {
//           return Container();
//         }
//       },
//     );

//     pdf.addPage(
//       MultiPage(
//         pageTheme: pageTheme,
//         build: (context) => [
//           Column(
//             children: [
//               SizedBox(height: 100),
//               Center(
//                 child: Container(
//                   child: Text(
//                     'Colegio Universo',
//                     style: TextStyle(
//                         font: controller.semiboltPoppins,
//                         color: PdfColors.white,
//                         fontSize: 48,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 55),
//               Container(
//                 width: 150,
//                 height: 230,
//                 child: AspectRatio(
//                   aspectRatio: 20 / 23,
//                   child: Container(
//                     child: ClipRRect(
//                       horizontalRadius: 25,
//                       verticalRadius: 25,
//                       child: Image(
//                         MemoryImage(controller.imageJpg1),
//                         width: 200,
//                         height: 230,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 30),
//               Text(
//                 controller.alunoSelecionado!.nome,
//                 style:
//                     TextStyle(color: PdfColors.black, fontSize: 36, font: controller.mediumPoppins),
//               ),
//               SizedBox(height: 5),
//               Text(
//                 'Aluno',
//                 style:
//                     TextStyle(color: PdfColors.grey, fontSize: 24, font: controller.regularPoppins),
//               ),
//               SizedBox(height: 50),
//               Text(
//                 'codigo: ${controller.alunoSelecionado!.codigoDaEscola}',
//                 style: const TextStyle(color: PdfColors.black, fontSize: 18),
//               ),
//               SizedBox(height: 10),
//               Text(
//                 'Contacto: +258873887865',
//                 style: const TextStyle(color: PdfColors.black, fontSize: 18),
//               ),
//               SizedBox(height: 100),
//               Center(
//                 child: ClipRRect(
//                   child: Image(MemoryImage(controller.imagemBarCode!), width: 250, height: 150),
//                 ),
//               ),
//             ],
//           ),
//           Image(MemoryImage(controller.imageJpg)),
//         ],
//       ),
//     );

//     pdf.addPage(
//       MultiPage(
//         pageTheme: pageTheme1,
//         build: (context) => [
//           Column(
//             children: [
//               Center(
//                 child: Container(
//                   child: ClipRRect(
//                     horizontalRadius: 50,
//                     verticalRadius: 50,
//                     child: Image(
//                       MemoryImage(controller.imageJpg2),
//                       width: 300,
//                       height: 300,
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 50.0),
//                 child: Text(
//                   '"Este cartão de identificação é um bem desta escola. Se você encontrar este cartão de identificação em qualquer outro lugar, por favor, ligue para o seguinte contacto."',
//                   style: TextStyle(
//                       color: PdfColors.grey, fontSize: 24, font: controller.regularPoppins),
//                 ),
//               ),
//               SizedBox(height: 250),
//               Center(
//                 child: ClipRRect(
//                   child:
//                       Image(MemoryImage(controller.imagemqrcode!), width: 350, height: 250),
//                 ),
//               ),
//             ],
//           ),
//           Image(MemoryImage(controller.imageJpg)),
//         ],
//       ),
//     );

//     return saveDocument(name: 'my_example.pdf', pdf: pdf);
//   }

//   static Future<File> saveDocument({
//     required String name,
//     required Document pdf,
//   }) async {
//     final bytes = await pdf.save();

//     final dir = await getApplicationDocumentsDirectory();
//     final file = File('${dir.path}/$name');

//     await file.writeAsBytes(bytes);

//     return file;
//   }

//   static Future openFile(File file) async {
//     final url = file.path;

//     await OpenFile.open(url);
//   }
// }
