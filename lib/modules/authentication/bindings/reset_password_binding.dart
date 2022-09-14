import 'package:get/get.dart';
import 'package:pawang_mobile/modules/authentication/controllers/reset_password_controller.dart';

class ResetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ResetPasswordController>(ResetPasswordController());
  }
}
