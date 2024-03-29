import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:pawang_mobile/constants/strings.dart';
import 'package:pawang_mobile/routes/routes.dart';
import 'package:pawang_mobile/services/user_service.dart';
import 'package:pawang_mobile/utils/storage.dart';

class RegisterController extends GetxController {
  // Services
  final userService = Get.put(UserService());

  final formKey = GlobalKey<FormState>();

  Future<void> formValdidate() async {
    formKey.currentState?.validate();
  }

  final nameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final phoneTextController = TextEditingController();
  final isObsecure = true.obs;

  var genderTextController = ''.obs;

  @override
  void onClose() {
    nameTextController.dispose();
    emailTextController.dispose();
    passwordTextController.dispose();
    phoneTextController.dispose();
    super.onClose();
  }

  Future<void> register() async {
    EasyLoading.show(status: 'Mohon Tunggu'.tr);
    final status = await OneSignal.shared.getDeviceState();
    final String? osUserID = status?.userId;

    final input = <String, dynamic>{
      'name': nameTextController.text,
      'email': emailTextController.text,
      'password': passwordTextController.text,
      'onesignal_id': osUserID,
    };

    try {
      var registerResponse = await userService.userRegister(input);

      Storage.saveValue(storageToken, registerResponse?.accessToken)
          .then((value) => EasyLoading.dismiss());
      Get.snackbar(
        'Berhasil Mendaftar !'.tr,
        'Selamat Datang '.tr + '${registerResponse?.user.name}',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(20),
        icon: const Icon(
          Icons.check,
          color: Colors.white,
        ),
      );
      Get.offAllNamed(RoutesName.navigation);
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
}
