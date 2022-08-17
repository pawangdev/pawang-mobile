import 'package:get/get.dart';
import 'package:pawang_mobile/routes/app_pages.dart';
import 'package:pawang_mobile/utils/storage.dart';

class SplashController extends GetxController {
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
    Storage.hasData('token')
        ? Get.offAllNamed(RoutesName.navigation)
        : Get.offAllNamed(RoutesName.landing);
  }
}
