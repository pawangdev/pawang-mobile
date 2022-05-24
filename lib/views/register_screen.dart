import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pawang_mobile/config/theme_constants.dart';
import 'package:pawang_mobile/views/dashboard_screen.dart';
import 'package:pawang_mobile/views/login_screen.dart';
import 'package:pawang_mobile/views/splash_screen.dart';
import 'package:pawang_mobile/widgets/InputField.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawang_mobile/views/landing_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = '/register';
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController Nama = TextEditingController();
  final TextEditingController Email = TextEditingController();
  final TextEditingController Password = TextEditingController();
  final TextEditingController rePassword = TextEditingController();
  bool _isObscure = true;

  @override
  Widget build(BuildContext) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, left: 32, right: 32),
            child: Center(
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        child: Container(
                          width: 32,
                          height: 32,
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            border: Border.all(color: kPrimary),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: SvgPicture.asset(
                            'assets/images/back_btn.svg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, LandingScreen.routeName);
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Buat Akun",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  SizedBox(height: 30),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: InputField(
                      inputLabel: "Nama Lengkap",
                      inputController: Nama,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: InputField(
                      inputLabel: "Email",
                      inputController: Email,
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Password',
                            style: kOpenSans.copyWith(
                                fontWeight: bold, color: kBlack),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            decoration: InputDecoration(
                                fillColor: Color(0xFFF5F5F5),
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        kDefaultBorderRadius),
                                    borderSide: BorderSide.none),
                                focusColor: kPrimary,
                                suffixIcon: IconButton(
                                    color: kGray,
                                    icon: Icon(_isObscure
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                    onPressed: () {
                                      setState(() {
                                        _isObscure = !_isObscure;
                                      });
                                    })),
                            autofocus: false,
                            obscureText: _isObscure,
                          ),
                        ],
                      )),
                  Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Konfirmasi Password',
                            style: kOpenSans.copyWith(
                                fontWeight: bold, color: kBlack),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            decoration: InputDecoration(
                                fillColor: Color(0xFFF5F5F5),
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        kDefaultBorderRadius),
                                    borderSide: BorderSide.none),
                                focusColor: kPrimary,
                                suffixIcon: IconButton(
                                    color: kGray,
                                    icon: Icon(_isObscure
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                    onPressed: () {
                                      setState(() {
                                        _isObscure = !_isObscure;
                                      });
                                    })),
                            autofocus: false,
                            obscureText: _isObscure,
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Daftar",
                        style:
                            kOpenSans.copyWith(fontSize: 16, fontWeight: bold),
                      ),
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(100, 50)),
                        backgroundColor: MaterialStateProperty.all(kPrimary),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Sudah punya akun? "),
                      TextButton(
                          child: Text('Masuk',
                              style: kOpenSans.copyWith(
                                  color: kPrimary, fontWeight: bold)),
                          onPressed: () {
                            Navigator.pushNamed(context, LoginScreen.routeName);
                          }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
