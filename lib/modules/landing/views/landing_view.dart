import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/modules/landing/controllers/landing_controller.dart';
import 'package:pawang_mobile/routes/app_pages.dart';
import 'package:pawang_mobile/widgets/button_custom.dart';

class LandingView extends StatelessWidget {
  final LandingController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: Get.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: Get.width,
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/pawang_wallet.png',
                          ),
                          SizedBox(
                            width: Get.width * 0.02,
                          ),
                          Column(
                            children: [
                              Text(
                                'PAWANG',
                                style: kOpenSans.copyWith(
                                    fontSize: 22,
                                    fontWeight: bold,
                                    color: defaultWhite.withOpacity(0.6)),
                              ),
                              Text(
                                'Pencatat  Keuangan',
                                style: kOpenSans.copyWith(
                                    fontSize: 10,
                                    fontWeight: semiBold,
                                    color: defaultWhite.withOpacity(0.6)),
                              )
                            ],
                          )
                        ],
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
                      fontSize: 18, fontWeight: bold, color: defaultBlack),
                ),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                Text(
                  "Mengatur keuanganmu sekarang menjadi\nlebih mudah dan menyenangkan!\nMasuk sekarang, yuk!",
                  style: kOpenSans.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: defaultBlack),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: Get.height * 0.025,
                ),
              ]),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ButtonCustom(
                        text: 'Masuk',
                        onTap: () {
                          Get.toNamed(RoutesName.login);
                        },
                      ),
                    ),
                    SizedBox(width: Get.width * 0.02),
                    Expanded(
                      child: ButtonCustom(
                        text: 'Daftar',
                        elevatedMode: false,
                        onTap: () {
                          Get.toNamed(RoutesName.register);
                        },
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
