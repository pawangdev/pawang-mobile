import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/models/category_model.dart';
import 'package:pawang_mobile/services/category_service.dart';

class CategoryController extends GetxController {
  final TextEditingController nameTextController = TextEditingController();
  final categories = <CategoryDataModel>[].obs;

  @override
  void onInit() {
    getCategories();
    super.onInit();
  }

  Future<void> getCategories() async {
    try {
      var categoryResponse = await CategoryService.getCategories();
      if (categoryResponse != null) {
        categories.assignAll(categoryResponse);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> addSubCategory(int id) async {
    try {
      var data = <String, dynamic>{
        'name': nameTextController.text,
      };

      final subCategoryResponse =
          await CategoryService.addSubCategory(id, data);

      if (subCategoryResponse) {
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
      Get.rawSnackbar(
        title: 'Gagal Membuat Subkategori !',
        message: '$e',
        backgroundColor: defaultError,
      );
    }
  }

  Future<void> updateSubCategory({categoryId, subCategoryId}) async {
    try {
      var data = <String, dynamic>{
        'name': nameTextController.text,
      };

      final subCategoryResponse = await CategoryService.updateSubCategory(
          data: data, idCategory: categoryId, idSubCategory: subCategoryId);

      if (subCategoryResponse) {
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
      Get.rawSnackbar(
        title: 'Gagal Memperbarui Subkategori !',
        message: '$e',
        backgroundColor: defaultError,
      );
    }
  }

  Future<void> deleteSubCategory({categoryId, subCategoryId}) async {
    try {
      final response = await CategoryService.deleteSubCategory(
          idCategory: categoryId, idSubCategory: subCategoryId);
      if (response) {
        getCategories();

        Get.rawSnackbar(
          title: "Sukses",
          message: "Berhasil Menghapus Subkategori",
          backgroundColor: defaultSuccess,
        );

        Get.close(1);
      }
    } catch (e) {
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
