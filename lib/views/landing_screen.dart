import 'package:flutter/material.dart';
import 'package:pawang_mobile/config/theme_constants.dart';
import 'package:pawang_mobile/views/login_screen.dart';
import 'package:pawang_mobile/views/register_screen.dart';

class LandingScreen extends StatelessWidget {
  static const String routeName = '/landing';
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widthApp = MediaQuery.of(context).size.width;
    final heightApp = MediaQuery.of(context).size.height;
    final paddingTop = MediaQuery.of(context).padding.top;
    final bodyHeight = heightApp - paddingTop;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: bodyHeight * 0.65,
              decoration: BoxDecoration(
                  color: kPrimary,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(64),
                      bottomLeft: Radius.circular(64)),
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [kPrimary, Colors.blue.withOpacity(0.8)])),
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
                          image:
                              AssetImage('assets/images/girl_boy_landing.png'),
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
                    width: 200,
                    height: 130,
                    child: Container(
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, LoginScreen.routeName);
                              },
                              child: Text(
                                "Masuk",
                                style: kOpenSans.copyWith(
                                    fontSize: 16, fontWeight: bold),
                              ),
                              style: ButtonStyle(
                                fixedSize:
                                    MaterialStateProperty.all(Size(100, 50)),
                                backgroundColor:
                                    MaterialStateProperty.all(kPrimary),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              child: Text(
                                "Daftar",
                                style: kOpenSans.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                    color: kPrimary),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, RegisterScreen.routeName);
                              },
                              style: OutlinedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                side: BorderSide(color: kPrimary),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
