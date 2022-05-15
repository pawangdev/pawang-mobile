import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:pawang_mobile/config/theme_constants.dart';
import 'package:pawang_mobile/views/dashboard_screen.dart';
import 'package:pawang_mobile/views/register_screen.dart';
import 'package:pawang_mobile/widgets/InputField.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawang_mobile/views/landing_screen.dart';
import 'package:pawang_mobile/views/riwayat_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController Email = TextEditingController();
  final TextEditingController Password = TextEditingController();
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
                            border: Border.all(color: kPurple),
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
                    "Masuk dulu yuk!",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Kami sudah lama menantimu",
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: InputField(
                      inputLabel: "Your Email",
                      inputController: Email,
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your Password',
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
                                focusColor: kPurple,
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
                      onPressed: () {
                        Navigator.pushNamed(context, DashboardScreen.routeName);
                      },
                      child: Text(
                        "Masuk",
                        style:
                            kOpenSans.copyWith(fontSize: 16, fontWeight: bold),
                      ),
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(100, 50)),
                        backgroundColor: MaterialStateProperty.all(kPurple),
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
                      Text("Belum punya akun? "),
                      TextButton(
                          child: Text('Daftar',
                              style: kOpenSans.copyWith(
                                  color: kPurple, fontWeight: bold)),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, RegisterScreen.routeName);
                          }),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    width: 280,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Divider(
                            color: kBlack,
                            height: 1.5,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "OR",
                            style: TextStyle(
                              color: kGray,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: kBlack,
                            height: 1.5,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: kWhite,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0.5,
                            blurRadius: 1,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Center(
                        child: Wrap(children: [
                          Image.asset('assets/images/google.png')
                        ]),
                      ),
                    ),
                    onTap: () {},
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
