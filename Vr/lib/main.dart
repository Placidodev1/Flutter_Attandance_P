import 'package:Registoflutterattandance/pages/Funcionario_captura_de_dados/Pagina_principal.dart';
import 'package:Registoflutterattandance/pages/Funcionario_captura_de_dados/Perguntas_frequentes.dart';
import 'package:Registoflutterattandance/pages/Funcionario_captura_de_dados/Registrar_Dados.dart';
import 'package:Registoflutterattandance/pages/Funcionario_captura_de_dados/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
        elevation: 0.0,
      )),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => PaginaLoginExibida(),
        //Pagina listagem de alunos  registados
        '/pagina_principal': (context) => const PaginaprincipalRegistro(),
        //Pagina de peguntas frequentes
        '/pagina_perguntas_frequentes': (context) =>  PerguntasFrequentes(),
        // Pagina de Registo de Alunos
        '/RegistarAlunos': (context) =>  const RegistarAlunos(),
        
  });
  }
}
