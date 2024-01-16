
import 'package:flutter/material.dart';
import 'package:marcacao_de_presenca/common/widgets/cabecalho_da_app.dart';
import 'package:marcacao_de_presenca/common/widgets/sair.dart';
import 'package:marcacao_de_presenca/constants/strings.dart';
import 'package:marcacao_de_presenca/utils/helpers/helper_functions.dart';

class Momentos extends StatelessWidget {
  const Momentos({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const CabecalhoDaApp(),
        // 1
        Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(120, 0, 0, 0),
                blurRadius: 3,
                spreadRadius: 0.1,
                offset: Offset(0, 3.5),
              ),
            ],
          ),
          child: SizedBox(
          width: THelperFunctions.screenWidth() * 0.95,
          height: THelperFunctions.screenHeight() * 0.1,
          child: ElevatedButton(
              onPressed: () {
                  
                
                
              },
              child: const Text(TStrings.casaEscolaSubida,
              style: TextStyle(color: Colors.black,
              fontWeight: FontWeight.bold),)),),
        ),
        // 2
        Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(120, 0, 0, 0),
                blurRadius: 3,
                spreadRadius: 0.1,
                offset: Offset(0, 3.5),
              ),
            ],
          ),
          child: SizedBox(
          width: THelperFunctions.screenWidth() * 0.95,
          height: THelperFunctions.screenHeight() * 0.1,
          child: ElevatedButton(
              onPressed: () {
                  
                
                
              },
              child: const Text(TStrings.casaEscolaDescida,
              style: TextStyle(color: Colors.black,
              fontWeight: FontWeight.bold),),),
                    ),
        ),
      // 3
      Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(120, 0, 0, 0),
              blurRadius: 3,
              spreadRadius: 0.1,
              offset: Offset(0, 3.5),
            ),
          ],
        ),
        child: SizedBox(
          width: THelperFunctions.screenWidth() * 0.95,
          height: THelperFunctions.screenHeight() * 0.1,
          child: ElevatedButton(
              onPressed: () {
                  
                
                
              },
              child: const Text(TStrings.escolaCasaSubida,
              style: TextStyle(color: Colors.black,
              fontWeight: FontWeight.bold),)),
        ),
      ),
      // 4
        Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(120, 0, 0, 0),
                  blurRadius: 3,
                  spreadRadius: 0.1,
                  offset: Offset(0, 3.5),
                ),
              ],
            ),
          child: SizedBox(
          width: THelperFunctions.screenWidth() * 0.95,
          height: THelperFunctions.screenHeight() * 0.1,
          child: ElevatedButton(
            style: const ButtonStyle(
                  
                  ),
              onPressed: () {
                  
                
                
              },
              child: const Text(TStrings.escolaCasaDescida,
              style: TextStyle(color: Colors.black,
              fontWeight: FontWeight.bold),)),
                    ),
        ),
        const Sair()
      ],
    );
  }
}
