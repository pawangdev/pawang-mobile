import 'dart:developer';

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
      EasyLoading.show(status: 'Mohon Tunggu');

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
      EasyLoading.show(status: 'Mohon Tunggu');

      var data = <String, dynamic>{
        'name': nameTextController.text,
      };

      final subCategoryResponse =
          await categoryService.addSubCategory(id, data);

      if (subCategoryResponse) {
        EasyLoading.dismiss();

        Get.rawSnackbar(
          title: "Sukses",
          message: "Berhasil Menambahkan Subkategori",
          backgroundColor: defaultSuccess,
        );

        getCategories();

        nameTextController.text = "";

        Get.close(1);
      }
    } catch (e) {
      EasyLoading.dismiss();

      Get.rawSnackbar(
        title: 'Gagal Membuat Subkategori !',
        message: '$e',
        backgroundColor: defaultError,
      );
    }
  }

  Future<void> updateSubCategory({categoryId, subCategoryId}) async {
    try {
      EasyLoading.show(status: 'Mohon Tunggu');

      var data = <String, dynamic>{
        'name': nameTextController.text,
      };

      final subCategoryResponse = await categoryService.updateSubCategory(
          data: data, idCategory: categoryId, idSubCategory: subCategoryId);

      if (subCategoryResponse) {
        EasyLoading.dismiss();

        Get.rawSnackbar(
          title: "Sukses",
          message: "Berhasil Memperbarui Subkategori",
          backgroundColor: defaultSuccess,
        );

        getCategories();

        nameTextController.text = "";

        Get.close(1);
      }
    } catch (e) {
      EasyLoading.dismiss();

      Get.rawSnackbar(
        title: 'Gagal Memperbarui Subkategori !',
        message: '$e',
        backgroundColor: defaultError,
      );
    }
  }

  Future<void> deleteSubCategory(
      {required int categoryId, required int subCategoryId}) async {
    try {
      EasyLoading.show(status: 'Mohon Tunggu');

      final response = await categoryService.deleteSubCategory(
          idCategory: categoryId, idSubCategory: subCategoryId);
      if (response) {
        EasyLoading.dismiss();

        getCategories();

        Get.rawSnackbar(
          title: "Sukses",
          message: "Berhasil Menghapus Subkategori",
          backgroundColor: defaultSuccess,
        );

        Get.close(1);
      }
    } catch (e) {
      EasyLoading.dismiss();

      Get.rawSnackbar(
        title: 'Gagal Menghapus Subkategori !',
        message: '$e',
        backgroundColor: defaultError,
      );
    }
  }

  @override
  void onClose() {
    categories.value = [];
    super.onClose();
  }
}
