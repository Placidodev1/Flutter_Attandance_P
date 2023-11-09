// import 'package:flutterattandance/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutterattandance/pages/Funcionario_captura_de_dados/login.dart';
import 'package:flutterattandance/pages/Funcionario_captura_de_dados/Pagina_principal.dart';

class Meubotao extends StatelessWidget {
  final num? number;
  final double? largura;
  final double? altura;
  final String? Texto;

  const Meubotao(
      {super.key,
      required this.number,
      required this.altura,
      required this.largura, this.Texto});
  void _navigar(BuildContext context) {
    if (number == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PaginaprincipalRegistro()),
      );
    }
    if (number == 2) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => PaginaprincipalRegistro()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigar(context),
      child: Container(
        width: largura!,
        height: altura!,
        margin:  EdgeInsets.symmetric(horizontal: 115),
        decoration: BoxDecoration(
          color: Color(0xFFFF8FBFF),
          borderRadius: BorderRadius.circular(8),
        ),
        child:  Center(
          child: Text(
            Texto!,
            style: TextStyle(
              color: Color(0xFFF112D4E),
              fontWeight: FontWeight.w900,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }
