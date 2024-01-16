import 'package:App_de_registo_de_dados/features/authentication/screams/login/widgets/login_form.dart';
import 'package:App_de_registo_de_dados/features/authentication/screams/login/widgets/login_header.dart';
import 'package:flutter/material.dart';
import 'package:App_de_registo_de_dados/common/styles/spacing_styles.dart';
import 'package:App_de_registo_de_dados/constants/sizes.dart';


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
