import 'package:flutter/material.dart';
import 'package:pawang_mobile/config/theme_constants.dart';

class LandingScreen extends StatelessWidget {
  static const String routeName = '/';
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.65,
              decoration: BoxDecoration(
                  color: kPurple,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(64),
                      bottomLeft: Radius.circular(64))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 40),
                      width: MediaQuery.of(context).size.width * 300 / 375,
                      height: 300,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/girl_boy_landing.png'),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    "Selamat Datang",
                    style: kOpenSans.copyWith(
                        fontSize: 28, fontWeight: bold, color: kBlack),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Mengatur keuanganmu sekarang menjadi\nlebih mudah dan menyenangkan!\nMasuk sekarang, yuk!",
                    style: kOpenSans.copyWith(fontSize: 16, color: kBlack),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 116,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.pushNamed(context, RiwayatPage.routeName)
                      },
                      child: Text(
                        "Masuk",
                        style:
                            kOpenSans.copyWith(fontSize: 16, fontWeight: bold),
                      ),
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(116, 40)),
                        backgroundColor: MaterialStateProperty.all(kPurple),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
