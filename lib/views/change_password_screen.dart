import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/services/user_service.dart';
import 'package:pawang_mobile/views/dashboard_screen.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';
import 'package:pawang_mobile/widgets/input_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChangePasswordScreen extends StatefulWidget {
  static const String routeName = '/change-password';
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController passwordNowTextController =
      TextEditingController();
  final TextEditingController passwordNewTextController =
      TextEditingController();
  final TextEditingController passwordNewConfirmationTextController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 32),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconBack(
                      blueMode: true,
                      onTap: () {
                        Navigator.pop(context);
                      }),
                  Text(
                    "Ganti Password",
                    style: kOpenSans.copyWith(
                        fontSize: 16, fontWeight: bold, color: kBlack),
                  ),
                  SizedBox(
                    width: 7.2.w,
                  )
                ],
              ),
              SizedBox(
                height: 4.4.h,
              ),
              InputField(
                  inputLabel: 'Password Lama',
                  isPassword: true,
                  keyboardType: TextInputType.visiblePassword,
                  inputController: passwordNowTextController),
              InputField(
                  inputLabel: 'Password Baru',
                  isPassword: true,
                  keyboardType: TextInputType.visiblePassword,
                  inputController: passwordNewTextController),
              InputField(
                  inputLabel: 'Password Baru Konfirmasi',
                  isPassword: true,
                  keyboardType: TextInputType.visiblePassword,
                  inputController: passwordNewConfirmationTextController),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(vertical: 15),
                              ),
                              backgroundColor:
                                  MaterialStateProperty.all(kPrimary),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      kDefaultBorderRadius),
                                ),
                              ),
                            ),
                            onPressed: () {
                              var data = <String, dynamic>{
                                "password_now": passwordNowTextController.text,
                                "password_new": passwordNewTextController.text,
                                "password_new_confirmation":
                                    passwordNewConfirmationTextController.text,
                              };

                              UserService()
                                  .userChangePassword(data)
                                  .then((response) {
                                if (response.success) {
                                  Navigator.pushReplacementNamed(
                                      context, DashboardScreen.routeName);

                                  Flushbar(
                                    message: "Berhasil Ganti Password !",
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
                                    message: response.message,
                                    icon: const Icon(
                                      Icons.check,
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
                            },
                            child: Text(
                              "Ganti Password",
                              style: kOpenSans.copyWith(
                                fontSize: 16,
                                fontWeight: bold,
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
