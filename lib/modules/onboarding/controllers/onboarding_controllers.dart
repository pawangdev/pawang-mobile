// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  bool get isFirstPage => selectedPageIndex.value == onboardingPages.length - 3;
  var pageController = PageController();

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo(
      'assets/images/OB-Scan.png',
      'Scan Struk'.tr,
      'Permudah pencatatan pengeluaranmu hanya dengan scan struk belanja'.tr,
    ),
    OnboardingInfo(
      'assets/images/OB-Dompetku.png',
      'Dompetku'.tr,
      'Simpan dan pisahkan danamu di wallet Pawang untuk mempermudah transaksimu'
          .tr,
    ),
    OnboardingInfo(
      'assets/images/OB-Transaksi.png',
      'Transaksi'.tr,
      'Yuk mulai catat pengeluaran dan pemasukan kamu di aplikasi Pawang sekarang !'
          .tr,
    )
  ];
}

class OnboardingInfo {
  final imageAsset;
  final title;
  final description;
  OnboardingInfo(this.imageAsset, this.title, this.description);
}
