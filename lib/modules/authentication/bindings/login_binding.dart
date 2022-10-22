import 'package:get/get.dart';
import 'package:pawang_mobile/modules/authentication/controllers/login_controller.dart';
import 'package:pawang_mobile/services/user_service.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    // Services
    Get.lazyPut<UserService>(() => UserService());

    // Controller
    Get.put<LoginController>(LoginController());
  }
}
