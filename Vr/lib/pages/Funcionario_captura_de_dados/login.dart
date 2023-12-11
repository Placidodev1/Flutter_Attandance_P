import 'package:Registoflutterattandance/pages/componentes/my_button.dart';
import 'package:Registoflutterattandance/pages/componentes/myt_textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaginaLoginExibida extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtém o tamanho da tela
    double screenWidth = MediaQuery.of(context).size.width;
    
    // Exemplo: se a largura da tela for maior que 600, exibe um layout diferente
    if (screenWidth > 800) {
      return WideScreenLayout();
    } else {
      return NormalScreenLayout();
    }
  }
}

class WideScreenLayout extends StatelessWidget {
  // Dados login

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  //botao navegação
  // void navigateToPage(BuildContext context, Widget page) {
  //   Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  // }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double heightmedia = size.height;
    double widthmedia = size.width;
    print(widthmedia);
    print("altura: $heightmedia");
    return Scaffold(
      backgroundColor: const Color(0xbfbfbf),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: widthmedia * 0.074),
        child: Center(
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(0.014),
                child: Container(
                  color: Colors.grey,
                  constraints: const BoxConstraints(
                    // minWidth: 375,
                    // minHeight: 300,
                    maxHeight: 425, // Define a altura máxima
                    maxWidth: 350, // Define a largura máxima
                  ),
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.start, // Alinhar textos à esquerda
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 70,
                      ),
                      
                      
                      Text(
                          'Login ',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                            // ignore: use_full_hex_values_for_flutter_colors
                            
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                            letterSpacing: 8,
                          )),
                        ),
                      const SizedBox(
                        height: 30,
                      ),
                       Row(
                        children: [
                          const SizedBox(
                            width: 24,
                          ),
                          Text(
                            'Username',
                            style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              fontSize: 17,
                              letterSpacing: 2,
                            )),
                          ),
                          const SizedBox(width: 10), // Espaço horizontal
                        ],
                      ),
                      MeuTexto(
                          controller: passwordController,
                          hintText: const Icon(Icons.account_circle_outlined),
                          obscureText: false),
                      const SizedBox(height: 20),
                       Row(
                        children: [
                          const SizedBox(
                            width: 24,
                          ),
                          Text(
                            'Password',
                            style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              fontSize: 17,
                              letterSpacing: 2,
                              )),
                            ),
                          const SizedBox(width: 10), // Espaço horizontal
                        ],
                      ),
                      // Textfield do Username
                      MeuTexto(
                          controller: usernameController,
                          hintText: const Icon(Icons.account_circle_outlined),
                          obscureText: false),
                      const SizedBox(
                        height: 30,
                      ),
                      const Meubotao(
                        number: 1,
                        altura: 50.0,
                        largura: 120,
                        Texto: "Iniciar sessão",
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  constraints: const BoxConstraints(
                    maxHeight: 300, // Define a altura máxima
                    maxWidth: 400, // Define a largura máxima
                  ),
                  child: Image.asset(
                    'lib/imagens/logo.webp',
                    fit: BoxFit
                        .contain, // Faz a imagem se ajustar ao tamanho disponível
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



class NormalScreenLayout extends StatelessWidget {
  // Dados login

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  //botao navegação
  // void navigateToPage(BuildContext context, Widget page) {
  //   Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  // }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double heightmedia = size.height;
    double widthmedia = size.width;
    print(widthmedia);
    print("altura: $heightmedia");
    return Scaffold(
      backgroundColor: const Color(0xbfbfbf),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: widthmedia * 0.074),
        child: Center(
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(0.014),
                child: Container(
                  color: Colors.grey,
                  constraints: const BoxConstraints(
                    // minWidth: 375,
                    // minHeight: 300,
                    maxHeight: 425, // Define a altura máxima
                    maxWidth: 350, // Define a largura máxima
                  ),
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Alinhar textos à esquerda
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 70,
                      ),
                      
                      
                      Text(
                          'Login ',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                            // ignore: use_full_hex_values_for_flutter_colors
                            
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                            letterSpacing: 8,
                          )),
                        ),
                      const SizedBox(
                        height: 30,
                      ),
                       Row(
                        children: [
                          const SizedBox(
                            width: 24,
                          ),
                          Text(
                            'Username',
                            style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              fontSize: 17,
                              letterSpacing: 2,
                            )),
                          ),
                          const SizedBox(width: 10), // Espaço horizontal
                        ],
                      ),
                      MeuTexto(
                          controller: usernameController,
                          hintText: const Icon(Icons.account_circle_outlined),
                          obscureText: false),
                      const SizedBox(height: 20),
                       Row(
                        children: [
                          const SizedBox(
                            width: 24,
                          ),
                          Text(
                            'Password',
                            style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              fontSize: 17,
                              letterSpacing: 2,
                              )),
                            ),
                          const SizedBox(width: 10), // Espaço horizontal
                        ],
                      ),
                      MeuTexto(
                          controller: usernameController,
                          hintText: const Icon(Icons.lock_clock_outlined),
                          obscureText: false),
                      const SizedBox(
                        height: 30,
                      ),
                      const Meubotao(
                        number: 1,
                        altura: 50.0,
                        largura: 120,
                        Texto: "Iniciar sessão",
                      )
                    ],
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}

