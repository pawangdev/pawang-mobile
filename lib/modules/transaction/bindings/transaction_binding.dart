import 'package:get/get.dart';
import 'package:pawang_mobile/modules/dashboard/dashboard.dart';
import 'package:pawang_mobile/modules/scan_receipe/scan_receipe.dart';
import 'package:pawang_mobile/modules/transaction/services/transaction_service.dart';
import 'package:pawang_mobile/modules/transaction/transaction.dart';

class TransactionBinding implements Bindings {
  @override
  void dependencies() {
    // Services
    Get.lazyPut<TransactionService>(() => TransactionService());

    // Controller
    Get.put<TransactionController>(TransactionController());
    Get.put<DashboardController>(DashboardController());
    Get.put<ScanReceipeController>(ScanReceipeController());
  }
}
