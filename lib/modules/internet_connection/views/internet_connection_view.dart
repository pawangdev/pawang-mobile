import 'package:flutter/material.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:get/get.dart';

class InternetConnectionView extends StatelessWidget {
  const InternetConnectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 32, right: 32),
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.154,
              ),
              Center(
                child: Text(
                  "Oops !!",
                  style: kInter.copyWith(
                      color: defaultBlack, fontWeight: bold, fontSize: 20),
                ),
              ),
              SizedBox(
                height: Get.height * 0.036,
              ),
              Container(
                width: Get.width * 0.4,
                height: Get.height * 0.155,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/no_connection.png'),
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.036,
              ),
              Text(
                "No Internet Connection",
                style: kInter.copyWith(
                    color: defaultBlack, fontSize: 16, fontWeight: bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: Get.height * 0.032,
              ),
              Text(
                "Kamu kehilangan koneksi internet. Silahkan periksa kembali koneksi internet.",
                style: kInter.copyWith(
                    color: defaultGray, fontSize: 12, fontWeight: medium),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: Get.height * 0.036,
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
                      style: kInter.copyWith(
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
