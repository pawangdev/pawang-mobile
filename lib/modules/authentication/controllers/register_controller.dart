import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/constants/strings.dart';
import 'package:pawang_mobile/routes/routes.dart';
import 'package:pawang_mobile/services/user_service.dart';
import 'package:pawang_mobile/utils/storage.dart';

class RegisterController extends GetxController {
  final nameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final phoneTextController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final isObsecure = true.obs;

  var genderTextController = ''.obs;

  @override
  void onInit() {
    print(Storage.getValue(storageToken));
    super.onInit();
  }

  @override
  void onClose() {
    nameTextController.dispose();
    emailTextController.dispose();
    passwordTextController.dispose();
    phoneTextController.dispose();
    super.onClose();
  }

  Future<void> register() async {
    final input = <String, dynamic>{
      'name': nameTextController.text,
      'email': emailTextController.text,
      'password': passwordTextController.text,
      'phone': phoneTextController.text,
      'gender': genderTextController.value,
    };

    var registerResponse = await UserService.userRegister(input);

    if (registerResponse.statusCode == 201) {
      Map<String, dynamic> token = jsonDecode(registerResponse.body);
      Storage.saveValue('token', token['data']['token']);
      Get.snackbar(
          'Berhasil Mendaftar !', 'Selamat Datang ${token['data']['name']}',
          backgroundColor: Colors.green,
          colorText: Colors.white,
          icon: const Icon(
            Icons.check,
            color: Colors.white,
          ));
      Get.offAllNamed(RoutesName.navigation);
    } else {
      Map<String, dynamic> error = jsonDecode(registerResponse.body);
      Get.snackbar(
        'Gagal Mendaftar !',
        '${error['data']}',
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
