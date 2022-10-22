import 'package:get/get.dart';
import 'package:pawang_mobile/modules/dashboard/dashboard.dart';
import 'package:pawang_mobile/modules/reminder/controllers/reminder_controller.dart';
import 'package:pawang_mobile/modules/reminder/services/reminder_service.dart';

class ReminderBinding implements Bindings {
  @override
  void dependencies() {
    // Services
    Get.lazyPut<ReminderService>(() => ReminderService());

    Get.put<ReminderController>(ReminderController());
    Get.lazyPut<DashboardController>(() => DashboardController());
  }
}
