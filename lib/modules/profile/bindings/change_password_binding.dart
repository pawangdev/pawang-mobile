import 'package:get/get.dart';
import 'package:pawang_mobile/modules/profile/controllers/change_password_controller.dart';

class ChangePasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ChangePasswordController>(ChangePasswordController());
  }
}
