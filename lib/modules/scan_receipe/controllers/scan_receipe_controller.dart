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
      if (getImage != null) {
        imageFilePath = getImage;
      }
    } catch (e) {}
    update();
  }

  Future<void> resetScan() async {
    imageFilePath = null;
    update();
  }

  Future<void> uploadReceipt() async {
    try {
      EasyLoading.show(status: 'Mohon Tunggu');
      final fileImage = File(imageFilePath!.path);
      ScanService.uploadReceipt(fileImage).then((value) async {
        if (value['status'] == "true") {
          EasyLoading.dismiss();

          String tempAmounts = value['amounts'].toString();

          Get.snackbar(
            'Berhasil Memindai Struk !',
            'Struk akan disimpan',
            backgroundColor: Colors.green,
            colorText: Colors.white,
            icon: const Icon(
              Icons.check,
              color: Colors.white,
            ),
          );

          await transactionController.formUploadReceiptTransaction(
              tempAmounts, fileImage);

          resetScan();
        }
      });
    } catch (e) {
      if (!Get.isSnackbarOpen) {
        Get.snackbar(
          'Gagal Memindai Struk !',
          'Total Tidak Dapat Ditemukan',
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
}
