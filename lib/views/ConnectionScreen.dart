import 'package:flutter/material.dart';
import 'package:pawang_mobile/config/theme_constants.dart';

class ConnectionScreen extends StatefulWidget {
  ConnectionScreen({Key? key}) : super(key: key);

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
              Center(
                child: Text(
                  "Riwayat",
                  style: kOpenSans.copyWith(
                      color: kBlack, fontWeight: bold, fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 40),
                  width: MediaQuery.of(context).size.width * 90 / 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/no-connection.png'),
                    ),
                  ),
                ),
              ),
              Container(
                child: Text(
                  "Ooops, No Internet Connection",
                  style: kOpenSans.copyWith(
                      color: kBlack, fontSize: 20, fontWeight: bold),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              Expanded(
                child: Container(
                  child: Text(
                    "Kamu kehilangan koneksi internet. Silahkan coba beberapa saat lagi.",
                    style: kOpenSans.copyWith(
                        color: kGray, fontSize: 14, fontWeight: medium),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 12),
                child: ElevatedButton(
                    child: Text(
                      "Try Again",
                      style: kOpenSans.copyWith(
                          fontSize: 16, fontWeight: bold, color: kWhite),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(kPurple),
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(14)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)))),
                    onPressed: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
