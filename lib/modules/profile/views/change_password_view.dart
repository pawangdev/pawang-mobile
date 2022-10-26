import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/modules/profile/controllers/change_password_controller.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';
import 'package:pawang_mobile/widgets/input_field.dart';

class ChangePasswordView extends StatelessWidget {
  final ChangePasswordController controller = Get.find();

  // void _submit() {
  //   final form = formKey.currentState;

  //   if (form!.validate()) {
  //     form.save();
  //     var data = <String, dynamic>{
  //       "password_now": passwordNowTextController.text,
  //       "password_new": passwordNewTextController.text,
  //       "password_new_confirmation": passwordNewConfirmationTextController.text,
  //     };

  //     try {
  //       setState(() {
  //         _isLoading = true;
  //       });
  //       UserService().userChangePassword(data).then((response) {
  //         if (response.success) {
  //           setState(() {
  //             _isLoading = false;
  //           });
  //           Navigator.pushReplacementNamed(context, NavigationScreen.routeName);

  //           Flushbar(
  //             message: "Berhasil Ganti Password !",
  //             icon: const Icon(
  //               Icons.check,
  //               size: 28.0,
  //               color: Colors.white,
  //             ),
  //             margin: const EdgeInsets.all(8),
  //             borderRadius: BorderRadius.circular(8),
  //             backgroundColor: defaultSuccess,
  //             duration: const Duration(seconds: 3),
  //           ).show(context);
  //         } else {
  //           setState(() {
  //             _isLoading = false;
  //           });
  //           Flushbar(
  //             message: response.message,
  //             icon: const Icon(
  //               Icons.check,
  //               size: 28.0,
  //               color: Colors.white,
  //             ),
  //             margin: const EdgeInsets.all(8),
  //             borderRadius: BorderRadius.circular(8),
  //             backgroundColor: defaultError,
  //             duration: const Duration(seconds: 3),
  //           ).show(context);
  //         }
  //       });
  //     } catch (e) {
  //       setState(() {
  //         _isLoading = false;
  //       });
  //     }
  //   }
  // }

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
                        fontSize: 16, fontWeight: bold, color: defaultBlack),
                  ),
                  SizedBox(
                    width: Get.width * 0.072,
                  )
                ],
              ),
              SizedBox(height: Get.height * 0.045),
              Form(
                key: Key('change-password'),
                child: Column(
                  children: [
                    InputField(
                        validator: ValidationBuilder(localeName: 'id').build(),
                        inputLabel: 'Password Lama',
                        isPassword: true,
                        keyboardType: TextInputType.visiblePassword,
                        inputController: controller.passwordNowTextController),
                    const SizedBox(
                      height: 5,
                    ),
                    InputField(
                        validator: ValidationBuilder(localeName: 'id').build(),
                        inputLabel: 'Password Baru',
                        isPassword: true,
                        keyboardType: TextInputType.visiblePassword,
                        inputController: controller.passwordNewTextController),
                    const SizedBox(
                      height: 5,
                    ),
                    InputField(
                        validator: ValidationBuilder(localeName: 'id').build(),
                        inputLabel: 'Password Baru Konfirmasi',
                        isPassword: true,
                        keyboardType: TextInputType.visiblePassword,
                        inputController:
                            controller.passwordNewConfirmationTextController),
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
                        width: Get.width,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(defaultBorderRadius),
                              gradient: const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [defaultPrimary, defaultPurple])),
                          child: TextButton(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(vertical: 15),
                              ),
                            ),
                            onPressed: () => controller.updatePassword(),
                            child: Text(
                              "Simpan Perubahan",
                              style: kOpenSans.copyWith(
                                color: defaultWhite,
                                fontSize: 16,
                                fontWeight: bold,
                              ),
                            ),
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
      ),
    );
  }
}
