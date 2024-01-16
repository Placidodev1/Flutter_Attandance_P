import 'package:flutter/material.dart';
import 'package:marcacao_de_presenca/constants/image_strings.dart';
import 'package:marcacao_de_presenca/constants/sizes.dart';
import 'package:marcacao_de_presenca/constants/strings.dart';
import 'package:marcacao_de_presenca/utils/helpers/helper_functions.dart';


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
