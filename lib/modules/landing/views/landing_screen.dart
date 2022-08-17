import 'package:flutter/material.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LandingView extends StatelessWidget {
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
                height: 60.h,
                decoration: const BoxDecoration(
                    color: kPrimary,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(64),
                        bottomLeft: Radius.circular(64)),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [kPrimary, kPurple, kPrimary])),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 2.5.h),
                    Container(
                      margin: EdgeInsets.only(top: 4.h),
                      child: Image.asset(
                        'assets/images/logo_pawang.png',
                        color: kWhite.withOpacity(0.6),
                        width: 40.w,
                        height: 10.h,
                      ),
                    ),
                    SizedBox(
                      height: 2.8.h,
                    ),
                    Container(
                      width: 80.w,
                      height: 35.h,
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
                height: 0.25.h,
              ),
              Column(children: [
                Text(
                  "Selamat Datang",
                  style: kOpenSans.copyWith(
                      //0.30.dp
                      fontSize: 20,
                      fontWeight: bold,
                      color: kBlack),
                ),
                SizedBox(
                  height: 0.8.h,
                ),
                Text(
                  "Mengatur keuanganmu sekarang menjadi\nlebih mudah dan menyenangkan!\nMasuk sekarang, yuk!",
                  style: kOpenSans.copyWith(
                      fontSize: 16, fontWeight: medium, color: kGray),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 3.4.h,
                ),
              ]),
              SizedBox(
                width: 75.w,
                height: 12.h,
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
                                colors: [kPrimary, kPurple])),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Masuk",
                            style: kOpenSans.copyWith(
                                color: kWhite,
                                fontSize: 14,
                                fontWeight: semibold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 2.w),
                    Expanded(
                      child: OutlinedButton(
                        child: Text(
                          "Daftar",
                          style: kOpenSans.copyWith(
                              fontSize: 14,
                              fontWeight: semibold,
                              color: kPrimary),
                        ),
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          side: const BorderSide(color: kPrimary),
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
