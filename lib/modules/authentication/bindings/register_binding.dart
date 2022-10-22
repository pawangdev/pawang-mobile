import 'package:get/get.dart';
import 'package:pawang_mobile/modules/authentication/controllers/register_controller.dart';
import 'package:pawang_mobile/services/user_service.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    // Services
    Get.lazyPut<UserService>(() => UserService());

    // Controller
    Get.put<RegisterController>(RegisterController());
  }
}
