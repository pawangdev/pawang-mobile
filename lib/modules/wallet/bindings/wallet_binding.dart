import 'package:get/get.dart';
import 'package:pawang_mobile/modules/dashboard/dashboard.dart';
import 'package:pawang_mobile/modules/transaction/transaction.dart';
import 'package:pawang_mobile/modules/wallet/controllers/wallet_controller.dart';
import 'package:pawang_mobile/modules/wallet/services/wallet_service.dart';

class WalletBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WalletService>(() => WalletService());

    Get.put<WalletController>(WalletController());
    Get.lazyPut<DashboardController>(() => DashboardController(), fenix: true);
    Get.lazyPut<TransactionController>(() => TransactionController());
  }
}
