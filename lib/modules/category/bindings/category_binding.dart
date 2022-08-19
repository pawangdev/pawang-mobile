import 'package:get/get.dart';
import 'package:pawang_mobile/modules/category/controllers/category_controller.dart';

class CategoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<CategoryController>(CategoryController());
  }
}
