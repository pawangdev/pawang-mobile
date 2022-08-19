import 'package:get/get.dart';
import 'package:pawang_mobile/modules/category/controllers/category_controller.dart';
import 'package:pawang_mobile/modules/dashboard/dashboard.dart';
import 'package:pawang_mobile/modules/transaction/transaction.dart';

class TransactionBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<TransactionController>(TransactionController());
    Get.lazyPut<DashboardController>(() => DashboardController());
  }
}
