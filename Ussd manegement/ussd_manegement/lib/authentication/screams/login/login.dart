import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ussd_manegement/authentication/screams/login/widgets/login_form.dart';
import 'package:ussd_manegement/authentication/screams/login/widgets/login_header.dart';
import 'package:ussd_manegement/common/styles/spacing_styles.dart';
import 'package:ussd_manegement/common/styles/widgetsextremamente%20reutilizaveis/divider.dart';
import 'package:ussd_manegement/common/styles/widgetsextremamente%20reutilizaveis/social_logos.dart';
import 'package:ussd_manegement/constants/sizes.dart';
import 'package:ussd_manegement/constants/strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              const HeaderLogin(),

              // Form
              const Padding(
                padding: EdgeInsets.symmetric(
                    vertical: TSizes.spaceBtwSections),
                child:  LoginForm(),
              ),
              // Devider
              TFormDevider(dividerText: TStrings.orSignInWith.capitalize!),

              const SizedBox(width: TSizes.spaceBtwSections),
              // Footer

              const SocilLogos(),
            ],
          ),
        ),
      ),
    );
  }
}
