import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:marcacao_de_presenca/constants/sizes.dart';
import 'package:marcacao_de_presenca/constants/strings.dart';
import 'package:marcacao_de_presenca/features/authentication/screams/login/controller/controller_login.dart';
import 'package:marcacao_de_presenca/features/authentication/screams/login/controller/http_service.dart';
import 'package:marcacao_de_presenca/features/authentication/screams/password_configuration.dart/forgot_password.dart';


class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ControllerLogin());
    return Form(
      key: const Key('loginForm'),
      child: Column(
        children: [
          // Email
          TextFormField(
            controller: controller.controllerusername,
            decoration: const InputDecoration(
                prefixIcon: Icon(
                  Iconsax.direct_right,
                ),
                labelText: TStrings.email),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),
          // Password
          TextField(
            controller: controller.passwordController,
            decoration: const InputDecoration(
                prefixIcon: Icon(
                  Iconsax.password_check,
                ),
                labelText: TStrings.password),
          ),

          const SizedBox(
            height: TSizes.spaceBtwInputFields / 2,
          ),

          // Remember me and forget password

          Row(
            children: [
              Row(children: [
                Checkbox(
                  value: true,
                  onChanged: (value) {},
                ),
                const Text(TStrings.rememberMe),
              ]),
              TextButton(
                onPressed: () => Get.to(() => const ForgotPassword()),
                child: const Text(TStrings.forgetPassword),
              ),
            ],
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),

          // sign in Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                    
                    HttpService.login();
                  
                },
                child: const Text(TStrings.signIn)),
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
        ],
      ),
    );
  }
}
