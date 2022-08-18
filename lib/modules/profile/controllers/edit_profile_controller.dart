import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/modules/dashboard/dashboard.dart';

class EditProfileController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameTextController = TextEditingController();

  final DashboardController dashboardController = Get.find();

  @override
  void onInit() {
    nameTextController.text = dashboardController.user.value.name;
    super.onInit();
  }
}
