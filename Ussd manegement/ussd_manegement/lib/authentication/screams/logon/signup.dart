import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ussd_manegement/authentication/screams/logon/widgets/sign_up_form.dart';
import 'package:ussd_manegement/common/styles/widgetsextremamente%20reutilizaveis/divider.dart';
import 'package:ussd_manegement/common/styles/widgetsextremamente%20reutilizaveis/social_logos.dart';
import 'package:ussd_manegement/constants/sizes.dart';
import 'package:ussd_manegement/constants/strings.dart';


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
