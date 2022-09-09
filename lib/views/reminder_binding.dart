import 'package:get/get.dart';
import 'package:pawang_mobile/views/reminder_controller.dart';

class ReminderBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ReminderController>(ReminderController());
  }
}
