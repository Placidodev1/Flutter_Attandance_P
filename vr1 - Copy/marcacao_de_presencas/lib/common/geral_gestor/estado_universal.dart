import 'package:get/get.dart';

class EstadoUniversal extends GetxController  {
  static EstadoUniversal get instance => Get.find();
  
}

//  class QrBarController extends GetxController {
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
