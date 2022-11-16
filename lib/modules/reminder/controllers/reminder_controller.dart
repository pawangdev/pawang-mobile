import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/models/reminder_model.dart';
import 'package:pawang_mobile/modules/dashboard/dashboard.dart';
import 'package:pawang_mobile/modules/reminder/services/reminder_service.dart';

class ReminderController extends GetxController {
  final DashboardController dashboardController = Get.find();
  final reminderService = Get.put(ReminderService());

  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController dateTextController = TextEditingController();
  final TextEditingController typeRepeateTextController =
      TextEditingController(text: "Tidak Berulang".tr);

  final List<String> typeData = [
    'Tidak Berulang'.tr,
    'Harian'.tr,
    'Mingguan'.tr,
    'Bulanan'.tr,
    'Tahunan'.tr,
  ];

  final typeRepeate = "Tidak Berulang".tr.obs;

  Future<void> onSubmit({bool isAdding = true, int? id}) async {
    String? selectedType;
    EasyLoading.show(status: 'Mohon Tunggu');

    switch (typeRepeate.value) {
      case "Tidak Berulang":
        selectedType = "once";
        break;
      case "Harian":
        selectedType = "daily";
        break;
      case "Mingguan":
        selectedType = "weekly";
        break;
      case "Bulanan":
        selectedType = "monthly";
        break;
      case "Tahunan":
        selectedType = "yearly";
        break;
      case "Once":
        selectedType = "once";
        break;
      case "Daily":
        selectedType = "daily";
        break;
      case "Weekly":
        selectedType = "weekly";
        break;
      case "Monthly":
        selectedType = "monthly";
        break;
      case "Yearly":
        selectedType = "yearly";
        break;
    }

    if (isAdding) {
      try {
        final input = <String, dynamic>{
          'name': nameTextController.text,
          'type': selectedType,
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
          'type': selectedType,
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

  Future<bool> toggleReminder(ReminderDataModel reminder) async {
    try {
      EasyLoading.show(status: 'Mohon Tunggu');

      final input = <String, dynamic>{
        'name': reminder.name,
        'type': reminder.type,
        'date': reminder.date,
        'is_active': !reminder.isActive!
      };

      final response =
          await reminderService.updateReminder(reminder.id!, input);

      if (response) {
        await dashboardController
            .getReminders()
            .then((value) => EasyLoading.dismiss());

        resetAllInput();

        if (!reminder.isActive!) {
          Get.snackbar(
            'Sukses !',
            "Berhasil Menyalakan Pengingat",
            backgroundColor: Colors.green,
            colorText: Colors.white,
            icon: const Icon(
              Icons.check,
              color: Colors.white,
            ),
          );

          return true;
        } else {
          Get.snackbar(
            'Sukses !',
            "Berhasil Mematikan Pengingat",
            backgroundColor: Colors.green,
            colorText: Colors.white,
            icon: const Icon(
              Icons.check,
              color: Colors.white,
            ),
          );

          return false;
        }
      }
      return false;
    } catch (e) {
      EasyLoading.dismiss();

      Get.snackbar(
        'Gagal Memperbarui Pengingat !',
        '$e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        icon: const Icon(
          Icons.cancel,
          color: Colors.white,
        ),
      );

      throw false;
    }
  }

  Future<void> resetAllInput() async {
    nameTextController.text = "";
    dateTextController.text = "";
    typeRepeateTextController.text = "Tidak Berulang".tr;
    typeRepeate.value = "Tidak Berulang".tr;

    if (Get.isDialogOpen!) {
      Get.back();
    }
  }
}
