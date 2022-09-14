import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  var pageController = PageController();

  forwardAction() {
    if (isLastPage) {
      // Get.toNamed(RoutesName.splash);
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo('assets/images/girl_boy_landing.png', 'Onboard 1',
        'Bintang Bintang Bintang BintangBintang BintangBintang .'),
    OnboardingInfo('assets/images/girl_boy_landing.png', 'Onboard 2',
        'Bintang Bintang Bintang BintangBintang BintangBintang .'),
    OnboardingInfo('assets/images/girl_boy_landing.png', 'Onboard 3',
        'Bintang Bintang Bintang BintangBintang BintangBintang ')
  ];
}

class OnboardingInfo {
  final imageAsset;
  final title;
  final description;

  OnboardingInfo(this.imageAsset, this.title, this.description);
}
