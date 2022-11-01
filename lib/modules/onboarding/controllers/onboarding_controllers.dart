import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  bool get isFirstPage => selectedPageIndex.value == onboardingPages.length - 3;
  var pageController = PageController();

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo('assets/images/OB-Scan.png', 'Scan Struk',
        'Permudah pencatatan pengeluaranmu hanya dengan scan struk belanja'),
    OnboardingInfo('assets/images/OB-Dompetku.png', 'Dompetku',
        'Simpan dan pisahkan danamu di wallet Pawang untuk mempermudah transaksimu'),
    OnboardingInfo('assets/images/OB-Transaksi.png', 'Transaksi',
        'Yuk mulai catat pengeluaran dan pemasukan kamu di aplikasi Pawang sekarang !')
  ];
}

class OnboardingInfo {
  final imageAsset;
  final title;
  final description;
  OnboardingInfo(this.imageAsset, this.title, this.description);
}
