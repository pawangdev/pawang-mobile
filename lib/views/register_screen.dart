import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/services/user_service.dart';
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
  final TextEditingController NamaTextController = TextEditingController();
  final TextEditingController EmailTextController = TextEditingController();
  final TextEditingController PasswordTextController = TextEditingController();
  final TextEditingController PhoneTextController = TextEditingController();
  String? genderTextController;

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
                      inputController: NamaTextController,
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: InputField(
                      inputLabel: "Email",
                      inputController: EmailTextController,
                      keyboardType: TextInputType.emailAddress,
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
                            controller: PasswordTextController,
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
                    child: InputField(
                      inputLabel: "Nomer Telepon",
                      inputController: PhoneTextController,
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Jenis Kelamin",
                          style: kOpenSans.copyWith(
                              fontWeight: bold, color: kBlack),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Radio(
                                    value: "male",
                                    groupValue: genderTextController,
                                    onChanged: (value) {
                                      setState(() {
                                        genderTextController = value as String;
                                      });
                                    }),
                                Text(
                                  "Laki-Laki",
                                  style: kOpenSans.copyWith(fontSize: 16),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Row(
                              children: [
                                Radio(
                                    value: "female",
                                    groupValue: genderTextController,
                                    onChanged: (value) {
                                      setState(() {
                                        genderTextController = value as String;
                                      });
                                    }),
                                Text(
                                  "Perempuan",
                                  style: kOpenSans.copyWith(fontSize: 16),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        var data = <String, dynamic>{
                          'name': NamaTextController.text,
                          'email': EmailTextController.text,
                          'password': PasswordTextController.text,
                          'phone': PhoneTextController.text,
                          'gender': genderTextController,
                        };

                        try {
                          UserService().userRegister(data);

                          Navigator.pushReplacementNamed(
                              context, LoginScreen.routeName);

                          Flushbar(
                            message:
                                "Berhasil Mendaftarkan Akun, Silahkan Login !",
                            icon: Icon(
                              Icons.check,
                              size: 28.0,
                              color: Colors.white,
                            ),
                            margin: EdgeInsets.all(8),
                            borderRadius: BorderRadius.circular(8),
                            backgroundColor: kSuccess,
                            duration: Duration(seconds: 3),
                          ).show(context);
                        } catch (e) {
                          print(e);
                        }
                      },
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
