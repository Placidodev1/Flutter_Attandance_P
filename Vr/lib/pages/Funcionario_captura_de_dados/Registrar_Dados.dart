import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:Registoflutterattandance/Api/api_save.dart';
import 'package:Registoflutterattandance/pages/componentes/ButtonWidget.dart';
import 'package:Registoflutterattandance/Urlproject.dart';
import 'package:Registoflutterattandance/pages/componentes/BarraDePesquisa.dart';
import 'package:Registoflutterattandance/pages/componentes/Botoes.dart';
import 'package:Registoflutterattandance/pages/estados/estados_para_pdf.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'dart:core';
import 'dart:ui' as ui;
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:screenshot/screenshot.dart';

GlobalKey _screenShotKey = GlobalKey();
Uripadrao uri = Uripadrao();
String uriausar = uri.Uri;

class RegistarAlunos extends StatefulWidget {
  const RegistarAlunos({super.key});

  @override
  State<RegistarAlunos> createState() => _RegistarAlunosState();
}

class _RegistarAlunosState extends State<RegistarAlunos> {
  int _counter = 0;
  // Uint8List _imageFile;

  //Create an instance of ScreenshotController

  List<DataRow> rows = [];
  List<dynamic> users = [];
  String? QrController;
  late QrImage qrImage;
  // Criar uma instância da classe Random
  Random random = Random();
  TextEditingController _textController = TextEditingController();
  final MeuController meuController = Get.find();
  @override
  void initState() {
    super.initState();
    // fetchaAlunos();
    // Gerar um número inteiro aleatório entre 0 e 99
    int randomNumber = random.nextInt(10000);
    int randomNumber2 = random.nextInt(10000);
    final qrCode = QrCode(
      8,
      QrErrorCorrectLevel.H,
    )..addData('Barcode $randomNumber2 do aluno $randomNumber');

    qrImage = QrImage(qrCode);
  }

  @override
  Widget build(BuildContext context) {
    // Gerar um número inteiro aleatório entre 0 e 99
    int randomNumber = random.nextInt(10000);
    int randomNumber2 = random.nextInt(10000);

    //Retorna tamanhos da pagina
    var size = MediaQuery.of(context).size;
    double heightmedia = size.height;
    double widthmedia = size.width;
    print(widthmedia);
    print("altura: $heightmedia");

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Colegio Universo',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16,
              letterSpacing: 2),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        toolbarHeight: heightmedia * 0.11,
        backgroundColor: const Color(0xfff003459),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: widthmedia * 0.08, vertical: heightmedia * 0.046),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxHeight: widthmedia * 0.39,
                    maxWidth: widthmedia * 0.07, 
                  ),
                  child: Image.asset(
                    'lib/imagens/logo.webp',
                    fit: BoxFit
                        .contain, // Faz a imagem se ajustar ao tamanho disponível
                  ),
                ),
                Row(
                  children: [
                    const MeusBotoes(
                        corprimaria: Colors.white,
                        myText: "Estudantes",
                        segundacor: Colors.black,
                        number: 1),
                    const MeusBotoes(
                        corprimaria: Colors.white,
                        myText: "Guia de uso",
                        segundacor: Colors.black,
                        number: 2),
                    // Container(child: CustomSearchBar(widthpage: widthmedia * 0.243,), height: 35, width: widthmedia*0.073,),
                    Container(
                      height: 35,
                      width: widthmedia * 0.12,
                      child: MyTextInputField(
                          controller: _textController,
                          labelText: 'Clique',
                          sufIcon: Icons.search),
                    ),
                    // SizedBox(width: 10,),
                    const MeusBotoes(
                        corprimaria: Color(0xfff003459),
                        myText: "Contacte",
                        segundacor: Colors.white,
                        number: 3)
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            const Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Introduza as Informações',
                    style: TextStyle(
                      color: Color(0xfff003459),
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  child: PrettyQrView(
                    qrImage: qrImage,
                    decoration: const PrettyQrDecoration(),
                  ),
                ),
                const SizedBox(
                  width: 35,
                ),
                BarcodeWidget(
                  barcode: Barcode.code128(),
                  data: '2023 $randomNumber 2024 $randomNumber2',
                  errorBuilder: (context, error) => Center(child: Text(error)),
                ),
                ElevatedButton(
                  onPressed: () {
                    
                    capture();
                    captureqr();
                  },
                  child: Row(
                    children: [
                      Icon(Icons.camera),
                      SizedBox(
                          width:
                              8),
                      Text('Capture Screenshot'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            ButtonWidget(
              text: 'Simple PDF',
              onClicked: () async {
                final pdfFile =
                    await PdfApi.generateImage(meuController.pngBytes, meuController.pngBytesqr);

                PdfApi.openFile(pdfFile);
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: const Color(0xfff003459),
        padding: const EdgeInsets.all(10),
        child: const Text(
          'Copyright All rights reserved | Esta pagina foi densevolvida por Placido Nhapulo',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 13,
            letterSpacing: 2,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ));
  }

  void capture() async {
    final screenshotController = ScreenshotController();

    meuController.pngBytes =
        await screenshotController.captureFromWidget(Material(
      child: BarcodeWidget(
        height: 150,
        width: 250,
        barcode: Barcode.code128(),
        data: '2023  2024131313131313131314243434343 ',
        errorBuilder: (context, error) => Center(child: Text(error)),
      ),
    ));
    await _showMyDialog(meuController.pngBytes!);
  }

  void captureqr() async {
    final screenshotController = ScreenshotController();

    meuController.pngBytesqr =
        await screenshotController.captureFromWidget(Material(
      child: PrettyQrView(
        
        qrImage: qrImage,
        decoration: const PrettyQrDecoration(),
      ),
    ));
    await _showMyDialog(meuController.pngBytesqr!);
  }

  Future<void> _showMyDialog(Uint8List pngBytes) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Mbuti'),
          content: SingleChildScrollView(
            child: Image.memory(pngBytes),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pop(); // Corrigido: envolvido em uma função anônima
              },
              child: const Text('Mbuti'),
            ),
          ],
        );
      },
    );
  }
}
