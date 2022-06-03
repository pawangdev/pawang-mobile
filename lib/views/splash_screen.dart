import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/views/landing_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "/";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        LandingScreen.routeName,
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
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
                'Pawang version v.1.0.0',
                style: kOpenSans.copyWith(
                  color: kWhite.withOpacity(0.75),
                  fontWeight: semibold,
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }
}
