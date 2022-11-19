import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:pawang_mobile/routes/routes.dart';
import 'package:pawang_mobile/services/user_service.dart';
import 'package:pawang_mobile/utils/storage.dart';

class SettingsController extends GetxController {
  // Services
  final userService = Get.put(UserService());

  Future<void> logout() async {
    try {
      Get.snackbar(
        'Sukses'.tr,
        'Berhasil Keluar !'.tr,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(20),
        icon: const Icon(
          Icons.check,
          color: Colors.white,
        ),
      );

      Storage.removeValue("token")
          .then((value) => Get.offAllNamed(RoutesName.login));

      final status = await OneSignal.shared.getDeviceState();
      final String? osUserID = status?.userId;

      var payload = <String, dynamic>{"onesignal_id": osUserID};
      await userService.userLogout(payload);
    } catch (e) {
      print(e);
    }
  }
}
