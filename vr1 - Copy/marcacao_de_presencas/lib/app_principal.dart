import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marcacao_de_presenca/features/pagina_principal/view/princi_funcionario.dart';
import 'package:marcacao_de_presenca/utils/theme/theme.dart';


class AppPrincipal extends StatelessWidget {
  const AppPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      home: const PaginaPrincipalMarcacao(),
      debugShowCheckedModeBanner: false,
    );
  }
}
