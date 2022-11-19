import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/modules/dashboard/dashboard.dart';
import 'package:pawang_mobile/services/user_service.dart';

class EditProfileController extends GetxController {
  // Services
  final userService = Get.put(UserService());

  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController phoneTextController = TextEditingController();
  var genderTextController = ''.obs;

  final DashboardController dashboardController = Get.find();

  @override
  void onInit() {
    nameTextController.text = dashboardController.user.value.name;
    phoneTextController.text = dashboardController.user.value.phone ?? "";
    genderTextController.value = dashboardController.user.value.gender ?? "";
    super.onInit();
  }

  Future<void> updateProfile() async {
    EasyLoading.show(status: 'Mohon Tunggu');

    var input = <String, dynamic>{
      'name': nameTextController.text,
    };

    if (genderTextController.value.isNotEmpty) {
      input['gender'] = genderTextController.value;
    }

    if (phoneTextController.text.isNotEmpty) {
      input['phone'] = phoneTextController.text;
    }

    try {
      var editProfileResponse = await userService.userUpdateProfile(input);
      if (editProfileResponse != null) {
        dashboardController.user.update((user) {
          user?.name = editProfileResponse.name;
          user?.gender = editProfileResponse.gender;
          user?.phone = editProfileResponse.phone;
        });

        await EasyLoading.dismiss();

        Get.back();

        Get.snackbar(
          'Sukses !',
          "Berhasil Memperbarui Profil",
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(20),
          icon: const Icon(
            Icons.check,
            color: Colors.white,
          ),
        );
      }
    } catch (e) {
      EasyLoading.dismiss();

      Get.snackbar(
        'Gagal Memperbarui Profil !',
        '$e',
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

  Future<void> resetAllInput() async {
    nameTextController.text = dashboardController.user.value.name;
    phoneTextController.text = dashboardController.user.value.phone ?? "";
    genderTextController.value = dashboardController.user.value.gender ?? "";
  }
}
