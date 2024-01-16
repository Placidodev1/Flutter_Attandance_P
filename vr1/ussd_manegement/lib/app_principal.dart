import 'package:App_de_registo_de_dados/features/authentication/screams/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:App_de_registo_de_dados/utils/theme/theme.dart';

class AppPrincipal extends StatelessWidget {
  const AppPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
