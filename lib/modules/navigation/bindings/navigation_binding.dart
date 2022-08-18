import 'package:get/get.dart';
import 'package:pawang_mobile/modules/dashboard/dashboard.dart';
import 'package:pawang_mobile/modules/navigation/controllers/navigation_controller.dart';
import 'package:pawang_mobile/modules/scan_receipe/scan_receipe.dart';
import 'package:pawang_mobile/modules/settings/settings.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationController>(() => NavigationController());
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<ScanReceipeController>(() => ScanReceipeController());
    Get.lazyPut<SettingsController>(() => SettingsController());
  }
}
