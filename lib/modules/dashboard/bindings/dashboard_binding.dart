import 'package:get/get.dart';
import 'package:pawang_mobile/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:pawang_mobile/modules/reminder/services/reminder_service.dart';
import 'package:pawang_mobile/modules/transaction/services/transaction_service.dart';
import 'package:pawang_mobile/modules/wallet/services/wallet_service.dart';
import 'package:pawang_mobile/services/user_service.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    // Services
    Get.lazyPut<WalletService>(() => WalletService());
    Get.lazyPut<ReminderService>(() => ReminderService());
    Get.lazyPut<TransactionService>(() => TransactionService());
    Get.lazyPut<UserService>(() => UserService());

    Get.put<DashboardController>(DashboardController());
  }
}
