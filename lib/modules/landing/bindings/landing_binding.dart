import 'package:get/get.dart';
import 'package:pawang_mobile/modules/landing/controllers/landing_controller.dart';

class LandingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LandingController>(LandingController());
  }
}
