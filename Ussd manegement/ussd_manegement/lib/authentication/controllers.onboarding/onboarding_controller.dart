import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  // Variaveis
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  // Atualiza o index quando a pagina e deslizada
  void UpdatePageIndicator(index) => currentPageIndex.value = index;

  // Salta para uma pagina especifica
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  // Atualiz pagina atual & salta para a proxima pagina
  void nextPage() {
    if(currentPageIndex.value == 2){
      // Get.to(LoginScreen())
    }else{
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  // Atualiz pagina atual & salta para a ultima pagina
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
