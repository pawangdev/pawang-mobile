import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/modules/dashboard/dashboard.dart';
import 'package:pawang_mobile/routes/routes.dart';
import 'package:pawang_mobile/services/user_service.dart';

class EditProfileController extends GetxController {
  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController phoneTextController = TextEditingController();
  var genderTextController = ''.obs;

  final DashboardController dashboardController = Get.find();

  @override
  void onInit() {
    nameTextController.text = dashboardController.user.value.name;
    phoneTextController.text = dashboardController.user.value.phone;
    genderTextController.value = dashboardController.user.value.gender;
    super.onInit();
  }

  Future<void> updateProfile() async {
    var input = <String, dynamic>{
      'name': nameTextController.text,
      'phone': phoneTextController.text,
      'gender': genderTextController.value,
    };

    try {
      var editProfileResponse = await UserService.userUpdateProfile(input);
      if (editProfileResponse != null) {
        dashboardController.user.update((user) {
          user?.name = editProfileResponse.name;
          user?.gender = editProfileResponse.gender;
          user?.phone = editProfileResponse.phone;
        });

        Get.snackbar(
          'Sukses !',
          "Berhasil Memperbarui Profil",
          backgroundColor: Colors.green,
          colorText: Colors.white,
          icon: const Icon(
            Icons.check,
            color: Colors.white,
          ),
        );

        Get.offNamed(RoutesName.navigation);
      }
    } catch (e) {
      Get.snackbar(
        'Gagal Memperbarui Profil !',
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
}
