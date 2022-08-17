import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/services/user_service.dart';
import 'package:pawang_mobile/views/login_screen.dart';
import 'package:pawang_mobile/widgets/input_field.dart';
import 'package:pawang_mobile/views/landing_screen.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';
import 'package:pawang_mobile/widgets/loading.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = '/register';
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController namaTextController = TextEditingController();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController phoneTextController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? genderTextController;

  bool _isObscure = true;
  bool _isLoading = false;

  void _submit() {
    final form = formKey.currentState;

    if (form!.validate()) {
      form.save();

      var data = <String, dynamic>{
        'name': namaTextController.text,
        'email': emailTextController.text,
        'password': passwordTextController.text,
        'phone': phoneTextController.text,
        'gender': genderTextController,
      };

      try {
        setState(() {
          _isLoading = true;
        });
        UserService().userRegister(data).then((res) {
          if (res == true) {
            setState(() {
              _isLoading = false;
            });
            Navigator.pushReplacementNamed(context, LoginScreen.routeName);

            Flushbar(
              message: "Berhasil Mendaftarkan Akun, Silahkan Login !",
              icon: const Icon(
                Icons.check,
                size: 28.0,
                color: Colors.white,
              ),
              margin: const EdgeInsets.all(8),
              borderRadius: BorderRadius.circular(8),
              backgroundColor: kSuccess,
              duration: const Duration(seconds: 3),
            ).show(context);
          } else {
            setState(() {
              _isLoading = false;
            });
            Flushbar(
              message: "Terdapat Kesalahan !",
              icon: const Icon(
                Icons.clear_rounded,
                size: 28.0,
                color: Colors.white,
              ),
              margin: const EdgeInsets.all(8),
              borderRadius: BorderRadius.circular(8),
              backgroundColor: kError,
              duration: const Duration(seconds: 3),
            ).show(context);
          }
        });
      } catch (e) {
        setState(() {
          _isLoading = false;
        });
        Flushbar(
          message: "Terdapat Kesalahan !",
          icon: const Icon(
            Icons.clear_rounded,
            size: 28.0,
            color: Colors.white,
          ),
          margin: const EdgeInsets.all(8),
          borderRadius: BorderRadius.circular(8),
          backgroundColor: kError,
          duration: const Duration(seconds: 3),
        ).show(context);
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _isLoading
            ? const Loading()
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, left: 32, right: 32),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconBack(
                              blueMode: true,
                              onTap: () {
                                Navigator.pushNamed(
                                    context, LandingScreen.routeName);
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.5.h,
                        ),
                        const Text(
                          "Buat Akun",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20
                              //0.27.dp
                              ),
                        ),
                        Form(
                          key: formKey,
                          child: Column(
                            children: [
                              SizedBox(height: 3.5.h),
                              Container(
                                margin: const EdgeInsets.only(bottom: 20),
                                child: InputField(
                                  validator: ValidationBuilder(localeName: 'id')
                                      .build(),
                                  inputLabel: "Nama Lengkap",
                                  inputController: namaTextController,
                                  keyboardType: TextInputType.name,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(bottom: 20),
                                child: InputField(
                                  validator: ValidationBuilder(localeName: 'id')
                                      .email('Isi dengan format email')
                                      .build(),
                                  inputLabel: "Email",
                                  capitalization: TextCapitalization.none,
                                  inputController: emailTextController,
                                  keyboardType: TextInputType.emailAddress,
                                ),
                              ),
                              Container(
                                  margin: const EdgeInsets.only(bottom: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Password',
                                        style: kOpenSans.copyWith(
                                            fontSize: 12,
                                            // 0.21.dp,
                                            fontWeight: bold,
                                            color: kBlack),
                                      ),
                                      SizedBox(
                                        height: 1.4.h,
                                      ),
                                      TextFormField(
                                        validator:
                                            ValidationBuilder(localeName: 'id')
                                                .minLength(8, 'Minimal 8 huruf')
                                                .build(),
                                        controller: passwordTextController,
                                        decoration: InputDecoration(
                                            fillColor: const Color(0xFFF5F5F5),
                                            filled: true,
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
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
                                margin: const EdgeInsets.only(bottom: 20),
                                child: InputField(
                                  validator: ValidationBuilder(localeName: 'id')
                                      .phone('Isi dengan format nomer telepon')
                                      .build(),
                                  inputLabel: "Nomer Telepon",
                                  inputController: phoneTextController,
                                  keyboardType: TextInputType.phone,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(bottom: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Jenis Kelamin",
                                      style: kOpenSans.copyWith(
                                          fontSize: 12,
                                          // 0.21.dp,
                                          fontWeight: bold,
                                          color: kBlack),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Radio(
                                                value: "male",
                                                groupValue:
                                                    genderTextController,
                                                onChanged: (value) {
                                                  setState(() {
                                                    genderTextController =
                                                        value as String;
                                                  });
                                                }),
                                            Text(
                                              "Laki-Laki",
                                              style: kOpenSans.copyWith(
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 2.5.w,
                                        ),
                                        Row(
                                          children: [
                                            Radio(
                                                value: "female",
                                                groupValue:
                                                    genderTextController,
                                                onChanged: (value) {
                                                  setState(() {
                                                    genderTextController =
                                                        value as String;
                                                  });
                                                }),
                                            Text(
                                              "Perempuan",
                                              style: kOpenSans.copyWith(
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 3.5.h,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(kDefaultBorderRadius),
                                gradient: const LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [kPrimary, kPurple])),
                            child: TextButton(
                              onPressed: _submit,
                              child: Text(
                                "Daftar",
                                style: kOpenSans.copyWith(
                                    color: kWhite,
                                    fontSize: 16,
                                    //0.25.dp,
                                    fontWeight: bold),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 3.4.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Sudah punya akun? ",
                                style: kOpenSans.copyWith(
                                    fontSize: 12,
                                    color: kBlack,
                                    fontWeight: light)),
                            TextButton(
                                child: Text('Masuk',
                                    style: kOpenSans.copyWith(
                                        fontSize: 12,
                                        color: kPrimary,
                                        fontWeight: bold)),
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, LoginScreen.routeName);
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
