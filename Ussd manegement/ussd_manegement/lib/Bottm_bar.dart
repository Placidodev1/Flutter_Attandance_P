import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ussd_manegement/constants/colors.dart';
import 'package:ussd_manegement/utils/helpers/helper_functions.dart';

class NavigatorMenu extends StatelessWidget {
  NavigatorMenu({super.key});

  

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
  final darkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
        bottomNavigationBar: Obx(
          () => NavigationBar(
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            backgroundColor:  darkMode? TColors.black: Colors.white,
            indicatorColor:  darkMode ? TColors.white.withOpacity(0.1) : TColors.black.withOpacity(0.1),
            height: 80,
            elevation: 0,
            destinations: const [
              NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
              NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
              NavigationDestination(
                  icon: Icon(Iconsax.heart), label: "Wishlist"),
              NavigationDestination(icon: Icon(Iconsax.user), label: "Profile"),
            ],
          ),
        ),
        body: Obx(() => controller.screens[controller.selectedIndex.value]));
  }
}

class NavigationController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    Container(
      color: Colors.black,
    ),
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.yellow,
    ),
    Container(
      color: Colors.purple,
    )
  ];
}
