import 'package:flutter/material.dart';
import 'package:pawang_mobile/constants/theme.dart';

class ConnectionScreen extends StatefulWidget {
  static const String routeName = "/connection-check";
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
              const SizedBox(
                height: 150,
              ),
              Center(
                child: Text(
                  "Oops !!",
                  style: kOpenSans.copyWith(
                      color: kBlack, fontWeight: bold, fontSize: 24),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.800,
                height: MediaQuery.of(context).size.height * 0.150,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/no_connection.png'),
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Container(
                child: Text(
                  "No Internet Connection",
                  style: kOpenSans.copyWith(
                      color: kBlack, fontSize: 20, fontWeight: bold),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              Container(
                child: Text(
                  "Kamu kehilangan koneksi internet. Silahkan periksa kembali koneksi internet.",
                  style: kOpenSans.copyWith(
                      color: kGray, fontSize: 14, fontWeight: medium),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 32),
                child: ElevatedButton(
                    child: Text(
                      "Coba Lagi",
                      style: kOpenSans.copyWith(
                          fontSize: 16, fontWeight: bold, color: kWhite),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(kPrimary),
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(18)),
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
