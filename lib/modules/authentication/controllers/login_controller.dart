import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:pawang_mobile/constants/strings.dart';
import 'package:pawang_mobile/routes/routes.dart';
import 'package:pawang_mobile/services/user_service.dart';
import 'package:pawang_mobile/utils/storage.dart';

class LoginController extends GetxController {
  // Services
  final userService = Get.put(UserService());

  final formKey = GlobalKey<FormState>();

  Future<void> formValdidate() async {
    formKey.currentState?.validate();
  }

  GoogleSignInAccount? _googleUser;

  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final isObsecure = true.obs;

  var isLoading = false;

  @override
  void onClose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    super.onClose();
  }

  Future<void> signInGoogle() async {
    try {
      EasyLoading.show(status: 'Mohon Tunggu');
      final status = await OneSignal.shared.getDeviceState();
      final String? osUserID = status?.userId;

      GoogleSignIn googleSignIn = GoogleSignIn();

      _googleUser = await googleSignIn.signIn();

      var input = <String, dynamic>{
        'email': _googleUser!.email,
        'google_id': _googleUser!.id,
        'name': _googleUser!.displayName,
        'image_profile': _googleUser!.photoUrl,
        'onesignal_id': osUserID
      };

      final loginResponse = await userService.userLoginWithGoogle(input);
      Storage.saveValue(storageToken, loginResponse!.accessToken)
          .then((value) => EasyLoading.dismiss());
      Get.snackbar(
          'Berhasil Masuk !', 'Selamat Datang ${loginResponse.user.name}',
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(20),
          colorText: Colors.white,
          icon: const Icon(
            Icons.check,
            color: Colors.white,
          ));
      Get.offAllNamed(RoutesName.navigation);
    } catch (e) {
      EasyLoading.dismiss();

      print(e);
    }
  }

  Future<void> login() async {
    try {
      EasyLoading.show(status: 'Mohon Tunggu'.tr);
      final status = await OneSignal.shared.getDeviceState();
      final String? osUserID = status?.userId;

      var input = <String, dynamic>{
        'email': emailTextController.text,
        'password': passwordTextController.text,
        'onesignal_id': osUserID
      };

      final loginResponse = await userService.userLogin(input);

      Storage.saveValue(storageToken, loginResponse!.accessToken)
          .then((value) => EasyLoading.dismiss());
      Get.snackbar(
        'Berhasil Masuk !'.tr,
        // ignore: unnecessary_string_interpolations
        'Selamat Datang '.tr + '${loginResponse.user.name}',
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(20),
        backgroundColor: Colors.green,
        colorText: Colors.white,
        icon: const Icon(
          Icons.check,
          color: Colors.white,
        ),
      );
      Get.offAllNamed(RoutesName.navigation);
    } catch (e) {
      EasyLoading.dismiss();

      Get.snackbar(
        'Gagal Masuk !'.tr,
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(20),
        icon: const Icon(
          Icons.cancel,
          color: Colors.white,
        ),
      );
    }
  }
}
