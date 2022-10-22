import 'package:get/get.dart';
import 'package:pawang_mobile/modules/category/controllers/category_controller.dart';
import 'package:pawang_mobile/modules/category/services/category_service.dart';
import 'package:pawang_mobile/modules/transaction/transaction.dart';

class CategoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryService());
    Get.put<CategoryController>(CategoryController());
    Get.lazyPut<TransactionController>(() => TransactionController());
  }
}
