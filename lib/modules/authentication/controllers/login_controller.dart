import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/models/login_model.dart';
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
      var input = <String, dynamic>{
        'email': emailTextController.text,
        'password': passwordTextController.text,
      };
      isLoading = true;
      var login_response = await UserService.userLogin(input);
      if (login_response != null) {
        Storage.saveValue('token', login_response.token);
        Get.snackbar(
            'Berhasil Masuk !', 'Selamat Datang ${login_response.name}',
            backgroundColor: Colors.green,
            colorText: Colors.white,
            icon: const Icon(
              Icons.check,
              color: Colors.white,
            ));
        Get.offAllNamed(RoutesName.navigation);
      }
    } catch (e) {
      Get.snackbar('Gagal Masuk !', '$e',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          icon: const Icon(
            Icons.cancel,
            color: Colors.white,
          ));
      print(e);
    }
  }
}
