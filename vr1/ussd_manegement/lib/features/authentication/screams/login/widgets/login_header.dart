import 'package:App_de_registo_de_dados/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:App_de_registo_de_dados/constants/image_strings.dart';
import 'package:App_de_registo_de_dados/constants/sizes.dart';
import 'package:App_de_registo_de_dados/constants/strings.dart';


class HeaderLogin extends StatelessWidget {
  const HeaderLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image(
          height: 150,
          image: AssetImage(dark ? TImages.logoDark : TImages.logoNormal),
        ),
        Text(
          TStrings.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: TSizes.sm),
        Text(
          TStrings.loginSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
