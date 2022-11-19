import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/models/category_model.dart';
import 'package:pawang_mobile/modules/category/services/category_service.dart';

class CategoryController extends GetxController {
  final TextEditingController nameTextController = TextEditingController();
  final categoryService = Get.put(CategoryService());
  final categories = <CategoryDataModel>[].obs;

  @override
  void onInit() {
    getCategories();
    super.onInit();
  }

  Future<void> getCategories() async {
    try {
      EasyLoading.show(status: 'Mohon Tunggu'.tr);

      var categoryResponse = await categoryService.getCategories();
      if (categoryResponse != null) {
        EasyLoading.dismiss();

        categories.assignAll(categoryResponse);
      }
    } catch (e) {
      EasyLoading.dismiss();

      print(e);
    }
  }

  Future<void> addSubCategory(int id) async {
    try {
      EasyLoading.show(status: 'Mohon Tunggu'.tr);

      var data = <String, dynamic>{
        'name': nameTextController.text,
      };

      final subCategoryResponse =
          await categoryService.addSubCategory(id, data);

      if (subCategoryResponse) {
        EasyLoading.dismiss();

        Get.snackbar(
          'Sukses'.tr,
          'Berhasil Menambahkan Subkategori'.tr,
          backgroundColor: defaultSuccess,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(20),
          colorText: Colors.white,
          icon: const Icon(
            Icons.check,
            color: Colors.white,
          ),
        );

        getCategories();

        nameTextController.text = "";

        Get.close(1);
      }
    } catch (e) {
      EasyLoading.dismiss();

      Get.snackbar(
        'Gagal Membuat Subkategori !'.tr,
        '$e',
        backgroundColor: defaultError,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(20),
        colorText: Colors.white,
        icon: const Icon(
          Icons.cancel,
          color: Colors.white,
        ),
      );
    }
  }

  Future<void> updateSubCategory({categoryId, subCategoryId}) async {
    try {
      EasyLoading.show(status: 'Mohon Tunggu'.tr);

      var data = <String, dynamic>{
        'name': nameTextController.text,
      };

      final subCategoryResponse = await categoryService.updateSubCategory(
          data: data, idCategory: categoryId, idSubCategory: subCategoryId);

      if (subCategoryResponse) {
        EasyLoading.dismiss();

        Get.snackbar('Sukses'.tr, 'Berhasil Memperbarui Subkategori'.tr,
            backgroundColor: defaultSuccess,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM,
            margin: const EdgeInsets.all(20),
            icon: const Icon(
              Icons.check,
              color: Colors.white,
            ));

        getCategories();

        nameTextController.text = "";

        Get.close(1);
      }
    } catch (e) {
      EasyLoading.dismiss();

      Get.snackbar(
        'Gagal Memperbarui Subkategori !'.tr,
        '$e',
        backgroundColor: defaultError,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(20),
        colorText: Colors.white,
        icon: const Icon(
          Icons.cancel,
          color: Colors.white,
        ),
      );
    }
  }

  Future<void> deleteSubCategory(
      {required int categoryId, required int subCategoryId}) async {
    try {
      EasyLoading.show(status: 'Mohon Tunggu'.tr);

      final response = await categoryService.deleteSubCategory(
          idCategory: categoryId, idSubCategory: subCategoryId);
      if (response) {
        EasyLoading.dismiss();

        getCategories();

        Get.snackbar(
          "Sukses".tr,
          'Berhasil Menghapus Subkategori'.tr,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(20),
          backgroundColor: defaultSuccess,
          colorText: Colors.white,
          icon: const Icon(
            Icons.check,
            color: Colors.white,
          ),
        );

        Get.close(1);
      }
    } catch (e) {
      EasyLoading.dismiss();

      Get.snackbar(
        'Gagal Menghapus Subkategori !'.tr,
        '$e',
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(20),
        backgroundColor: defaultError,
        colorText: Colors.white,
        icon: const Icon(
          Icons.cancel,
          color: Colors.white,
        ),
      );
    }
  }

  @override
  void onClose() {
    categories.value = [];
    super.onClose();
  }
}
