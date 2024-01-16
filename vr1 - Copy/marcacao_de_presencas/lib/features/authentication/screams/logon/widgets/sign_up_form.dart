import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:marcacao_de_presenca/constants/colors.dart';
import 'package:marcacao_de_presenca/constants/sizes.dart';
import 'package:marcacao_de_presenca/constants/strings.dart';
import 'package:marcacao_de_presenca/features/authentication/screams/logon/verify_email.dart';
import 'package:marcacao_de_presenca/utils/helpers/helper_functions.dart';


class FormSignUp extends StatelessWidget {
  const FormSignUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Form(
        child: Column(
      children: [
        Row(
          children: [
            // Nome
            Expanded(
              child: TextFormField(
                expands: false,
                decoration: const InputDecoration(
                    labelText: TStrings.firstName,
                    prefixIcon: Icon(Iconsax.user)),
              ),
            ),
            const SizedBox(
              width: TSizes.spaceBtwInputFields,
            ),
            // Sobrenome
            Expanded(
              child: TextFormField(
                expands: false,
                decoration: const InputDecoration(
                    labelText: TStrings.lastName,
                    prefixIcon: Icon(Iconsax.user)),
              ),
            )
          ],
        ),

        const SizedBox(
          height: TSizes.spaceBtwInputFields,
        ),
        // Nome de usuario
        TextFormField(
          decoration: const InputDecoration(
              labelText: TStrings.username,
              prefixIcon: Icon(Iconsax.user_edit)),
        ),

        const SizedBox(
          height: TSizes.spaceBtwInputFields,
        ),
        // Email
        TextFormField(
          decoration: const InputDecoration(
              labelText: TStrings.email, prefixIcon: Icon(Iconsax.direct)),
        ),

        const SizedBox(
          height: TSizes.spaceBtwInputFields,
        ),

        // phone number
        TextFormField(
          decoration: const InputDecoration(
              labelText: TStrings.phoneNumber, prefixIcon: Icon(Iconsax.call)),
        ),

        const SizedBox(
          height: TSizes.spaceBtwInputFields,
        ),

        // Password
        TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
              labelText: TStrings.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffix: Icon(Iconsax.eye_slash)),
        ),
        const SizedBox(
          height: TSizes.spaceBtwInputFields,
        ),
        // Termos e condicoes checkbox
        Row(
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: Checkbox(
                value: true,
                onChanged: (value) {},
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Text.rich(TextSpan(children: [
              TextSpan(children: [
                TextSpan(
                    text: '${TStrings.agreeTo} ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: '${TStrings.privacyPolicy} ',
                    style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark ? TColors.white : TColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor:
                            dark ? TColors.white : TColors.primary)),
                TextSpan(
                    text: 'qualquer ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: TStrings.termsOfUse,
                    style: Theme.of(context).textTheme.bodyMedium!.apply(
                          color: dark ? TColors.white : TColors.primary,
                          decoration: TextDecoration.underline,
                          decorationColor:
                              dark ? TColors.white : TColors.primary,
                        ))
              ])
            ])),
          ],
        ),
        // Sign up Buttom
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => Get.to(() => const VerifyEmailScreen()),
            child: const Text(TStrings.createAccount),
          ),
        ),
      ],
    ));
  }
}
