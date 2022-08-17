import 'package:get/get.dart';
import 'package:pawang_mobile/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    splashToNavigation();
    super.onInit();
  }

  Future<void> splashToNavigation() async {
    await Future.delayed(
      const Duration(seconds: 3),
      () {},
    );
    Get.offAllNamed(RoutesName.landing);
  }
}
