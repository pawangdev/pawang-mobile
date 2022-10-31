import 'package:get/get.dart';
import 'package:pawang_mobile/routes/app_pages.dart';
import 'package:pawang_mobile/utils/storage.dart';

class SplashController extends GetxController {
  final version = '4.1.0';

  @override
  void onInit() {
    checkToken();
    super.onInit();
  }

  Future<void> checkToken() async {
    await Future.delayed(
      const Duration(seconds: 3),
      () {},
    );
    if (Storage.getValue("is_first_open") == true) {
      Storage.hasData('token')
          ? Get.offAllNamed(RoutesName.navigation)
          : Get.offAllNamed(RoutesName.login);
    } else {
      print(Storage.getValue("is_first_open"));
      Get.offAllNamed(RoutesName.onboarding);
    }
  }
}
