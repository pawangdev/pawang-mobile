import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pawang_mobile/models/category_model.dart';
import 'package:pawang_mobile/modules/category/controllers/category_controller.dart';
import 'package:pawang_mobile/services/category_service.dart';

class TransactionController extends GetxController {
  var categoriesIncome = <CategoryDataModel>[].obs;
  var categoriesOutcome = <CategoryDataModel>[].obs;

  @override
  void onInit() {
    getCategoryByType("income", categoriesIncome);
    getCategoryByType("outcome", categoriesOutcome);
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

  final TextEditingController amountTextController = TextEditingController();
  final TextEditingController descriptionTextController =
      TextEditingController();
  final TextEditingController dateTextController = TextEditingController();
  var wallet_id = 0.obs;
  var category_id = 0.obs;
}
