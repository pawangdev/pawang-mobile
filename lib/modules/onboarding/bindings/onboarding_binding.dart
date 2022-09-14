import 'package:get/get.dart';
import 'package:pawang_mobile/modules/onboarding/controllers/onboarding_controllers.dart';

class OnboardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<OnboardingController>(OnboardingController());
  }
}
