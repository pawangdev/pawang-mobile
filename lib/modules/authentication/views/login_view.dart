import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/modules/authentication/controllers/login_controller.dart';
import 'package:pawang_mobile/routes/app_pages.dart';
import 'package:pawang_mobile/widgets/button_custom.dart';
import 'package:pawang_mobile/widgets/input_field.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            top: 70,
            child: Image.asset(
              'assets/images/blur.png',
              width: Get.width,
            ),
          ),
          // Positioned(
          //   top: 300,
          //   left: -250,
          //   child: Image.asset(
          //     'assets/images/blur.png',
          //     width: Get.width,
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 35),
            child: Center(
              child: Column(
                children: <Widget>[
                  Text(
                    "Masuk dulu yuk!",
                    style: kOpenSans.copyWith(
                        fontWeight: bold, fontSize: 18, color: defaultBlack),
                  ),
                  SizedBox(height: Get.height * 0.01),
                  Text(
                    "Kami sudah lama menantimu",
                    style:
                        kOpenSans.copyWith(fontWeight: regular, fontSize: 16),
                  ),
                  SizedBox(
                    height: Get.height * 0.045,
                  ),
                  Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        InputField(
                          validator: ValidationBuilder(localeName: 'id')
                              .required()
                              .email()
                              .build(),
                          inputLabel: "Email",
                          capitalization: TextCapitalization.none,
                          inputController: controller.emailTextController,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: Get.height * 0.035),
                        Obx(
                          () => TextFormField(
                            textInputAction: TextInputAction.done,
                            validator: ValidationBuilder(localeName: 'id')
                                .required()
                                .minLength(8)
                                .build(),
                            keyboardType: TextInputType.visiblePassword,
                            controller: controller.passwordTextController,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              fillColor: defaultWhite,
                              // filled: true,
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(defaultBorderRadius),
                              ),
                              focusColor: defaultPrimary,
                              suffixIcon: IconButton(
                                color: defaultGray,
                                icon: Icon(controller.isObsecure.value
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  controller.isObsecure.value =
                                      !controller.isObsecure.value;
                                },
                              ),
                            ),
                            autofocus: false,
                            obscureText: controller.isObsecure.value,
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.012,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () =>
                                  Get.toNamed(RoutesName.resetpasswordemail),
                              style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: const Size(50, 30),
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  alignment: Alignment.center),
                              child: Text(
                                "Lupa Password",
                                style: kOpenSans.copyWith(fontSize: 14),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ButtonCustom(
                        text: "Masuk",
                        onTap: () {
                          controller.formValdidate();
                          controller.login();
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  OutlinedButton(
                    onPressed: () => controller.signInGoogle(),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      side: const BorderSide(color: defaultPrimary),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(defaultBorderRadius)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/images/google.svg',
                          width: 24,
                        ),
                        SizedBox(width: Get.width * 0.04),
                        Text('Masuk dengan Google',
                            style: kOpenSans.copyWith(
                                fontSize: 16, fontWeight: semiBold))
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Belum punya akun?",
                        style: kOpenSans.copyWith(
                            fontSize: 14,
                            color: defaultBlack,
                            fontWeight: FontWeight.w400),
                      ),
                      TextButton(
                        child: Text(
                          'Daftar',
                          style: kOpenSans.copyWith(
                              fontSize: 14,
                              color: defaultPrimary,
                              fontWeight: bold),
                        ),
                        onPressed: () {
                          Get.offNamed(RoutesName.register);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
