import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pawang_mobile/modules/transaction/transaction.dart';
import 'package:pawang_mobile/services/scan_service.dart';

class ScanReceipeController extends GetxController {
  final TransactionController transactionController =
      Get.put<TransactionController>(TransactionController());
  XFile? imageFilePath;

  Future<void> scanReceipt(bool isFromGal) async {
    // GET AND CROP THE IMAGE
    try {
      final getImage = await ScanService().getImage(isFromGal);
      // ignore: unnecessary_null_comparison
      if (getImage != null) {
        imageFilePath = getImage;
      }
    } catch (e) {
      rethrow;
    }
    update();
  }

  Future<void> resetScan() async {
    imageFilePath = null;
    update();
  }

  Future<void> uploadReceipt() async {
    try {
      EasyLoading.show(status: 'Mohon Tunggu'.tr);
      final fileImage = File(imageFilePath!.path);
      ScanService.uploadReceipt(fileImage).then((value) async {
        if (value?.status == true) {
          EasyLoading.dismiss();

          String tempAmounts = value!.amount.toString();
          print(tempAmounts);

          Get.snackbar(
            'Berhasil Memindai Struk !'.tr,
            'Struk akan disimpan'.tr,
            backgroundColor: Colors.green,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
            margin: const EdgeInsets.all(20),
            icon: const Icon(
              Icons.check,
              color: Colors.white,
            ),
          );

          await transactionController.formUploadReceiptTransaction(
              tempAmounts, fileImage);

          resetScan();
        } else {
          EasyLoading.dismiss();

          Get.snackbar(
            'Gagal Memindai Struk !'.tr,
            'Total Tidak Dapat Ditemukan'.tr,
            backgroundColor: Colors.red,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
            margin: const EdgeInsets.all(20),
            icon: const Icon(
              Icons.cancel,
              color: Colors.white,
            ),
          );

          resetScan();
        }
      });
    } catch (e) {
      if (!Get.isSnackbarOpen) {
        Get.snackbar(
          'Gagal Memindai Struk !'.tr,
          'Total Tidak Dapat Ditemukan'.tr,
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
}
