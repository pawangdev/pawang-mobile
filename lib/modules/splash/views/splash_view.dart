import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/modules/splash/controllers/splash_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashView extends StatelessWidget {
  SplashView({Key? key}) : super(key: key);
  final controller = Get.find<SplashController>();

  // checkToken() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final token = prefs.getString("token");

  //   if (token != null) {
  //     Navigator.pushNamedAndRemoveUntil(
  //       context,
  //       NavigationScreen.routeName,
  //       (route) => false,
  //     );
  //   } else {
  //     Navigator.pushNamedAndRemoveUntil(
  //       context,
  //       LandingScreen.routeName,
  //       (route) => false,
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [kPrimary, kPurple])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Center(
              child: SizedBox(
                  width: 35.w,
                  height: 35.w,
                  child: Image.asset('assets/images/splash.png')),
            ),
            Positioned.fill(
                child: Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Text(
                  'Pawang version v.2.0.1',
                  style: kOpenSans.copyWith(
                    fontSize: 14,
                    color: kWhite.withOpacity(0.75),
                    fontWeight: semibold,
                  ),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
