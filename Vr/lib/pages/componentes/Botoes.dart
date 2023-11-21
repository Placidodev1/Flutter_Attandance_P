import 'package:Registoflutterattandance/pages/Funcionario_captura_de_dados/Pagina_principal.dart';
import 'package:Registoflutterattandance/pages/Funcionario_captura_de_dados/Perguntas_frequentes.dart';
import 'package:flutter/material.dart';


class MeusBotoes extends StatelessWidget {
  final Color? corprimaria;
  final String? myText;
  final Color? segundacor;
  final num? number;

  const MeusBotoes(
      {super.key,
      required this.corprimaria,
      required this.myText,
      required this.segundacor,
      required this.number});
  void _navigate(BuildContext context) {
    switch (number) {
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PaginaprincipalRegistro()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PerguntasFrequentes()),
        );
        break;
      case 3:
        // Proximo
        break;
      case 4:
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => RegistarAlunos()),
        // );
        break;

      case 5:
        // Marcadas
        break;

      case 6:
        // Pendentes
        break;
      case 7:
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => MainPage()),
        // );
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigate(context),
      child: Container(
        height: 35,
        width: 123,
        decoration: BoxDecoration(
          color: corprimaria,
          borderRadius: BorderRadius.circular(6),
          boxShadow: const [
            // BoxShadow(
            //   color: Colors.black,
            //   spreadRadius: 0.05,
            //   blurRadius: 3.5,
            //   offset: Offset(0, 2)
            // )
          ]
        ),
        child: Center(
          child: Text(
            myText!,
            style: TextStyle(
              color: segundacor,
              fontWeight: FontWeight.w600,
              fontSize: 15
            ),
          ),
        ),
        
      ),
    );
  }
}
