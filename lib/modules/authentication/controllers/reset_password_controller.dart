import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/routes/routes.dart';
import 'package:pawang_mobile/services/user_service.dart';

class ResetPasswordController extends GetxController {
  // Services
  final userService = Get.put(UserService());

  final formKey = GlobalKey<FormState>();

  Future<void> formValdidate() async {
    formKey.currentState?.validate();
  }

  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController tokenTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController passwordConfirmationTextController =
      TextEditingController();

  Future<void> sendRequestToken() async {
    EasyLoading.show(status: 'Mohon Tunggu'.tr);
    final input = <String, dynamic>{"email": emailTextController.text};

    try {
      await userService
          .forgotPasswordRequestToken(input)
          .then((value) => EasyLoading.dismiss());

      Get.snackbar(
        'Berhasil Mengirim Token !'.tr,
        'Silahkan Cek Token Pada Email Anda'.tr,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(20),
        icon: const Icon(
          Icons.check,
          color: Colors.white,
        ),
      );
      Get.toNamed(RoutesName.resetpasswordtoken);
    } catch (e) {
      EasyLoading.dismiss();
      Get.snackbar(
        'Tedapat Kesalahan !'.tr,
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
    }
  }

  Future<void> sendVerifyToken() async {
    EasyLoading.show(status: 'Mohon Tunggu');

    final input = <String, dynamic>{
      'token': tokenTextController.text,
      'email': emailTextController.text
    };

    try {
      await userService
          .fogotPasswordVerifyToken(input)
          .then((value) => EasyLoading.dismiss());

      Get.snackbar(
        'Token Valid !',
        'Silahkan Buat Password Baru Anda',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(20),
        icon: const Icon(
          Icons.check,
          color: Colors.white,
        ),
      );
      Get.toNamed(RoutesName.resetpasswordconfirmation);
    } catch (e) {
      EasyLoading.dismiss();

      Get.snackbar(
        'Tedapat Kesalahan !',
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
    }
  }

  Future<void> createNewPassword() async {
    EasyLoading.show(status: 'Mohon Tunggu');

    final input = <String, dynamic>{
      'email': emailTextController.text,
      'token': tokenTextController.text,
      'password': passwordTextController.text,
      'password_confirm': passwordConfirmationTextController.text
    };

    try {
      if (passwordTextController.text !=
          passwordConfirmationTextController.text) {
        if (!Get.isSnackbarOpen) {
          EasyLoading.dismiss();

          Get.snackbar(
            'Gagal Membuat Password !',
            'Password Konfirmasi Tidak Sesuai',
            backgroundColor: Colors.red,
            snackPosition: SnackPosition.BOTTOM,
            margin: const EdgeInsets.all(20),
            colorText: Colors.white,
            icon: const Icon(
              Icons.cancel,
              color: Colors.white,
            ),
          );
        }

        throw ("Password Konfirmasi Tidak Sesuai");
      }

      await userService
          .forgotPasswordConfirmation(input)
          .then((value) => EasyLoading.dismiss());

      Get.snackbar(
        'Sukses Mereset Password !',
        'Silahkan Login Kembali !',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(20),
        icon: const Icon(
          Icons.check,
          color: Colors.white,
        ),
      );
      Get.offAllNamed(RoutesName.landing);
    } catch (e) {
      EasyLoading.dismiss();

      if (!Get.isSnackbarOpen) {
        Get.snackbar(
          'Gagal Membuat Password !',
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
      }
    }
  }
}
