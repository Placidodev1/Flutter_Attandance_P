import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ussd_manegement/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:ussd_manegement/constants/colors.dart';
import 'package:ussd_manegement/constants/sizes.dart';
import 'package:ussd_manegement/utils/device/devide_utilities.dart';
import 'package:ussd_manegement/utils/helpers/helper_functions.dart';

class OnboardSmoothdots extends StatelessWidget {
  const OnboardSmoothdots({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = OnBoardingController.instance;
    return Positioned(
        bottom: TDeviceUtilities.getBottomNavigationBarHeight() + 25,
        left: TSizes.defaultSpace,
        child: SmoothPageIndicator(
          controller: controller.pageController,
          onDotClicked: controller.dotNavigationClick,
          count: 3,
          effect: ExpandingDotsEffect(
              activeDotColor: dark ? TColors.light : TColors.dark,
              dotHeight: 6),
        ));
  }
}
