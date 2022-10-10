import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:pawang_mobile/constants/strings.dart';
import 'package:pawang_mobile/routes/routes.dart';
import 'package:pawang_mobile/services/user_service.dart';
import 'package:pawang_mobile/utils/storage.dart';

class LoginController extends GetxController {
  GoogleSignInAccount? _googleUser;

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

  Future<void> signInGoogle() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn();

      _googleUser = await googleSignIn.signIn();

      var input = <String, dynamic>{
        'email': _googleUser!.email,
        'google_id': _googleUser!.id,
        'name': _googleUser!.displayName,
        'image_profile': _googleUser!.photoUrl,
      };

      final loginResponse = await UserService.userLoginWithGoogle(input);
      Storage.saveValue(storageToken, loginResponse!.accessToken);
      Get.snackbar(
          'Berhasil Masuk !', 'Selamat Datang ${loginResponse.user.name}',
          backgroundColor: Colors.green,
          colorText: Colors.white,
          icon: const Icon(
            Icons.check,
            color: Colors.white,
          ));
      Get.offAllNamed(RoutesName.navigation);
    } catch (e) {
      Get.snackbar(
        'Gagal Masuk !',
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

  Future<void> login() async {
    try {
      // final status = await OneSignal.shared.getDeviceState();
      // final String? osUserID = status?.userId;

      var input = <String, dynamic>{
        'email': emailTextController.text,
        'password': passwordTextController.text,
      };

      final loginResponse = await UserService.userLogin(input);
      Storage.saveValue(storageToken, loginResponse!.accessToken);
      Get.snackbar(
          'Berhasil Masuk !', 'Selamat Datang ${loginResponse.user.name}',
          backgroundColor: Colors.green,
          colorText: Colors.white,
          icon: const Icon(
            Icons.check,
            color: Colors.white,
          ));
      Get.offAllNamed(RoutesName.navigation);
    } catch (e) {
      Get.snackbar(
        'Gagal Masuk !',
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
