import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:pawang_mobile/routes/app_pages.dart';
import 'package:pawang_mobile/utils/storage.dart';

class SplashController extends GetxController {
  final version = '5.1.0';
  AppUpdateInfo? updateInfo;
  bool flexibleUpdateAvailable = false;

  @override
  void onInit() {
    InAppUpdate.checkForUpdate().then((info) {
      updateInfo = info;
    }).catchError((e) {
      Get.snackbar(
        'Gagal Mengupdate Aplikasi !',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(20),
        icon: const Icon(
          Icons.cancel,
          color: Colors.white,
        ),
      );
    });

    checkUpdate();

    checkToken();
    super.onInit();
  }

  Future<void> checkUpdate() async {
    InAppUpdate.checkForUpdate().then((updateInfo) {
      if (updateInfo.updateAvailability == UpdateAvailability.updateAvailable) {
        InAppUpdate.performImmediateUpdate().then((appUpdateResult) {
          if (appUpdateResult == AppUpdateResult.userDeniedUpdate) {
            SystemNavigator.pop();
          }
        });
      }
    });
  }

  Future<void> checkToken() async {
    await Future.delayed(
      const Duration(seconds: 3),
      () {},
    );
    if (Storage.getValue("is_first_open") == true) {
      Storage.hasData('token')
          ? Get.offAllNamed(RoutesName.navigation)
          : Get.offAllNamed(RoutesName.login);
    } else {
      Get.offAllNamed(RoutesName.onboarding);
    }
  }
}
