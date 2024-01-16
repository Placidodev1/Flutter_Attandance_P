


import 'package:flutter/material.dart';
import 'package:marcacao_de_presenca/common/styles/spacing_styles.dart';
import 'package:marcacao_de_presenca/constants/sizes.dart';
import 'package:marcacao_de_presenca/features/authentication/screams/login/widgets/login_form.dart';
import 'package:marcacao_de_presenca/features/authentication/screams/login/widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key});

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              HeaderLogin(),

              // Form
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: TSizes.spaceBtwSections),
                child:  LoginForm(),
              ),
              

            
              
            ],
          ),
        ),
      ),
    );
  }
}
