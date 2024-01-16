import 'package:App_de_registo_de_dados/common/widgets/divider.dart';
import 'package:App_de_registo_de_dados/common/widgets/social_logos.dart';
import 'package:App_de_registo_de_dados/features/authentication/screams/logon/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:App_de_registo_de_dados/constants/sizes.dart';
import 'package:App_de_registo_de_dados/constants/strings.dart';


class SignUpScream extends StatelessWidget {
  const SignUpScream({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tittle
              Text(
                TStrings.signUpTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              // Form
              FormSignUp(),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              // Divider
              TFormDevider(dividerText: TStrings.orSignInWith.capitalize!),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              // social Buttuns
              const SocilLogos(),
            ],
          ),
        ),
      ),
    );
  }
}
