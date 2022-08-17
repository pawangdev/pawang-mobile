import 'package:get/get.dart';
import 'package:pawang_mobile/modules/authentication/bindings/login_binding.dart';
import 'package:pawang_mobile/modules/authentication/bindings/register_binding.dart';
import 'package:pawang_mobile/modules/authentication/views/login_view.dart';
import 'package:pawang_mobile/modules/authentication/views/register_view.dart';
import 'package:pawang_mobile/modules/splash/bindings/splash_binding.dart';
import 'package:pawang_mobile/modules/splash/views/splash_view.dart';

part './app_routes.dart';

class AppPages {
  static const INITIAL = RoutesName.splash;

  static final pages = [
    GetPage(
        name: RoutesName.splash,
        page: () => SplashView(),
        binding: SplashBinding()),
    GetPage(
        name: RoutesName.register,
        page: () => RegisterView(),
        binding: RegisterBinding()),
    GetPage(
        name: RoutesName.login,
        page: () => LoginView(),
        binding: LoginBinding()),
  ];
}
