import 'package:get/get.dart';
import 'package:pawang_mobile/modules/authentication/controllers/reset_password_controller.dart';
import 'package:pawang_mobile/services/user_service.dart';

class ResetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    // Services
    Get.lazyPut<UserService>(() => UserService());

    // Controller
    Get.put<ResetPasswordController>(ResetPasswordController());
  }
}
