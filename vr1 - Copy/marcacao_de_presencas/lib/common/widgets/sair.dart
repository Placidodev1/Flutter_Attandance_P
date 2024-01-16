
import 'package:flutter/material.dart';
import 'package:marcacao_de_presenca/constants/sizes.dart';
import 'package:marcacao_de_presenca/constants/strings.dart';

class Sair extends StatelessWidget {
  const Sair({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: TSizes.buttonwidth,
          height: TSizes.buttonHeight,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor:  MaterialStateProperty.all<Color>(Colors.black),
            ),
          onPressed: () {
              
            
            
          },
          child: const Text(TStrings.sair)),
              ),
        const SizedBox(
          height: TSizes.spaceBtwItems
        ),
      ],
    );
  }
}
