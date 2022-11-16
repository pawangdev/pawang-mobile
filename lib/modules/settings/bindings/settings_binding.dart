import 'package:get/get.dart';
import 'package:pawang_mobile/modules/dashboard/dashboard.dart';
import 'package:pawang_mobile/modules/settings/settings.dart';
import 'package:pawang_mobile/services/user_service.dart';

class SettingsBinding implements Bindings {
  @override
  void dependencies() {
    // Services
    Get.lazyPut<UserService>(() => UserService());

    // Controller
    Get.put<SettingsController>(SettingsController());
    Get.lazyPut<DashboardController>(() => DashboardController());
  }
}
