import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pawang_mobile/modules/dashboard/dashboard.dart';
import 'package:pawang_mobile/routes/routes.dart';
import 'package:pawang_mobile/services/wallet_service.dart';

class WalletController extends GetxController {
  int idWallet = 0;

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
    balanceTextController.text = "0";
    nameTextController.dispose();
    balanceTextController.dispose();
    super.onClose();
  }

  Future<void> createWallet() async {
    var input = <String, dynamic>{
      'name': nameTextController.text,
      'balance': int.parse(balanceTextController.text),
    };

    try {
      var walletUpdateResponse = await WalletService.createWallet(input);
      if (walletUpdateResponse) {
        await dashboardController.getWallets();
        await dashboardController.getTransactions();

        resetAllInput();

        Get.snackbar(
          'Sukses !',
          "Berhasil Membuat Wallet",
          backgroundColor: Colors.green,
          colorText: Colors.white,
          icon: const Icon(
            Icons.check,
            color: Colors.white,
          ),
        );

        nameTextController.clear();
        balanceTextController.clear();

        Get.offNamed(RoutesName.wallet);
      }
    } catch (e) {
      Get.snackbar(
        'Gagal Membuat Wallet !',
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

  Future<void> updateWallet() async {
    var input = <String, dynamic>{
      'name': nameTextController.text,
      'balance': int.parse(balanceTextController.text),
    };

    try {
      var walletUpdateResponse =
          await WalletService.updateWallet(input, idWallet);
      if (walletUpdateResponse) {
        await dashboardController.getWallets();
        await dashboardController.getTransactions();

        resetAllInput();

        Get.snackbar(
          'Sukses !',
          "Berhasil Memperbarui Wallet",
          backgroundColor: Colors.green,
          colorText: Colors.white,
          icon: const Icon(
            Icons.check,
            color: Colors.white,
          ),
        );

        idWallet = 0;
        nameTextController.clear();
        balanceTextController.clear();

        Get.offNamed(RoutesName.navigation);
      }
    } catch (e) {
      Get.snackbar(
        'Gagal Memperbarui Wallet !',
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

  Future<void> deleteWallet() async {
    try {
      var walletDeleteResponse = await WalletService.deleteWallet(idWallet);

      if (walletDeleteResponse) {
        await dashboardController.getWallets();
        await dashboardController.getTransactions();

        resetAllInput();

        Get.snackbar(
          'Sukses !',
          "Berhasil Menghapus Wallet",
          backgroundColor: Colors.green,
          colorText: Colors.white,
          icon: const Icon(
            Icons.check,
            color: Colors.white,
          ),
        );

        idWallet = 0;

        Get.toNamed(RoutesName.navigation);
      }
    } catch (e) {
      Get.snackbar(
        'Gagal Menghapus Wallet !',
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
    balanceTextController.text = "0";
  }
}
