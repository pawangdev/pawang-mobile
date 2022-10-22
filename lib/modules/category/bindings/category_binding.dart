import 'package:get/get.dart';
import 'package:pawang_mobile/modules/category/controllers/category_controller.dart';
import 'package:pawang_mobile/modules/transaction/transaction.dart';

class CategoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<CategoryController>(CategoryController());
    Get.lazyPut<TransactionController>(() => TransactionController());
  }
}
