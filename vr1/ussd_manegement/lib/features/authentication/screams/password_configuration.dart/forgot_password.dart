import 'package:App_de_registo_de_dados/constants/sizes.dart';
import 'package:App_de_registo_de_dados/constants/strings.dart';
import 'package:App_de_registo_de_dados/features/authentication/screams/password_configuration.dart/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Headings
            Text(
              TStrings.forgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Text(
              TStrings.forgetPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections * 2,
            ),

            //Text field

            const TextField(
              decoration: InputDecoration(
                  labelText: TStrings.email,
                  prefixIcon: Icon(Iconsax.direct_right)),
            ),

            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            SizedBox(width: double.infinity, child: ElevatedButton( onPressed: ()=> Get.to(()=>ResetPassword()), child: const Text(TStrings.subait)))
            // Submit Button
          ],
        ),
      ),
    );
  }
}
