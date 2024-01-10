import 'package:flutter/material.dart';
import 'package:ussd_manegement/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:ussd_manegement/constants/sizes.dart';
import 'package:ussd_manegement/utils/device/devide_utilities.dart';

class skip extends StatelessWidget {
  const skip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(top: TDeviceUtilities.getAppBarHeight(), right: TSizes.defaultSpace, 
    child: TextButton(onPressed: () => OnBoardingController.instance.skipPage(), child: const Text('Skip'),));
  }
}