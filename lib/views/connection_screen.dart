import 'package:flutter/material.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ConnectionScreen extends StatefulWidget {
  static const String routeName = "/connection-check";
  const ConnectionScreen({Key? key}) : super(key: key);

  @override
  State<ConnectionScreen> createState() => _ConnectionScreenState();
}

class _ConnectionScreenState extends State<ConnectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 32, right: 32),
          child: Column(
            children: [
              SizedBox(
                height: 15.4.h,
              ),
              Center(
                child: Text(
                  "Oops !!",
                  style: kOpenSans.copyWith(
                      color: defaultBlack, fontWeight: bold, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 3.6.h,
              ),
              Container(
                width: 40.w,
                height: 15.5.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/no_connection.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 3.6.h,
              ),
              Text(
                "No Internet Connection",
                style: kOpenSans.copyWith(
                    color: defaultBlack, fontSize: 16, fontWeight: bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 3.2.h,
              ),
              Text(
                "Kamu kehilangan koneksi internet. Silahkan periksa kembali koneksi internet.",
                style: kOpenSans.copyWith(
                    color: defaultGray, fontSize: 12, fontWeight: medium),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 3.6.h,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(defaultBorderRadius),
                    gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [defaultPrimary, defaultPurple])),
                child: TextButton(
                    child: Text(
                      "Coba Lagi",
                      style: kOpenSans.copyWith(
                          fontSize: 16, fontWeight: bold, color: defaultWhite),
                    ),
                    style: ButtonStyle(
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(16)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(defaultBorderRadius)))),
                    onPressed: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
