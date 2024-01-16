import 'package:flutter/material.dart';
import 'package:App_de_registo_de_dados/constants/sizes.dart';
import 'package:App_de_registo_de_dados/constants/strings.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        TStrings.appbar,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Colors.white,
            ),
      ),
      automaticallyImplyLeading: false,
      centerTitle: true,
      toolbarHeight: TSizes.appBarHeight,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(TSizes.appBarHeight);
}
