
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ussd_manegement/authentication/screams/logon/signup.dart';
import 'package:ussd_manegement/authentication/screams/password_configuration.dart/forgot_password.dart';
import 'package:ussd_manegement/constants/sizes.dart';
import 'package:ussd_manegement/constants/strings.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          // Email
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.direct_right, ), labelText:  TStrings.email
            ),
            
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields,),
    
          const TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.password_check, ), labelText:  TStrings.password
            ),
          ),
    
          const SizedBox(height: TSizes.spaceBtwInputFields /2,),
        
        // Remember me and forget password
    
        Row(
          children: [
            Row(
              children:[
              Checkbox(value: true, onChanged: (value){},),
              const Text(TStrings.rememberMe),
          ]),
          TextButton(onPressed: ()=> Get.to(()=> const ForgotPassword()), child: const Text(TStrings.forgetPassword),),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwSections,),
    
        // sign in Button
        SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: const Text(TStrings.signIn)),),
        const SizedBox(height: TSizes.spaceBtwItems,),
        // Create Account Button
        SizedBox(width: double.infinity, child: OutlinedButton(onPressed: ()=> Get.to(()=> const SignUpScream()) , child: const Text(TStrings.createAccount),)),
        const SizedBox(height: TSizes.spaceBtwItems,)
        ],
      ),
    );
  }
}
