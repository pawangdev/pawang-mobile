import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/views/landing_screen.dart';

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
    Timer(Duration(seconds: 3), () {
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
            child: Container(
                width: 170,
                height: 170,
                child: Image.asset('assets/images/splash.png')),
          ),
          Positioned.fill(
              child: Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                'v.1.0.0',
                style: kOpenSans.copyWith(
                    color: kWhite.withOpacity(0.75),
                    fontWeight: semibold,
                    fontSize: 16),
              ),
            ),
          )),
        ],
      ),
    );
  }
}
