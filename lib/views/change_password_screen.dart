import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/services/user_service.dart';
import 'package:pawang_mobile/views/dashboard_screen.dart';
import 'package:pawang_mobile/views/navigation_screen.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';
import 'package:pawang_mobile/widgets/input_field.dart';
import 'package:pawang_mobile/widgets/loading.dart';
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
  final formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  void _submit() {
    final form = formKey.currentState;

    if (form!.validate()) {
      form.save();
      var data = <String, dynamic>{
        "password_now": passwordNowTextController.text,
        "password_new": passwordNewTextController.text,
        "password_new_confirmation": passwordNewConfirmationTextController.text,
      };

      try {
        setState(() {
          _isLoading = true;
        });
        UserService().userChangePassword(data).then((response) {
          if (response.success) {
            setState(() {
              _isLoading = false;
            });
            Navigator.pushReplacementNamed(context, NavigationScreen.routeName);

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
            setState(() {
              _isLoading = false;
            });
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
      } catch (e) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _isLoading
            ? const Loading()
            : Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 32),
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
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          InputField(
                              validator:
                                  ValidationBuilder(localeName: 'id').build(),
                              inputLabel: 'Password Lama',
                              isPassword: true,
                              keyboardType: TextInputType.visiblePassword,
                              inputController: passwordNowTextController),
                          InputField(
                              validator:
                                  ValidationBuilder(localeName: 'id').build(),
                              inputLabel: 'Password Baru',
                              isPassword: true,
                              keyboardType: TextInputType.visiblePassword,
                              inputController: passwordNewTextController),
                          InputField(
                              validator:
                                  ValidationBuilder(localeName: 'id').build(),
                              inputLabel: 'Password Baru Konfirmasi',
                              isPassword: true,
                              keyboardType: TextInputType.visiblePassword,
                              inputController:
                                  passwordNewConfirmationTextController),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        kDefaultBorderRadius),
                                    gradient: const LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [kPrimary, kPurple])),
                                child: TextButton(
                                    style: ButtonStyle(
                                      padding: MaterialStateProperty.all(
                                        const EdgeInsets.symmetric(
                                            vertical: 15),
                                      ),
                                    ),
                                    onPressed: _submit,
                                    child: Text(
                                      "Simpan Perubahan",
                                      style: kOpenSans.copyWith(
                                        color: kWhite,
                                        fontSize: 16,
                                        fontWeight: bold,
                                      ),
                                    )),
                              ),
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
