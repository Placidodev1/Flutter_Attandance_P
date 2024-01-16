import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marcacao_de_presenca/common/widgets/divider.dart';
import 'package:marcacao_de_presenca/common/widgets/social_logos.dart';
import 'package:marcacao_de_presenca/constants/sizes.dart';
import 'package:marcacao_de_presenca/constants/strings.dart';
import 'package:marcacao_de_presenca/features/authentication/screams/logon/widgets/sign_up_form.dart';



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
              const FormSignUp(),
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
