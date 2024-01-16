import 'package:App_de_registo_de_dados/constants/image_strings.dart';
import 'package:App_de_registo_de_dados/constants/sizes.dart';
import 'package:App_de_registo_de_dados/constants/strings.dart';
import 'package:App_de_registo_de_dados/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: ()=> Get.back(), icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image
              Image(image: const AssetImage(TImages.animation3), width:  THelperFunctions.screenWidth() *  0.6,),
          
              SizedBox(width: TSizes.spaceBtwSections),
          
              //Text field
              Text(
                TStrings.changeYourPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(
                TStrings.changeYourPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
          
              // Button
              SizedBox(width: double.infinity, child: ElevatedButton( onPressed: () {}, child: const Text("Feito"))),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              SizedBox(width: double.infinity, child: ElevatedButton( onPressed: () {}, child: const Text(TStrings.resendEmail)))
          
            ],
          ),
        ),
      ),
    );
  }
}
