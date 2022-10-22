import 'package:get/get.dart';
import 'package:pawang_mobile/modules/profile/controllers/change_password_controller.dart';
import 'package:pawang_mobile/services/user_service.dart';

class ChangePasswordBinding implements Bindings {
  @override
  void dependencies() {
    // Services
    Get.lazyPut<UserService>(() => UserService());

    Get.put<ChangePasswordController>(ChangePasswordController());
  }
}
