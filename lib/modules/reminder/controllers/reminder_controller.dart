import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/modules/dashboard/dashboard.dart';
import 'package:pawang_mobile/modules/reminder/services/reminder_service.dart';

class ReminderController extends GetxController {
  final DashboardController dashboardController = Get.find();
  final reminderService = Get.put(ReminderService());

  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController dateTextController = TextEditingController();

  final List<String> typeData = [
    'Tidak Berulang',
    'Harian',
    'Mingguan',
    'Bulanan',
    'Tahunan',
  ];

  final selectedType = "Tidak Berulang".obs;

  Future<void> onSubmit({bool isAdding = true, int? id}) async {
    EasyLoading.show(status: 'Mohon Tunggu');

    if (isAdding) {
      try {
        final input = <String, dynamic>{
          'name': nameTextController.text,
          'type': selectedType.value,
          'date': DateTime.parse(dateTextController.text).toUtc().toString(),
          'is_active': true
        };

        final response = await reminderService.createReminder(input);

        if (response) {
          await dashboardController.getReminders().then(
              (value) => EasyLoading.dismiss().then((value) => Get.back()));

          resetAllInput();

          Get.rawSnackbar(
            title: "Sukses",
            message: "Berhasil Membuat Pengingat",
            backgroundColor: defaultSuccess,
          );
        }
      } catch (e) {
        EasyLoading.dismiss();

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
    } else {
      try {
        final input = <String, dynamic>{
          'name': nameTextController.text,
          'type': selectedType.value,
          'date': DateTime.parse(dateTextController.text).toUtc().toString(),
          'is_active': true
        };

        final response = await reminderService.updateReminder(id!, input);

        if (response) {
          await dashboardController
              .getReminders()
              .then((value) => EasyLoading.dismiss().then((value) {
                    Get.back();
                  }));

          resetAllInput();

          Get.rawSnackbar(
            title: "Sukses",
            message: "Berhasil Memperbarui Pengingat",
            backgroundColor: defaultSuccess,
          );
        }
      } catch (e) {
        EasyLoading.dismiss();

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
  }

  Future<void> deleteReminder(id) async {
    try {
      EasyLoading.show(status: 'Mohon Tunggu');

      final response = await reminderService.deleteReminder(id);
      if (response) {
        await dashboardController
            .getReminders()
            .then((value) => EasyLoading.dismiss());

        resetAllInput();

        Get.snackbar(
          'Sukses !',
          "Berhasil Menghapus Pengingat",
          backgroundColor: Colors.green,
          colorText: Colors.white,
          icon: const Icon(
            Icons.check,
            color: Colors.white,
          ),
        );
      }
    } catch (e) {
      EasyLoading.dismiss();

      Get.snackbar(
        'Gagal Menghapus Pengingat !',
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

  Future<void> resetAllInput() async {
    nameTextController.text = "";
    dateTextController.text = "";
    selectedType.value = "Tidak Berulang";

    if (Get.isDialogOpen!) {
      Get.back();
    }
  }
}
