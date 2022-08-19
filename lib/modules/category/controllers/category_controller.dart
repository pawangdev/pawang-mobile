import 'package:get/get.dart';
import 'package:pawang_mobile/models/category_model.dart';
import 'package:pawang_mobile/services/category_service.dart';

class CategoryController extends GetxController {
  var categories = <CategoryDataModel>[].obs;

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

  @override
  void onClose() {
    categories.value = [];
    super.onClose();
  }
}
