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

    try {
      var registerResponse = await UserService.userRegister(input);

      Storage.saveValue(storageToken, registerResponse?.accessToken);
      Get.snackbar('Berhasil Mendaftar !',
          'Selamat Datang ${registerResponse?.user.name}',
          backgroundColor: Colors.green,
          colorText: Colors.white,
          icon: const Icon(
            Icons.check,
            color: Colors.white,
          ));
      Get.offAllNamed(RoutesName.navigation);
    } catch (e) {
      Get.snackbar(
        'Gagal Mendaftar !',
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
