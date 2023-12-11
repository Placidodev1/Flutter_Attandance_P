
import 'dart:math';
import 'dart:io';
import 'dart:typed_data';
import 'package:Registoflutterattandance/Api/GeradorPdf.dart';
import 'package:Registoflutterattandance/Api/api_save.dart';
import 'package:Registoflutterattandance/pages/componentes/ButtonWidget.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
import 'package:Registoflutterattandance/Urlproject.dart';
import 'package:Registoflutterattandance/pages/componentes/BarraDePesquisa.dart';
import 'package:Registoflutterattandance/pages/componentes/Botoes.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:core';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:barcode_widget/barcode_widget.dart';

Uripadrao uri = Uripadrao();
String uriausar = uri.Uri;

class RegistarAlunos extends StatefulWidget {
  const RegistarAlunos({super.key});

  @override
  State<RegistarAlunos> createState() => _RegistarAlunosState();
}

class _RegistarAlunosState extends State<RegistarAlunos> {
  List<DataRow> rows = [];
  List<dynamic> users = [];
  String? QrController;
  late QrImage qrImage;
  // Criar uma instância da classe Random
  Random random = Random();
  TextEditingController _textController = TextEditingController();

  
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
                    maxHeight: widthmedia * 0.39, // Define a altura máxima
                    maxWidth: widthmedia * 0.07, // Define a largura máxima
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
                        Container(child: MyTextInputField(controller: _textController, labelText: 'Clique', sufIcon: Icons.search), height: 35, width: widthmedia*0.12,),
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
            const SizedBox(height: 35,),
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
                const SizedBox(width: 35,),
                BarcodeWidget(
                  barcode: Barcode.code128(),
                  data: '2023 $randomNumber 2024 $randomNumber2',
                  errorBuilder: (context, error) => Center(child: Text(error)),
                )
              ],
            ),
                        const SizedBox(
              height: 35,
            ),
            ButtonWidget(
                  text: 'Simple PDF',
                  onClicked: () async {
                    final pdfFile =
                        await PdfApi.generateCenteredText('Sample Text');

                    PdfApi.openFile(pdfFile);
                  },
        )],
        ),
      ),
      bottomNavigationBar: Container(
        color: const Color(0xfff003459), // Cor de fundo do rodapé
        padding: const EdgeInsets.all(10), // Espaçamento interno
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
}
