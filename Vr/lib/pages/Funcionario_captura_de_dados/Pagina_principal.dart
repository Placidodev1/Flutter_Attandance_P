import 'package:Registoflutterattandance/pages/componentes/Botoes.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:core';

class PaginaprincipalRegistro extends StatefulWidget {
  const PaginaprincipalRegistro({super.key});

  @override
  State<PaginaprincipalRegistro> createState() =>
      _PaginaprincipalRegistroState();
}

class _PaginaprincipalRegistroState extends State<PaginaprincipalRegistro> {
  List<dynamic> users = [];
  List<DataRow> rows = [];
  @override
  void initState() {
    super.initState();
    fetchaAlunos();
  }

  @override
  Widget build(BuildContext context) {
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
        toolbarHeight: 70,
        backgroundColor: const Color(0xfff003459),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    constraints: const BoxConstraints(
                      maxHeight: 40, // Define a altura máxima
                      maxWidth: 60, // Define a largura máxima
                    ),
                    child: Image.asset(
                      'lib/imagens/logo.webp',
                      fit: BoxFit
                          .contain, // Faz a imagem se ajustar ao tamanho disponível
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
                          60, // Defina a altura da linha de cabeçalho
                      columnSpacing: 55,
                      dividerThickness: 4,
                      columns: const [
                        DataColumn(
                          label: Text(
                            'Nome',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w700),
                          ),
                        ),
                        DataColumn(
                            label: Text(
                          'Codigo',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w700),
                        )),
                        DataColumn(
                            label: Text(
                          'QrCode',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w700),
                        )),
                        DataColumn(
                            label: Text(
                          'Barcode',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w700),
                        )),
                        DataColumn(
                            label: Text(
                          'Faceid',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w700),
                        )),
                        DataColumn(
                            label: Text(
                          'ações',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w700),
                        )),
                      ],
                      rows: rows),
                ],
              )),

              
          const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

              MeusBotoes(corprimaria: Color(0xFF005909), myText: "Registar", segundacor: Colors.white, number: 4),
              MeusBotoes(corprimaria: Color(0xfff003459), myText: "Proximo", segundacor: Colors.white, number: 5),

       ]

        )
        ],
        ),

    ),
     bottomNavigationBar: Container(
    color: Color(0xfff003459), // Cor de fundo do rodapé
    padding: const EdgeInsets.all(10), // Espaçamento interno
    child: const Text(
        'Copyright All rights reserved | Esta pagina foi densevolvida por ACSUN',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: 13,
          letterSpacing: 2,
        ),
        textAlign: TextAlign.center,
        ),
  ),

    )
    );

       
  }

  void fetchaAlunos() async {
    print('fetchUer');
    final url = 'http://192.168.18.65:5000/Alunos';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    print(json['data']);
    setState(() {
      users = json['data'];
      rows = users.map((user) {
        String nome = user['Nome'];
        int codigo = user['codigo_da_escola'];
        String Faceid = user['FaceId'];
        bool Face = Faceid != null ? true : false;
        int Barcode = user['Barcode'];
        bool code = Barcode != null ? true : false;
        String QRCode = user['QRCode'];
        bool QR = Barcode != null ? true : false;
        print(code);
        print(Face);

        return DataRow(cells: [
          DataCell(Text(
            nome,
            style: TextStyle(fontSize: 17),
          )),
          DataCell(Text('$codigo', style: TextStyle(fontSize: 17))),
          DataCell(
            QR == false
                ? const Icon(
                    Icons.close,
                    color: Colors.red,
                    size: 20,
                  ) // Caso Face seja nulo, não exibe nada (SizedBox vazio)
                : Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 20,
                  ),
          ),
          DataCell(
            code == false
                ? Icon(
                    Icons.close,
                    color: Colors.red,
                    size: 20,
                  ) // Caso Face seja nulo, não exibe nada (SizedBox vazio)
                : Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 20,
                  ),
          ),
          DataCell(
            Face == false
                ? Icon(
                    Icons.close,
                    color: Colors.green,
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
}