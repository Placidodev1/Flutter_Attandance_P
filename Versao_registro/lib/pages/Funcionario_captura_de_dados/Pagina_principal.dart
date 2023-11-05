import 'package:flutter/material.dart';
import 'package:flutterattandance/pages/componentes/dropdown.dart';
import 'package:flutterattandance/pages/componentes/Botoes.dart';

import 'package:flutterattandance/pages/componentes/detalhes_da_presenca.dart';
import 'package:flutterattandance/pages/componentes/my_button.dart';
class PaginaprincipalRegistro extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(
        
        title: const Text(
        'Colegio Universo',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 16,
          letterSpacing: 2
        ),
        ),


        automaticallyImplyLeading: false,
        centerTitle: true,
        toolbarHeight: 70,
        backgroundColor: const Color(0xfff003459),
        ),


        body:  Padding(padding: 
        EdgeInsets.symmetric(horizontal: 100, 
        vertical: 30),


        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                

                Container(
                  constraints: BoxConstraints(
                    maxHeight: 40, // Define a altura máxima
                    maxWidth: 60, // Define a largura máxima
                  ),
                  child: Image.asset(
                    'lib/imagens/logo.webp',
                    fit: BoxFit.contain, // Faz a imagem se ajustar ao tamanho disponível
                  ),
                ),

                  Row(
                    children: [
                      MeusBotoes(corprimaria: Colors.white, myText: "Estudantes", segundacor: Colors.black, number: 1),
                      MeusBotoes(corprimaria: Colors.white, myText: "Guia de uso", segundacor: Colors.black, number: 2),
                      MeusBotoes(corprimaria: Color(0xfff003459), myText: "Contacte", segundacor: Colors.white, number: 3)
                    
                    ],
                  ),
  
       ] 
            ),
            SizedBox(height: 35,),
          Expanded(
            child: Column(
              
                  children: [
                    DataTable(
                      headingRowHeight: 60, // Defina a altura da linha de cabeçalho
                      columnSpacing: 55,
                      dividerThickness: 4,
                      

                      

                      columns: [
                        DataColumn(label: Text('Nome',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700
                        ),
                        ), 
                        ),
                        DataColumn(label: Text('Codigo',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700
                        ),
                        )),
                        DataColumn(label: Text('QrCode',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700
                        ),
                        )),
                        DataColumn(label: Text('Barcode', 
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700
                        ),
                        )),
                        DataColumn(label: Text('Faceid',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700
                        ),
                        )),
                        DataColumn(label: Text('ações',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700
                        ),
                        )),
                      ],


                      
                      rows: [
                        DataRow(cells: [
                          DataCell(Text('João',
                          style: TextStyle(
                            fontSize: 17
                            
                          ),
                          )),
                          DataCell(Text('5037934294', 
                            style: TextStyle(
                            fontSize: 17
                          )
                          )),
                          DataCell(Icon(Icons.check_circle,
                          color: Colors.green,
                          size: 20,
                          )),DataCell(Icon(Icons.check_circle,
                          color: Colors.green,
                          size: 20,
                          )),
                          DataCell(Icon(Icons.check_circle,
                          color: Colors.green,
                          size: 20,
                          )),
                          DataCell(Row(
                            children: [
                              Icon(Icons.edit,
                              color: Colors.green,
                              size: 20,
                              ),
                              
                              SizedBox(
                                width: 15,
                              ),
                              Icon(Icons.remove_red_eye_outlined,
                              color: Colors.black,
                              size: 20,
                              ),
                              
                            ],
                          )),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('João',
                          style: TextStyle(
                            fontSize: 17
                            
                          ),
                          )),
                          DataCell(Text('5037934294', 
                            style: TextStyle(
                            fontSize: 17
                          )
                          )),
                          DataCell(Icon(Icons.check_circle,
                          color: Colors.green,
                          size: 20,
                          )),DataCell(Icon(Icons.check_circle,
                          color: Colors.green,
                          size: 20,
                          )),
                          DataCell(Icon(Icons.check_circle,
                          color: Colors.green,
                          size: 20,
                          )),
                          DataCell(Row(
                            children: [
                              Icon(Icons.edit,
                              color: Colors.green,
                              size: 20,
                              ),
                              
                              SizedBox(
                                width: 15,
                              ),
                              Icon(Icons.remove_red_eye_outlined,
                              color: Colors.black,
                              size: 20,
                              ),
                              
                            ],
                          )),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('João',
                          style: TextStyle(
                            fontSize: 17
                            
                          ),
                          )),
                          DataCell(Text('5037934294', 
                            style: TextStyle(
                            fontSize: 17
                          )
                          )),
                          DataCell(Icon(Icons.check_circle,
                          color: Colors.green,
                          size: 20,
                          )),DataCell(Icon(Icons.check_circle,
                          color: Colors.green,
                          size: 20,
                          )),
                          DataCell(Icon(Icons.check_circle,
                          color: Colors.green,
                          size: 20,
                          )),
                          DataCell(Row(
                            children: [
                              Icon(Icons.edit,
                              color: Colors.green,
                              size: 20,
                              ),
                              
                              SizedBox(
                                width: 15,
                              ),
                              Icon(Icons.remove_red_eye_outlined,
                              color: Colors.black,
                              size: 20,
                              ),
                              
                            ],
                          )),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('João',
                          style: TextStyle(
                            fontSize: 17
                            
                          ),
                          )),
                          DataCell(Text('5037934294', 
                            style: TextStyle(
                            fontSize: 17
                          )
                          )),
                          DataCell(Icon(Icons.check_circle,
                          color: Colors.green,
                          size: 20,
                          )),DataCell(Icon(Icons.check_circle,
                          color: Colors.green,
                          size: 20,
                          )),
                          DataCell(Icon(Icons.check_circle,
                          color: Colors.green,
                          size: 20,
                          )),
                          DataCell(Row(
                            children: [
                              Icon(Icons.edit,
                              color: Colors.green,
                              size: 20,
                              ),
                              
                              SizedBox(
                                width: 15,
                              ),
                              Icon(Icons.remove_red_eye_outlined,
                              color: Colors.black,
                              size: 20,
                              ),
                              
                            ],
                          )),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('João',
                          style: TextStyle(
                            fontSize: 17
                            
                          ),
                          )),
                          DataCell(Text('5037934294', 
                            style: TextStyle(
                            fontSize: 17
                          )
                          )),
                          DataCell(Icon(Icons.check_circle,
                          color: Colors.green,
                          size: 20,
                          )),DataCell(Icon(Icons.check_circle,
                          color: Colors.green,
                          size: 20,
                          )),
                          DataCell(Icon(Icons.check_circle,
                          color: Colors.green,
                          size: 20,
                          )),
                          DataCell(Row(
                            children: [
                              Icon(Icons.edit,
                              color: Colors.green,
                              size: 20,
                              ),
                              
                              SizedBox(
                                width: 15,
                              ),
                              Icon(Icons.remove_red_eye_outlined,
                              color: Colors.black,
                              size: 20,
                              ),
                              
                            ],
                          )),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('João',
                          style: TextStyle(
                            fontSize: 17
                            
                          ),
                          )),
                          DataCell(Text('5037934294', 
                            style: TextStyle(
                            fontSize: 17
                          )
                          )),
                          DataCell(Icon(Icons.check_circle,
                          color: Colors.green,
                          size: 20,
                          )),DataCell(Icon(Icons.check_circle,
                          color: Colors.green,
                          size: 20,
                          )),
                          DataCell(Icon(Icons.check_circle,
                          color: Colors.green,
                          size: 20,
                          )),
                          DataCell(Row(
                            children: [
                              Icon(Icons.edit,
                              color: Colors.green,
                              size: 20,
                              ),
                              
                              SizedBox(
                                width: 15,
                              ),
                              Icon(Icons.remove_red_eye_outlined,
                              color: Colors.black,
                              size: 20,
                              ),
                              
                            ],
                          )),
                        ]),
                    
                        ],
                      ),
                      ],
                    ),
          ),
          
          Row(
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
    padding: EdgeInsets.all(10), // Espaçamento interno
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
}