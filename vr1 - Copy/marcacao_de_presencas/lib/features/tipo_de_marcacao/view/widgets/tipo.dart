import 'package:flutter/material.dart';


class PresencaTipoDeMarcacao extends StatelessWidget {
  final String? texto;
  const PresencaTipoDeMarcacao(
      {super.key, required this.texto, });



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: ,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: const Color(0xffBACADC),
          borderRadius: BorderRadius.circular(6),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(120, 0, 0, 0),
              blurRadius: 3,
              spreadRadius: 0.1,
              offset: Offset(0, 3.5),
            ),
          ],
        ),
        child: Center(
          child: Text(texto!,
              style: const TextStyle(
                color: Color(0xFF000000),
                fontWeight: FontWeight.w600,
                fontSize: 17,
              )),
        ),
      ),
    );
  }
}
