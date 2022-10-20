import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/models/reminder_model.dart';
import 'package:pawang_mobile/routes/routes.dart';
import 'package:pawang_mobile/services/reminder_service.dart';

class ReminderController extends GetxController {
  final reminders = <ReminderDataModel>[].obs;

  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController dateTextController = TextEditingController();
  final type = "once".obs;

  @override
  void onInit() {
    getRemindersData();
    super.onInit();
  }

  final List<dynamic> typeData = [
    {'name': 'Tidak Berulang', 'id': 'once'},
    {'name': 'Harian', 'id': 'daily'},
    {'name': 'Mingguan', 'id': 'weekly'},
    {'name': 'Bulanan', 'id': 'monthly'},
    {'name': 'Tahunan', 'id': 'yearly'},
  ];

  Future<void> getRemindersData() async {
    try {
      final response = await ReminderService.getReminders();
      if (response != null) {
        reminders.assignAll(response);
      }
    } catch (e) {
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

  Future<void> onSubmit({bool isAdding = true, int? id}) async {
    if (isAdding) {
      try {
        final input = <String, dynamic>{
          'name': nameTextController.text,
          'type': type.value,
          'date': DateTime.parse(dateTextController.text).toLocal().toString(),
          'is_active': true
        };

        final response = await ReminderService.createReminder(input);

        if (response) {
          Get.rawSnackbar(
            title: "Sukses",
            message: "Berhasil Membuat Pengingat",
            backgroundColor: defaultSuccess,
          );

          getRemindersData();

          nameTextController.text = "";
          dateTextController.text = "";

          Get.back();
        }
      } catch (e) {
        log(e.toString());
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
          'type': type.value,
          'date': DateTime.parse(dateTextController.text).toLocal().toString(),
          'is_active': true
        };

        final response = await ReminderService.updateReminder(id!, input);

        if (response) {
          Get.rawSnackbar(
            title: "Sukses",
            message: "Berhasil Memperbarui Pengingat",
            backgroundColor: defaultSuccess,
          );

          getRemindersData();

          nameTextController.text = "";
          dateTextController.text = "";

          Get.offNamed(RoutesName.reminder);
        }
      } catch (e) {
        log(e.toString());
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
      final response = await ReminderService.deleteReminder(id);
      if (response) {
        getRemindersData();

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
}
