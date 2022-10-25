import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/modules/landing/controllers/landing_controller.dart';
import 'package:pawang_mobile/routes/app_pages.dart';

class LandingView extends StatelessWidget {
  final LandingController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: Get.height * 0.6,
                decoration: const BoxDecoration(
                    color: defaultPrimary,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(64),
                        bottomLeft: Radius.circular(64)),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          defaultPrimary,
                          defaultPurple,
                          defaultPrimary
                        ])),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: Get.height * 0.025),
                    Container(
                      margin: EdgeInsets.only(top: Get.height * 0.04),
                      child: Image.asset(
                        'assets/images/logo_pawang.png',
                        color: defaultWhite.withOpacity(0.6),
                        width: Get.width * 0.4,
                        height: Get.height * 0.1,
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.028,
                    ),
                    Container(
                      width: Get.width * 0.8,
                      height: Get.height * 0.35,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage('assets/images/girl_boy_landing.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.025,
              ),
              Column(children: [
                Text(
                  "Selamat Datang",
                  style: kOpenSans.copyWith(
                      //0.30.dp
                      fontSize: 20,
                      fontWeight: bold,
                      color: defaultBlack),
                ),
                SizedBox(
                  height: Get.height * 0.08,
                ),
                Text(
                  "Mengatur keuanganmu sekarang menjadi\nlebih mudah dan menyenangkan!\nMasuk sekarang, yuk!",
                  style: kOpenSans.copyWith(
                      fontSize: 16, fontWeight: medium, color: defaultGray),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: Get.height * 0.034,
                ),
              ]),
              SizedBox(
                width: Get.width * 0.74,
                height: Get.height * 0.12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: const LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [defaultPrimary, defaultPurple])),
                        child: TextButton(
                          onPressed: () {
                            Get.toNamed(RoutesName.login);
                          },
                          child: Text(
                            "Masuk",
                            style: kOpenSans.copyWith(
                                color: defaultWhite,
                                fontSize: 14,
                                fontWeight: semiBold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: Get.width * 0.02),
                    Expanded(
                      child: OutlinedButton(
                        child: Text(
                          "Daftar",
                          style: kOpenSans.copyWith(
                              fontSize: 14,
                              fontWeight: semiBold,
                              color: defaultPrimary),
                        ),
                        onPressed: () {
                          Get.toNamed(RoutesName.register);
                        },
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          side: const BorderSide(color: defaultPrimary),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
