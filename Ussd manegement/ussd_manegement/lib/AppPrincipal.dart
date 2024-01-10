import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ussd_manegement/Bottm_bar.dart';
import 'package:ussd_manegement/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:ussd_manegement/authentication/screams/logon/signup.dart';
import 'package:ussd_manegement/authentication/screams/login/login.dart';
import 'package:ussd_manegement/authentication/screams/onBoarding/onboarding.dart';
import 'package:ussd_manegement/utils/theme/theme.dart';

class AppPrincipal extends StatelessWidget {
  const AppPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp  (
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      home:  SignUpScream(),
      debugShowCheckedModeBanner: false,
    );
  }
}