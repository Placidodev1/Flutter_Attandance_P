import 'package:flutter/material.dart';
import 'package:flutterattandance/pages/Funcionario_captura_de_dados/Pagina_principal.dart';
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
      home: PaginaprincipalRegistro(),
    );
  }
}
