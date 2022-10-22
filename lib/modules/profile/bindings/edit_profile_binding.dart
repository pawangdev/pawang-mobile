import 'package:get/get.dart';
import 'package:pawang_mobile/modules/dashboard/dashboard.dart';
import 'package:pawang_mobile/modules/profile/controllers/edit_profile_controller.dart';
import 'package:pawang_mobile/services/user_service.dart';

class EditProfileBinding implements Bindings {
  @override
  void dependencies() {
    // Services
    Get.lazyPut<UserService>(() => UserService());

    Get.put<EditProfileController>(EditProfileController());
    Get.lazyPut<DashboardController>(() => DashboardController());
  }
}
