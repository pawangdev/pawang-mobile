import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReminderController extends GetxController {
  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController dateTextController = TextEditingController();
  final type = "once".obs;
  final time = "".obs;

  final List<dynamic> typeData = [
    {'name': 'Tidak Berulang', 'id': 'once'},
    {'name': 'Harian', 'id': 'daily'},
    {'name': 'Mingguan', 'id': 'weekly'},
    {'name': 'Bulanan', 'id': 'monthly'},
    {'name': 'Tahunan', 'id': 'yearly'},
  ];
}
