import 'package:Registoflutterattandance/pages/componentes/my_button.dart';
import 'package:Registoflutterattandance/pages/componentes/myt_textfield.dart';
import 'package:flutter/material.dart';


class LoginCapturaDeDados extends StatelessWidget {
  
  // Dados login

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  //botao navegação
  void navigateToPage(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xbfbfbf),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100),
        child: Center(
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  color: Colors.grey,
                  constraints: BoxConstraints(
                    maxHeight: 425, // Define a altura máxima
                    maxWidth: 350, // Define a largura máxima
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start, // Alinhar textos à esquerda
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 80, ),
                      Text(
                        'Login',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          letterSpacing: 5,
                        ),
                      ),
                      SizedBox(height: 30,),
                      Row(
                        children: [
                          SizedBox(width: 24,),
                          Text(
                            'Username',
                            style: TextStyle(
                              fontSize: 17,
                              letterSpacing: 2,
                            ),
                          ),
                          SizedBox(width: 10), // Espaço horizontal
                        ],
                      ),
                      MeuTexto(controller: usernameController, hintText: Icon(Icons.account_circle_outlined), obscureText: false),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          SizedBox(width: 24,),
                          Text(
                            'Password',
                            style: TextStyle(
                              fontSize: 17,
                              letterSpacing: 2,
                            ),
                          ),
                          SizedBox(width: 10), // Espaço horizontal
                        ],
                      ),
                      MeuTexto(controller: usernameController, hintText: Icon(Icons.account_circle_outlined), obscureText: false),
                      SizedBox(height: 30,),
                      Meubotao(number: 2, altura: 50.0, largura: 120, Texto: "Iniciar sessão",)
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: 300, // Define a altura máxima
                    maxWidth: 400, // Define a largura máxima
                  ),
                  child: Image.asset(
                    'lib/imagens/logo.webp',
                    fit: BoxFit.contain, // Faz a imagem se ajustar ao tamanho disponível
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
