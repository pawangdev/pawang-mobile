import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/services/user_service.dart';

class ChangePasswordController extends GetxController {
  // Services
  final userService = Get.put(UserService());

  final TextEditingController passwordNowTextController =
      TextEditingController();
  final TextEditingController passwordNewTextController =
      TextEditingController();
  final TextEditingController passwordNewConfirmationTextController =
      TextEditingController();

  Future<void> updatePassword() async {
    EasyLoading.show(status: 'Mohon Tunggu');
    if (passwordNewTextController.text !=
        passwordNewConfirmationTextController.text) {
      EasyLoading.dismiss();

      Get.snackbar(
        'Gagal !',
        'Password Baru Konfirmasi Tidak Sama',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        icon: const Icon(
          Icons.cancel,
          color: Colors.white,
        ),
      );
    }

    try {
      var input = <String, dynamic>{
        'old_password': passwordNowTextController.text,
        'new_password': passwordNewTextController.text,
        'new_password_confirm': passwordNewConfirmationTextController.text,
      };
      var changePasswordResponse = await userService.userChangePassword(input);

      if (changePasswordResponse) {
        await EasyLoading.dismiss();

        Get.back();

        Get.snackbar(
          'Sukses !',
          "Berhasil Memperbarui Password",
          backgroundColor: Colors.green,
          colorText: Colors.white,
          icon: const Icon(
            Icons.check,
            color: Colors.white,
          ),
        );
      }
    } catch (e) {
      EasyLoading.dismiss();

      Get.snackbar(
        'Gagal !',
        '$e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        icon: const Icon(
          Icons.cancel,
          color: Colors.white,
        ),
      );
    }
  }

  Future<void> resetAllInput() async {
    passwordNowTextController.text = '';
    passwordNewTextController.text = '';
    passwordNewConfirmationTextController.text = '';
  }
}
