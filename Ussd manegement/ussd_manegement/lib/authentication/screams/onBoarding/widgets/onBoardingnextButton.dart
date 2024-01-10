
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ussd_manegement/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:ussd_manegement/constants/sizes.dart';
import 'package:ussd_manegement/utils/device/devide_utilities.dart';

class OnboardButton extends StatelessWidget {
  const OnboardButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned( 
      right: TSizes.defaultSpace,
      bottom:  TDeviceUtilities.getBottomNavigationBarHeight(),
      
      
      child: ElevatedButton(onPressed: ()=>OnBoardingController.instance.nextPage(),
       style: ElevatedButton.styleFrom(shape: const CircleBorder(), backgroundColor: Colors.black),
       child: const Icon(Iconsax.arrow_right_3))
    );
  }
}



