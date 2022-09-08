import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pawang_mobile/models/category_model.dart';
import 'package:pawang_mobile/modules/dashboard/dashboard.dart';
import 'package:pawang_mobile/routes/routes.dart';
import 'package:pawang_mobile/services/category_service.dart';
import 'package:pawang_mobile/services/transaction_service.dart';

class TransactionController extends GetxController {
  final DashboardController dashboardController = Get.find();

  var categoriesIncome = <CategoryDataModel>[].obs;
  var categoriesOutcome = <CategoryDataModel>[].obs;

  @override
  void onInit() {
    getCategoryByType("income", categoriesIncome);
    getCategoryByType("outcome", categoriesOutcome);
    dateTextController.text =
        DateFormat("d MMMM yyyy - HH:mm").format(DateTime.now()).toString();
    dateRFC3399.value = DateTime.now().toUtc().toIso8601String();
    displayDate.value = dateTextController.text;
    super.onInit();
  }

  Future<void> getCategoryByType(
      String typeCategory, RxList<CategoryDataModel> data) async {
    try {
      var categoryResponse =
          await CategoryService.getCategories(type: typeCategory);
      if (categoryResponse != null) {
        data.assignAll(categoryResponse);
      }
    } catch (e) {
      print(e);
    }
  }

  var amountTextController = "0".obs;
  final TextEditingController descriptionTextController =
      TextEditingController();
  final TextEditingController dateTextController = TextEditingController();
  var displayDate = "".obs;
  var displayWalletName = "".obs;
  var displayCategoryName = "".obs;
  var dateRFC3399 = "".obs;
  var walletId = 0.obs;
  var categoryId = 0.obs;

  @override
  void onClose() {
    amountTextController.value = "0";
    descriptionTextController.dispose();
    dateTextController.dispose();
    super.onClose();
  }

  Future<void> createTransaction(String type) async {
    if (walletId.value == 0) {
      Get.snackbar(
        'Gagal Menambahkan Transaksi !',
        'Pilih Salah Satu Wallet Terlebih Dahulu',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        icon: const Icon(
          Icons.cancel,
          color: Colors.white,
        ),
      );
    }

    if (categoryId.value == 0) {
      Get.snackbar(
        'Gagal Menambahkan Transaksi !',
        'Pilih Salah Satu Kategori Terlebih Dahulu',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        icon: const Icon(
          Icons.cancel,
          color: Colors.white,
        ),
      );
    }

    // ignore: unrelated_type_equality_checks
    if (amountTextController.value == "0") {
      Get.snackbar(
        'Gagal Menambahkan Transaksi !',
        'Masukkan Nominal Transaksi',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        icon: const Icon(
          Icons.cancel,
          color: Colors.white,
        ),
      );
    }

    var data = <String, dynamic>{
      'amount': amountTextController,
      'category_id': categoryId.value,
      'sub_category_id': "",
      'wallet_id': walletId.value,
      'type': type,
      'description': descriptionTextController.text,
      'date': dateRFC3399.value,
      'image': null,
    };

    try {
      var transactionResponse =
          await TransactionService.createTransaction(data);

      if (transactionResponse) {
        Get.snackbar(
          'Sukses !',
          "Berhasil Menambahkan Transaksi",
          backgroundColor: Colors.green,
          colorText: Colors.white,
          icon: const Icon(
            Icons.check,
            color: Colors.white,
          ),
        );

        await dashboardController.getWallets();
        await dashboardController.getTransactions();

        Get.offNamed(RoutesName.navigation);
      }
    } catch (e) {
      Get.snackbar(
        'Gagal Menambahkan Transaksi !',
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
