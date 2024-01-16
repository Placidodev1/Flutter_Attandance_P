
import 'package:App_de_registo_de_dados/features/authentication/screams/logon/verify_email.dart';
import 'package:App_de_registo_de_dados/features/novo_funcionario_carinha/controlller/novo_funcionario.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:App_de_registo_de_dados/constants/sizes.dart';
import 'package:App_de_registo_de_dados/constants/strings.dart';


class FormNovoFuncionario extends StatelessWidget {
  const FormNovoFuncionario({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ControllerNovoFuncionario());
    return Form(
        child: Column(
      children: [
        DropdownButtonFormField(
          isExpanded: true,
          // value: TStrings.valorselecionado,
          items: TStrings.listaCarinhas
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  ))
              .toList(),
          onChanged: (val) {
            controller.onValSelecionado(val as String);
          },),
          const SizedBox(
          height: TSizes.spaceBtwInputFields,
        ),
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
