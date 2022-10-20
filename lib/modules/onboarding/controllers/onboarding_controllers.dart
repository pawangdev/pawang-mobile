import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  var pageController = PageController();

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo('assets/images/OB-Scan.png', 'Scan Struk',
        'Mengatur keuanganmu sekarang menjadi lebih mudah dan menyenangkan! Masuk sekarang, yuk!'),
    OnboardingInfo('assets/images/OB-Dompetku.png', 'DompetKu',
        'Mengatur keuanganmu sekarang menjadi lebih mudah dan menyenangkan! Masuk sekarang, yuk!'),
    OnboardingInfo('assets/images/OB-Transaksi.png', 'Transaksi',
        'Mengatur keuanganmu sekarang menjadi lebih mudah dan menyenangkan! Masuk sekarang, yuk!')
  ];
}

class OnboardingInfo {
  final imageAsset;
  final title;
  final description;

  OnboardingInfo(this.imageAsset, this.title, this.description);
}
