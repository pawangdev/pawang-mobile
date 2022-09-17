import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pawang_mobile/models/category_model.dart';
import 'package:pawang_mobile/models/transaction_model.dart';
import 'package:pawang_mobile/modules/dashboard/dashboard.dart';
import 'package:pawang_mobile/modules/navigation/navigation.dart';
import 'package:pawang_mobile/modules/scan_receipe/scan_receipe.dart';
import 'package:pawang_mobile/routes/routes.dart';
import 'package:pawang_mobile/services/category_service.dart';
import 'package:pawang_mobile/services/transaction_service.dart';

class TransactionController extends GetxController {
  final DashboardController dashboardController = Get.find();
  final NavigationController navigationController = Get.find();

  // On Update
  late int? transactionId;
  late String? transactionType;

  // On Create
  var categoriesIncome = <CategoryDataModel>[].obs;
  var categoriesOutcome = <CategoryDataModel>[].obs;
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
  void onInit() {
    getCategoryByType("income", categoriesIncome);
    getCategoryByType("outcome", categoriesOutcome);
    dateTextController.text =
        DateFormat("d MMMM yyyy - HH:mm").format(DateTime.now()).toString();
    dateRFC3399.value = DateTime.now().toUtc().toIso8601String();
    displayDate.value = dateTextController.text;
    super.onInit();
  }

  @override
  void onClose() {
    clearInput();
    descriptionTextController.dispose();
    dateTextController.dispose();
    super.onClose();
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

  Future<void> createTransaction(String type) async {
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
    } else if (walletId.value == 0) {
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
    } else if (categoryId.value == 0) {
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
      navigationController.tabIndex = 0;
      var transactionResponse =
          await TransactionService.createTransaction(data);

      if (transactionResponse) {
        Get.delete<TransactionController>();
        Get.delete<DashboardController>();

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

        clearInput();

        Get.toNamed(RoutesName.navigation);
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

  Future<void> deleteTransaction(int transactionId) async {
    try {
      navigationController.tabIndex = 0;

      final response =
          await TransactionService.destroyTransaction(transactionId);
      if (response) {
        Get.delete<TransactionController>();
        Get.delete<DashboardController>();

        Get.snackbar(
          'Sukses !',
          "Berhasil Menghapus Transaksi",
          backgroundColor: Colors.green,
          colorText: Colors.white,
          icon: const Icon(
            Icons.check,
            color: Colors.white,
          ),
        );

        clearInput();

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

  Future<void> formEditTransaction(TransactionDataModel data) async {
    if (data.type == "income") {
      Get.toNamed(RoutesName.addincome, arguments: {"isUpdate": true});
    } else if (data.type == "outcome") {
      Get.toNamed(RoutesName.addoutcome, arguments: {"isUpdate": true});
    }
    transactionId = data.id;
    transactionType = data.type;
    amountTextController.value = data.amount.toString();
    categoryId.value = data.categoryId;
    walletId.value = data.walletId;
    descriptionTextController.text = data.description;
    displayWalletName.value = data.wallet.name;
    displayCategoryName.value = data.category.name;
    // dateRFC3399.value = DateFormat("d MMMM yyyy - HH:mm")
    //     .parse(data.date.toString())
    //     .toUtc()
    //     .toString();
    dateTextController.text = DateFormat("d MMMM yyyy - HH:mm")
        .format(DateFormat("yyyy-mm-dd HH:mm").parse(data.date.toString()))
        .toString();
  }

  Future<void> updateTransaction(int transactionId, String type) async {
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
    } else if (walletId.value == 0) {
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
    } else if (categoryId.value == 0) {
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
      navigationController.tabIndex = 0;
      var transactionResponse =
          await TransactionService.updateTransaction(data, transactionId);

      if (transactionResponse) {
        Get.delete<TransactionController>();
        Get.delete<DashboardController>();

        Get.snackbar(
          'Sukses !',
          "Berhasil Memperbarui Transaksi",
          backgroundColor: Colors.green,
          colorText: Colors.white,
          icon: const Icon(
            Icons.check,
            color: Colors.white,
          ),
        );

        clearInput();

        Get.toNamed(RoutesName.navigation);
      }
    } catch (e) {
      Get.snackbar(
        'Gagal Memperbarui Transaksi !',
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

  Future<void> clearInput() async {
    displayDate.value = "";
    dateRFC3399.value = "";
    amountTextController.value = "0";
    walletId.value = 0;
    categoryId.value = 0;
    displayWalletName.value = "";
    displayCategoryName.value = "";
    Get.delete<ScanReceipeController>();
  }
}
