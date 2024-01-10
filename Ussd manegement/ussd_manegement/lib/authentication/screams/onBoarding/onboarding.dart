import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ussd_manegement/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:ussd_manegement/authentication/screams/onBoarding/widgets/onBoardSmoothdota.dart';
import 'package:ussd_manegement/authentication/screams/onBoarding/widgets/onBoardingnextButton.dart';
import 'package:ussd_manegement/authentication/screams/onBoarding/widgets/onboardingWidgets.dart';
import 'package:ussd_manegement/authentication/screams/onBoarding/widgets/skip.dart';
import 'package:ussd_manegement/constants/image_strings.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          // Scroll horizontal de paginas
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.UpdatePageIndicator,
            children: const [
              OnBoardingPage(
                image: TImages.onBoardingImage1,
                title: 'ahh',
                subTitle: 'ahhahaah',
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage2,
                title: 'ahh',
                subTitle: 'ahhahaah',
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage3,
                title: 'ahh',
                subTitle: 'ahhahaah',
              )
            ],
          ),
          // Botao skip
          const skip(),

          //Tres botoes indicadoes abaixo
          OnboardSmoothdots(),

          //Botao proximo

          OnboardButton()
        ],
      ),
    );
  }
}
