import 'package:get/get.dart';
import 'package:pawang_mobile/modules/authentication/controllers/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<RegisterController>(RegisterController());
  }
}
