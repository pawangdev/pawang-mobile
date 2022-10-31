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
                          Get.back();
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.025,
                  ),
                  Text(
                    "Masuk dulu yuk!",
                    style: kOpenSans.copyWith(fontWeight: bold, fontSize: 18),
                  ),
                  SizedBox(height: Get.height * 0.01),
                  Text(
                    "Kami sudah lama menantimu",
                    style: kOpenSans.copyWith(fontWeight: medium, fontSize: 14),
                  ),
                  Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: Get.height * 0.035,
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: InputField(
                            validator: ValidationBuilder(localeName: 'id')
                                .required()
                                .email()
                                .build(),
                            inputLabel: "Email",
                            capitalization: TextCapitalization.none,
                            inputController: controller.emailTextController,
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
                                    fontWeight: bold,
                                    color: defaultBlack),
                              ),
                              SizedBox(
                                height: Get.height * 0.015,
                              ),
                              Obx(
                                () => TextFormField(
                                  validator: ValidationBuilder(localeName: 'id')
                                      .required()
                                      .minLength(8)
                                      .build(),
                                  keyboardType: TextInputType.visiblePassword,
                                  controller: controller.passwordTextController,
                                  decoration: InputDecoration(
                                    fillColor: const Color(0xFFF5F5F5),
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            defaultBorderRadius),
                                        borderSide: BorderSide.none),
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
                                    onPressed: () => Get.toNamed(
                                        RoutesName.resetpasswordemail),
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
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.035,
                  ),
                  ButtonCustom(
                    text: "Masuk",
                    onTap: () {
                      controller.formValdidate();
                      controller.login();
                    },
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  SizedBox(
                    width: Get.width,
                    child: OutlinedButton(
                        onPressed: () => controller.signInGoogle(),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          side: const BorderSide(color: defaultPrimary),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
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
                        )),
                  ),
                  SizedBox(
                    height: Get.height * 0.035,
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
                          Get.toNamed(RoutesName.register);
                        },
                      ),
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
