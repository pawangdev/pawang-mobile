import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pawang_mobile/modules/dashboard/dashboard.dart';
import 'package:pawang_mobile/modules/navigation/navigation.dart';
import 'package:pawang_mobile/modules/scan_receipe/scan_receipe.dart';
import 'package:pawang_mobile/modules/transaction/services/transaction_service.dart';
import 'package:pawang_mobile/routes/routes.dart';
import 'package:pawang_mobile/utils/currency_format.dart';

class TransactionController extends GetxController {
  // Services
  final transactionService = Get.put(TransactionService());

  final formKey = GlobalKey<FormState>();

  Future<void> formValdidate() async {
    formKey.currentState?.validate();
  }

  final DashboardController dashboardController = Get.find();
  final NavigationController navigationController = Get.find();

  // Check Update
  bool isUpdate = false;

  // Check If Scan Struk Page
  bool isScanReceipt = false;

  // On Update
  late int? transactionId;
  late String? transactionType;

  var amountTextController = "0".obs;

  final TextEditingController descriptionTextController =
      TextEditingController();
  final TextEditingController dateTextController = TextEditingController();
  var displayDate = "".obs;
  final TextEditingController displayWalletName = TextEditingController();
  final TextEditingController displayAmount =
      TextEditingController(text: "Rp 0");
  final TextEditingController displayCategoryName = TextEditingController();
  var dateRFC3399 = "".obs;
  var walletId = 0.obs;
  var categoryId = 0.obs;
  var subCategoryId = 0.obs;
  var type = "".obs;
  late File fileImageReceipt;

  // Filter Wallets
  final isFilter = false.obs;
  final selectedFilterWalletId = 0.obs;

  @override
  void onInit() {
    dateTextController.text = DateTime.now().toUtc().toIso8601String();
    dateRFC3399.value = DateTime.now().toUtc().toIso8601String();
    displayDate.value =
        DateFormat("d MMMM yyyy - HH:mm").format(DateTime.now()).toString();
    super.onInit();
  }

  @override
  void onClose() {
    clearInput();
    descriptionTextController.dispose();
    dateTextController.dispose();
    super.onClose();
  }

  Future<void> createTransaction() async {
    Get.closeAllSnackbars();
    EasyLoading.show(status: 'Mohon Tunggu'.tr);
    // ignore: unrelated_type_equality_checks
    if (amountTextController.value == "0") {
      EasyLoading.dismiss();
      Get.snackbar(
        'Gagal Menambahkan Transaksi !'.tr,
        'Masukkan Nominal Transaksi'.tr,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(20),
        icon: const Icon(
          Icons.cancel,
          color: Colors.white,
        ),
      );
      throw ('Masukkan Nominal Transaksi'.tr);
    } else if (walletId.value == 0) {
      EasyLoading.dismiss();
      Get.snackbar(
        'Gagal Menambahkan Transaksi !'.tr,
        'Pilih Salah Satu Wallet Terlebih Dahulu'.tr,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(20),
        icon: const Icon(
          Icons.cancel,
          color: Colors.white,
        ),
      );
      throw ("Pilih Salah Satu Wallet Terlebih Dahulu".tr);
    } else if (categoryId.value == 0) {
      EasyLoading.dismiss();
      Get.snackbar(
        'Gagal Menambahkan Transaksi !'.tr,
        'Pilih Salah Satu Kategori Terlebih Dahulu'.tr,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(20),
        icon: const Icon(
          Icons.cancel,
          color: Colors.white,
        ),
      );
      throw ("Pilih Salah Satu Kategori Terlebih Dahulu".tr);
    }

    var data = <String, dynamic>{
      'amount': amountTextController,
      'category_id': categoryId.value,
      'subcategory_id': subCategoryId.value,
      'wallet_id': walletId.value,
      'description': descriptionTextController.text,
      'date': DateTime.parse(dateTextController.text).toUtc().toString(),
    };

    try {
      // ignore: unrelated_type_equality_checks
      if (amountTextController != 0) {
        navigationController.tabIndex = 0;
        var transactionResponse =
            await transactionService.createTransaction(data);

        if (transactionResponse) {
          await dashboardController.getTransactions();
          await dashboardController.getWallets();

          await EasyLoading.dismiss();

          if (isScanReceipt) {
            navigationController.changeTabIndex(0);
            Get.offAllNamed(RoutesName.navigation);
          } else {
            Get.back();
          }

          Get.snackbar(
            'Sukses'.tr,
            'Berhasil Menambahkan Transaksi'.tr,
            backgroundColor: Colors.green,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
            margin: const EdgeInsets.all(20),
            icon: const Icon(
              Icons.check,
              color: Colors.white,
            ),
          );

          clearInput();
        }
      }
    } catch (e) {
      EasyLoading.dismiss();
      Get.snackbar(
        'Gagal Menambahkan Transaksi !'.tr,
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

  Future<void> deleteTransaction(int transactionId) async {
    Get.closeAllSnackbars();
    EasyLoading.show(status: 'Mohon Tunggu'.tr);
    try {
      navigationController.tabIndex = 0;

      final response =
          await transactionService.destroyTransaction(transactionId);
      if (response) {
        await dashboardController.getTransactions();
        await dashboardController.getWallets();

        await EasyLoading.dismiss();

        Get.offAllNamed(RoutesName.navigation);

        Get.snackbar(
          'Sukses'.tr,
          'Berhasil Menghapus Transaksi'.tr,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(20),
          icon: const Icon(
            Icons.check,
            color: Colors.white,
          ),
        );

        clearInput();
      }
    } catch (e) {
      EasyLoading.dismiss();
      Get.snackbar(
        'Gagal Menambahkan Transaksi !'.tr,
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

  Future<void> formUploadReceiptTransaction(String amount, File image) async {
    isScanReceipt = true;
    amountTextController.value = amount;
    displayAmount.text = CurrencyFormat.convertToIdr(int.parse(amount), 2);
    fileImageReceipt = image;

    Get.toNamed(RoutesName.addtransaction);
  }

  Future<void> formEditTransaction(dynamic data) async {
    print(DateTime.parse(data.date.toString()).toLocal());
    if (data.type == "income") {
      Get.toNamed(RoutesName.addtransaction, arguments: {"isUpdate": true});
    } else if (data.type == "outcome") {
      Get.toNamed(RoutesName.addtransaction, arguments: {"isUpdate": true});
    }
    transactionId = data.id;
    transactionType = data.type;
    amountTextController.value = data.amount.toString();
    displayAmount.text =
        CurrencyFormat.convertToIdr(int.parse(data.amount.toString()), 2);
    categoryId.value = data.categoryId;
    walletId.value = data.walletId;
    descriptionTextController.text = data.description ?? "";
    displayWalletName.text = data.wallet.name;
    displayCategoryName.text = data.category.name;
    descriptionTextController.text = data.description ?? "";

    if (data.subcategoryId != null) {
      subCategoryId.value = data.subcategoryId!;
      displayCategoryName.text =
          "${data.category.name} - ${data.subcategory?.name}";
    }

    dateTextController.text = data.date.toString();

    dateRFC3399.value = data.date.toString();

    isUpdate = true;
  }

  Future<void> updateTransaction() async {
    Get.closeAllSnackbars();
    EasyLoading.show(status: 'Mohon Tunggu'.tr);
    // ignore: unrelated_type_equality_checks
    if (amountTextController.value == "0") {
      EasyLoading.dismiss();
      Get.snackbar(
        'Gagal Menambahkan Transaksi !'.tr,
        'Masukkan Nominal Transaksi'.tr,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(20),
        icon: const Icon(
          Icons.cancel,
          color: Colors.white,
        ),
      );
    } else if (walletId.value == 0) {
      EasyLoading.dismiss();
      Get.snackbar(
        'Gagal Menambahkan Transaksi !'.tr,
        'Pilih Salah Satu Wallet Terlebih Dahulu'.tr,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(20),
        icon: const Icon(
          Icons.cancel,
          color: Colors.white,
        ),
      );
    } else if (categoryId.value == 0) {
      EasyLoading.dismiss();
      Get.snackbar(
        'Gagal Menambahkan Transaksi !'.tr,
        'Pilih Salah Satu Kategori Terlebih Dahulu'.tr,
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

    var data = <String, dynamic>{
      'amount': amountTextController,
      'category_id': categoryId.value,
      'subcategory_id': subCategoryId.value,
      'wallet_id': walletId.value,
      'description': descriptionTextController.text,
      'date': DateTime.parse(dateTextController.text).toUtc().toString(),
      'image': null,
    };

    try {
      navigationController.tabIndex = 0;
      var transactionResponse =
          await transactionService.updateTransaction(data, transactionId!);

      if (transactionResponse) {
        await dashboardController.getTransactions();
        await dashboardController.getWallets();

        await EasyLoading.dismiss();

        Get.offAllNamed(RoutesName.navigation);

        isUpdate = false;

        Get.snackbar(
          'Sukses'.tr,
          'Berhasil Memperbarui Transaksi'.tr,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(20),
          icon: const Icon(
            Icons.check,
            color: Colors.white,
          ),
        );

        clearInput();
      }
    } catch (e) {
      EasyLoading.dismiss();
      Get.snackbar(
        'Gagal Memperbarui Transaksi !'.tr,
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

  Future<void> clearInput() async {
    isUpdate = false;
    isScanReceipt = false;
    dateTextController.text =
        DateFormat("d MMMM yyyy - HH:mm").format(DateTime.now()).toString();
    dateRFC3399.value = DateTime.now().toUtc().toIso8601String();
    displayDate.value = dateTextController.text;
    amountTextController.value = "0";
    walletId.value = 0;
    categoryId.value = 0;
    displayAmount.text = "Rp 0";
    displayWalletName.text = "";
    displayCategoryName.text = "";
    descriptionTextController.text = "";
    dashboardController.selectedWallets.value = 0;
    Get.delete<ScanReceipeController>();
  }
}
