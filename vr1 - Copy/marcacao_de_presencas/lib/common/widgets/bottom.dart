
// ignore_for_file: use_full_hex_values_for_flutter_colors


import 'package:flutter/material.dart';
import 'package:marcacao_de_presenca/constants/strings.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xfff003459),
      padding: const EdgeInsets.all(10), 
      child:  Text(
        TStrings.copyWrite,
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: 13,
          // letterSpacing: 2,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
