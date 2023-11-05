import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/zondicons.dart';

class Minhapergunta extends StatelessWidget {
  final String? Pergunta;
  const Minhapergunta(
      {super.key,
      
      required this.Pergunta,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent, // Cor de fundo transparente
        borderRadius: BorderRadius.circular(10.0), // Raio dos cantos
        border: Border.all(color: Colors.black, width: 1), // Borda opcional
      ),
      padding: EdgeInsets.all(12.0), // Espaçamento interno
      child: Row(
        children: [
          Icon(Icons.add_circle_outline_rounded, size: 24.0),
          SizedBox(width: 6.0), // Espaçamento entre o ícone e o texto
          Text(Pergunta!,
              style: TextStyle(fontSize: 16.0)),
        ],
      ),
    );
  }
}
