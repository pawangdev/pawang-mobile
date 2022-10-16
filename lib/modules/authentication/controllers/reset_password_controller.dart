import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/routes/routes.dart';
import 'package:pawang_mobile/services/user_service.dart';

class ResetPasswordController extends GetxController {
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController tokenTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController passwordConfirmationTextController =
      TextEditingController();

  @override
  void onClose() {
    emailTextController.dispose();
    tokenTextController.dispose();
    passwordTextController.dispose();
    passwordConfirmationTextController.dispose();
    super.onClose();
  }

  Future<void> sendRequestToken() async {
    final input = <String, dynamic>{"email": emailTextController.text};

    try {
      await UserService.forgotPasswordRequestToken(input);

      Get.snackbar(
        'Berhasil Mengirim Token !',
        'Silahkan Cek Token Pada Email Anda',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        icon: const Icon(
          Icons.check,
          color: Colors.white,
        ),
      );
      Get.toNamed(RoutesName.resetpasswordtoken);
    } catch (e) {
      Get.snackbar(
        'Tedapat Kesalahan !',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
        icon: const Icon(
          Icons.cancel,
          color: Colors.white,
        ),
      );
    }
  }

  Future<void> sendVerifyToken() async {
    final input = <String, dynamic>{
      'token': tokenTextController.text,
      'email': emailTextController.text
    };

    try {
      await UserService.fogotPasswordVerifyToken(input);

      Get.snackbar(
        'Token Valid !',
        'Silahkan Buat Password Baru Anda',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        icon: const Icon(
          Icons.check,
          color: Colors.white,
        ),
      );
      Get.toNamed(RoutesName.resetpasswordconfirmation);
    } catch (e) {
      Get.snackbar(
        'Tedapat Kesalahan !',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
        icon: const Icon(
          Icons.cancel,
          color: Colors.white,
        ),
      );
    }
  }

  Future<void> createNewPassword() async {
    final input = <String, dynamic>{
      'email': emailTextController.text,
      'token': tokenTextController.text,
      'password': passwordTextController.text,
      'password_confirmation': passwordConfirmationTextController.text
    };

    try {
      if (passwordTextController.text !=
          passwordConfirmationTextController.text) {
        if (!Get.isSnackbarOpen) {
          Get.snackbar(
            'Gagal Membuat Password !',
            'Password Konfirmasi Tidak Sesuai',
            backgroundColor: Colors.red,
            colorText: Colors.white,
            icon: const Icon(
              Icons.cancel,
              color: Colors.white,
            ),
          );
        }

        throw ("Password Konfirmasi Tidak Sesuai");
      }

      await UserService.forgotPasswordConfirmation(input);

      Get.snackbar(
        'Sukses Mereset Password !',
        'Silahkan Login Kembali !',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        icon: const Icon(
          Icons.check,
          color: Colors.white,
        ),
      );
      Get.offAllNamed(RoutesName.landing);
    } catch (e) {
      if (!Get.isSnackbarOpen) {
        Get.snackbar(
          'Gagal Membuat Password !',
          e.toString(),
          backgroundColor: Colors.red,
          colorText: Colors.white,
          icon: const Icon(
            Icons.cancel,
            color: Colors.white,
          ),
        );
      }
    }
  }
}
