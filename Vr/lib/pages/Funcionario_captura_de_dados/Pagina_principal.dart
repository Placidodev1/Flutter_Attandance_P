// ignore_for_file: non_constant_identifier_names

import 'package:Registoflutterattandance/Urlproject.dart';
import 'package:Registoflutterattandance/pages/componentes/Botoes.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:core';
Uripadrao uri = Uripadrao();
  String uriausar = uri.Uri;
class PaginaprincipalRegistro extends StatefulWidget {
  const PaginaprincipalRegistro({super.key});

  @override
  State<PaginaprincipalRegistro> createState() =>
      _PaginaprincipalRegistroState();
}

class _PaginaprincipalRegistroState extends State<PaginaprincipalRegistro> {
  List<DataRow> rows = [];
  List<dynamic> users = [];

  @override
  void initState() {
    super.initState();
    fetchaAlunos();
  }

  void fetchaAlunos() async {
    // Url de requesicao de alunos
    print('fetchUer');
    final url = '$uriausar/Alunos';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    print(json['data']);
    // faz alteracao de estado para fazer a listagem
    setState(() {
      users = json['data'];
      rows = users.map((user) {
        String nome = user['Nome'] ?? 'Indefinido';
        int? codigo = user['codigo_da_escola']; 
        String Faceid = user['FaceId'] ?? '';
        bool Face = Faceid.isNotEmpty;
        int? Barcode = user['Barcode'];
        bool code = Barcode != null;
        String QRCode = user['QRCode'] ?? '';
        bool QR = QRCode.isNotEmpty;

        

        return DataRow(cells: [
          DataCell(Text(
            nome,
            style: const TextStyle(fontSize: 17),
          )),
          DataCell(Text('$codigo', style: const TextStyle(fontSize: 17))),
          DataCell(
            QR == false
                ? const Icon(
                    Icons.close,
                    color: Colors.red,
                    size: 20,
                  ) // Caso Face seja nulo, não exibe nada (SizedBox vazio)
                : const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 20,
                  ),
          ),
          DataCell(
            code == false
                ? const Icon(
                    Icons.close,
                    color: Colors.red,
                    size: 20,
                  ) // Caso Face seja nulo, não exibe nada (SizedBox vazio)
                : const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 20,
                  ),
          ),
          DataCell(
            Face == false
                ? const Icon(
                    Icons.close,
                    color: Colors.red,
                    size: 20,
                  ) // Caso Face seja nulo, não exibe nada (SizedBox vazio)
                : const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 20,
                  ),
          ),
          const DataCell(Row(
            children: [
              Icon(
                Icons.edit,
                color: Colors.green,
                size: 20,
              ),
              SizedBox(
                width: 15,
              ),
              Icon(
                Icons.remove_red_eye_outlined,
                color: Colors.black,
                size: 20,
              ),
            ],
          ))
        ]);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    
    //Retorna tamanhos da pagina
    var size = MediaQuery.of(context).size;
    double heightmedia = size.height;
    double widthmedia = size.width;
    



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
        padding: EdgeInsets.symmetric(horizontal: widthmedia * 0.08, vertical: heightmedia * 0.046),
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
                        .contain, 
                  ),
                ),
                const Row(
                  children: [
                    MeusBotoes(
                        corprimaria: Colors.white,
                        myText: "Estudantes",
                        segundacor: Colors.black,
                        number: 1),
                    MeusBotoes(
                        corprimaria: Colors.white,
                        myText: "Guia de uso",
                        segundacor: Colors.black,
                        number: 2),
                    MeusBotoes(
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
            Expanded(
                child: Column(
              children: [
                DataTable(
                    headingRowHeight:
                        0.093 * heightmedia, // Defina a altura da linha de cabeçalho
                    columnSpacing: 0.04 * widthmedia,
                    dividerThickness: 4,
                    columns: const [
                      DataColumn(
                        label: Text(
                          'Nome',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ),
                      DataColumn(
                          label: Text(
                        'Codigo',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      )),
                      DataColumn(
                          label: Text(
                        'QrCode',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      )),
                      DataColumn(
                          label: Text(
                        'Barcode',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      )),
                      DataColumn(
                          label: Text(
                        'Faceid',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      )),
                      DataColumn(
                          label: Text(
                        'ações',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      )),
                    ],
                    rows: rows),
              ],
            )),
            const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MeusBotoes(
                      corprimaria: Color(0xFF005909),
                      myText: "Registar",
                      segundacor: Colors.white,
                      number: 5),
                  MeusBotoes(
                      corprimaria: Color(0xfff003459),
                      myText: "Proximo",
                      segundacor: Colors.white,
                      number: 4),
                ])
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
}
