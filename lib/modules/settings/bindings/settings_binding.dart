import 'package:get/get.dart';
import 'package:pawang_mobile/modules/dashboard/dashboard.dart';
import 'package:pawang_mobile/modules/settings/settings.dart';

class SettingsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SettingsController>(SettingsController());
    Get.lazyPut<DashboardController>(() => DashboardController());
  }
}
