import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/modules/splash/controllers/splash_controller.dart';

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
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            height: Get.height,
            width: Get.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [defaultPrimary, defaultPurple, defaultPrimary]),
            ),
          ),
          Center(
            child: SizedBox(
                width: Get.width * 0.40,
                height: Get.height * 0.35,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 10.0),
                      child: Image.asset('assets/images/splash.png'),
                    ),
                    Text(
                      'PAWANG',
                      style: kInter.copyWith(
                          fontSize: 30,
                          fontWeight: extraBold,
                          color: defaultWhite),
                    ),
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        'P e n c a t a t   K e u a n g a n',
                        style: kInter.copyWith(
                            fontSize: 14,
                            fontWeight: bold,
                            color: defaultWhite),
                      ),
                    )
                  ],
                )),
          ),
          Positioned(
            child: Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Text(
                  'Pawang version ${controller.version}',
                  style: kInter.copyWith(
                    color: defaultWhite.withOpacity(0.75),
                    fontWeight: semiBold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
