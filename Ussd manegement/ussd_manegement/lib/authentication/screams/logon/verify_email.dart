import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ussd_manegement/authentication/screams/logon/signup.dart';
import 'package:ussd_manegement/authentication/screams/login/login.dart';
import 'package:ussd_manegement/common/styles/widgets/success_screen.dart';
import 'package:ussd_manegement/constants/image_strings.dart';
import 'package:ussd_manegement/constants/sizes.dart';
import 'package:ussd_manegement/constants/strings.dart';
import 'package:ussd_manegement/utils/helpers/helper_functions.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:false ,
        actions: [
          
          IconButton(onPressed:()=> Get.offAll(()=> const SignUpScream()), icon: const Icon(CupertinoIcons.clear), )
        ],
      ),
      body:  SingleChildScrollView(
        // Padding after defaut equal space on all sides in all screams
        child: Padding(padding: 
        const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            // Image
            Image(image: const AssetImage(TImages.animation1), width: THelperFunctions.screenWidth(),),

            const SizedBox(height: TSizes.spaceBtwItems,),
            // Tittle
            Text(TStrings.confirmEmail, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
            const SizedBox(height: TSizes.spaceBtwItems,),
            Text("placidonhapulo@gmail.com", style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
            const SizedBox(height: TSizes.spaceBtwItems,),
            Text(TStrings.confirmEmailSubtitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
            const SizedBox(height: TSizes.spaceBtwItems,),
            // Buttons
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: ()=> Get.to(()=> SuccessScreen(image: TImages.animation2, title: TStrings.yourAccountCreatedTitle, subTitle: TStrings.changeYourPasswordSubTitle, onPressed: ()=> Get.to(() => const LoginScreen()),)), child: const Text(TStrings.tContinue)),),
            const SizedBox(height: TSizes.spaceBtwItems,),
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: const Text(TStrings.resendEmail)),)
            
          ],
        ),
        ),
      ),
    );
  }
}