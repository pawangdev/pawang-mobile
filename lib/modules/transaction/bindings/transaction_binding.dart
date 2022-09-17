import 'package:get/get.dart';
import 'package:pawang_mobile/modules/dashboard/dashboard.dart';
import 'package:pawang_mobile/modules/scan_receipe/scan_receipe.dart';
import 'package:pawang_mobile/modules/transaction/transaction.dart';

class TransactionBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<TransactionController>(TransactionController());
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<ScanReceipeController>(() => ScanReceipeController());
  }
}
