import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/modules/dashboard/dashboard.dart';
import 'package:pawang_mobile/modules/wallet/services/wallet_service.dart';

class WalletController extends GetxController {
  int idWallet = 0;
  final walletService = Get.put(WalletService());

  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController balanceTextController = TextEditingController();
  final DashboardController dashboardController = Get.find();

  @override
  void onReady() {
    balanceTextController.text = "0";
    super.onReady();
  }

  @override
  void onClose() {
    nameTextController.dispose();
    balanceTextController.dispose();
    super.onClose();
  }

  Future<void> createWallet() async {
    Get.closeAllSnackbars();

    var input = <String, dynamic>{
      'name': nameTextController.text,
      'balance': balanceTextController.text.replaceAll('.', ''),
    };

    try {
      EasyLoading.show(status: 'Mohon Tunggu'.tr);

      var walletUpdateResponse = await walletService.createWallet(input);
      if (walletUpdateResponse) {
        await dashboardController.getWallets();
        await dashboardController.getTransactions();

        resetAllInput();

        await EasyLoading.dismiss();

        Get.back();

        Get.snackbar(
          'Sukses'.tr,
          'Berhasil Membuat Wallet'.tr,
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
        'Gagal Membuat Wallet !'.tr,
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

  Future<void> updateWallet() async {
    Get.closeAllSnackbars();

    var input = <String, dynamic>{
      'name': nameTextController.text,
      'balance': balanceTextController.text.replaceAll('.', ''),
    };

    try {
      EasyLoading.show(status: 'Mohon Tunggu'.tr);
      var walletUpdateResponse =
          await walletService.updateWallet(input, idWallet);
      if (walletUpdateResponse) {
        await dashboardController.getWallets();
        await dashboardController.getTransactions();

        resetAllInput();

        await EasyLoading.dismiss();

        Get.back();

        Get.snackbar(
          'Sukses'.tr,
          'Berhasil Memperbarui Wallet'.tr,
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
        'Gagal Memperbarui Wallet !'.tr,
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

  Future<void> deleteWallet() async {
    Get.closeAllSnackbars();
    try {
      EasyLoading.show(status: 'Mohon Tunggu'.tr);
      var walletDeleteResponse = await walletService.deleteWallet(idWallet);

      if (walletDeleteResponse) {
        await dashboardController.getWallets();
        await dashboardController.getTransactions();

        resetAllInput();

        await EasyLoading.dismiss();

        Get.back();

        Get.snackbar(
          'Sukses'.tr,
          'Berhasil Menghapus Wallet'.tr,
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
        'Gagal Menghapus Wallet !'.tr,
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
    idWallet = 0;
    nameTextController.text = "";
    balanceTextController.text = "0";
    dashboardController.selectedWallets.value = 0;
  }
}
