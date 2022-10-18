import 'package:get/get.dart';
import 'package:pawang_mobile/modules/reminder/controllers/reminder_controller.dart';

class ReminderBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ReminderController>(ReminderController());
  }
}
