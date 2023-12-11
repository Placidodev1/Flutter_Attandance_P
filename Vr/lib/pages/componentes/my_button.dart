// import 'package:flutterattandance/pages/login.dart';
import 'dart:js';

import 'package:Registoflutterattandance/Services/LoginService.dart';
import 'package:Registoflutterattandance/pages/Funcionario_captura_de_dados/Pagina_principal.dart';
import 'package:flutter/material.dart';

class Meubotao extends StatelessWidget {
  final num? number;
  final double? largura;
  final double? altura;
  final String? Texto;

  const Meubotao(
      {super.key,
      required this.number,
      required this.altura,
      required this.largura,
      this.Texto});

  Future<void> _navigar(BuildContext context) async {
    if (number == 1) {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => PaginaprincipalRegistro()),
      // );

      showDialog(
          context: context,
          builder: (context) {
            return Center(child: CircularProgressIndicator());
          });
      String username = 'gfgfgfgfgfgfgfgfgffgfgfgfg';
      int password = 7977979;
      print("aqui");
      print(password.toString().length);
      try {
        print("adjhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
        // Chama a função de login do HttpService
        // verifiica o numero de bits da password se for 14 e funcionario se for 17 e responsavel da crianca
        if (password.toString().length == 7) {
          print("object");
          print(password);
          print(username);
          
          await HttpService.login(username, password, context);
        } else {
          Navigator.of(context).pop();
          _showErrorDialog(context, "Email ou Senha incorrecta");
        }
      } catch (error) {
        print("Erro durante o login: $error");
      }
    }
    if (number == 2) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => PaginaprincipalRegistro()));
    }
  }

  @override
  Widget build(BuildContext context) {
    print("heyheyobject");
    return GestureDetector(
      onTap: () => _navigar(context),
      child: Container(
        width: largura!,
        height: altura!,
        margin: EdgeInsets.symmetric(horizontal: 115),
        decoration: BoxDecoration(
          color: Color(0xFFFF8FBFF),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
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

  static void _showErrorDialog(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Erro de Login'),
          content: Text(errorMessage),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
