import 'package:get/get.dart';
import 'package:pawang_mobile/modules/authentication/controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());
  }
}
