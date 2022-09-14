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

    var forgotPasswordResponse =
        await UserService.forgotPasswordRequestToken(input);
    if (forgotPasswordResponse.statusCode == 200 ||
        forgotPasswordResponse.statusCode == 201) {
      Get.snackbar(
        'Berhasil Mengirim Token !',
        'Silahkan Cek Pesan Pada Email Anda',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        icon: const Icon(
          Icons.check,
          color: Colors.white,
        ),
      );
      Get.toNamed(RoutesName.resetpasswordtoken);
    }
  }

  Future<void> sendVerifyToken() async {
    final input = <String, dynamic>{'token': tokenTextController.text};

    var verifyTokenResponse = await UserService.fogotPasswordVerifyToken(input);

    if (verifyTokenResponse.statusCode == 200 ||
        verifyTokenResponse.statusCode == 201) {
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
    }
  }

  Future<void> createNewPassword() async {
    final input = <String, dynamic>{
      'token': tokenTextController.text,
      'password': passwordTextController.text,
      'password_confirmation': passwordConfirmationTextController.text
    };

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
    }

    var passwordConfirmationResponse =
        await UserService.forgotPasswordConfirmation(input);

    if (passwordConfirmationResponse.statusCode == 200 ||
        passwordConfirmationResponse.statusCode == 201) {
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
      Get.offAllNamed(RoutesName.landing);
    }
  }
}
