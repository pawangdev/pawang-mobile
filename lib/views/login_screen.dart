import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/services/user_service.dart';
import 'package:pawang_mobile/views/dashboard_screen.dart';
import 'package:pawang_mobile/views/register_screen.dart';
import 'package:pawang_mobile/widgets/input_field.dart';
import 'package:pawang_mobile/views/landing_screen.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool _isObscure = true;

  void _submit() {
    final form = formKey.currentState;

    if (form!.validate()) {
      form.save();

      var data = <String, dynamic>{
        'email': emailTextController.text,
        'password': passwordTextController.text,
      };

      try {
        UserService().userLogin(data).then((response) {
          if (response.success == true) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              DashboardScreen.routeName,
              (route) => false,
            );

            Flushbar(
              message: "Berhasil Login !",
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
            Flushbar(
              message: StringUtils.capitalize(response.message, allWords: true)
                  .toString(),
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
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
                      IconBack(
                        blueMode: true,
                        onTap: () {
                          Navigator.pushNamed(context, LandingScreen.routeName);
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),
                  Text(
                    "Masuk dulu yuk!",
                    style: TextStyle(
                        //0.27.dp
                        fontWeight: bold,
                        fontSize: 20),
                  ),
                  SizedBox(height: 1.h),
                  Text(
                    "Kami sudah lama menantimu",
                    style: TextStyle(
                        //0.255.dp
                        fontWeight: medium,
                        fontSize: 16),
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 3.5.h,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                  height: 1.5.h,
                                ),
                                TextFormField(
                                  validator: ValidationBuilder(localeName: 'id')
                                      .minLength(8, 'Minimal 8 huruf')
                                      .build(),
                                  keyboardType: TextInputType.visiblePassword,
                                  controller: passwordTextController,
                                  decoration: InputDecoration(
                                      fillColor: const Color(0xFFF5F5F5),
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
                          "Masuk",
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
                    height: 3.5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Belum punya akun?",
                          style: kOpenSans.copyWith(
                              fontSize: 12,
                              //0.235.dp,
                              color: kBlack,
                              fontWeight: light)),
                      TextButton(
                          child: Text('Daftar',
                              style: kOpenSans.copyWith(
                                  fontSize: 12,
                                  color: kPrimary,
                                  fontWeight: bold)),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, RegisterScreen.routeName);
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
