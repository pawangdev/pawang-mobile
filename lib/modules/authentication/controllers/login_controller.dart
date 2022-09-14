import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:pawang_mobile/routes/routes.dart';
import 'package:pawang_mobile/services/user_service.dart';
import 'package:pawang_mobile/utils/storage.dart';

class LoginController extends GetxController {
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final isObsecure = true.obs;

  var isLoading = false;

  @override
  void onClose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    super.onClose();
  }

  Future<void> login() async {
    try {
      final status = await OneSignal.shared.getDeviceState();
      final String? osUserID = status?.userId;

      var input = <String, dynamic>{
        'email': emailTextController.text,
        'password': passwordTextController.text,
        'onesignal_id': osUserID,
      };
      isLoading = true;
      var loginResponse = await UserService.userLogin(input);
      if (loginResponse != null) {
        Storage.saveValue('token', loginResponse.token);
        Get.snackbar('Berhasil Masuk !', 'Selamat Datang ${loginResponse.name}',
            backgroundColor: Colors.green,
            colorText: Colors.white,
            icon: const Icon(
              Icons.check,
              color: Colors.white,
            ));
        Get.offAllNamed(RoutesName.navigation);
      }
    } catch (e) {
      Get.snackbar(
        'Gagal Masuk !',
        '$e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        icon: const Icon(
          Icons.cancel,
          color: Colors.white,
        ),
      );
      print(e);
    }
  }
}
