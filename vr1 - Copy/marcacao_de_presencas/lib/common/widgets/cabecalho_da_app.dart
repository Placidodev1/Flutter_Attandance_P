
// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:marcacao_de_presenca/constants/sizes.dart';

class CabecalhoDaApp extends StatelessWidget {
  const CabecalhoDaApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Center(
          child: Text("Carinha por definir",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFF000000),
                fontWeight: FontWeight.w600,
                fontSize: 17,
              )),
        ),
        SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Divider(
          thickness: 3,
          color: Color(0xFFF000000),
        ),
      ],
    );
  }
}
