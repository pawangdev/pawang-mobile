import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/modules/authentication/controllers/login_controller.dart';
import 'package:pawang_mobile/routes/app_pages.dart';
import 'package:pawang_mobile/widgets/input_field.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
                    // key: formKey,
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
                                    // 0.21.dp,
                                    fontWeight: bold,
                                    color: defaultBlack),
                              ),
                              SizedBox(
                                height: 1.5.h,
                              ),
                              Obx(
                                () => TextFormField(
                                  validator: ValidationBuilder(localeName: 'id')
                                      .minLength(8, 'Minimal 8 huruf')
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
                              const SizedBox(
                                height: 12,
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
                                      style: kOpenSans,
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
                    height: 3.5.h,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(defaultBorderRadius),
                          gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [defaultPrimary, defaultPurple])),
                      child: TextButton(
                        onPressed: () => controller.login(),
                        child: Text(
                          "Masuk",
                          style: kOpenSans.copyWith(
                              color: defaultWhite,
                              fontSize: 16,
                              //0.25.dp,
                              fontWeight: bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  SizedBox(
                    width: Get.width,
                    child: OutlinedButton(
                        onPressed: () => controller.signInGoogle(),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(defaultBorderRadius),
                            ),
                          ),
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 12.0),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              TablerIcons.brand_google,
                              size: 18,
                            ),
                            const SizedBox(width: 5),
                            Text('Masuk dengan Google', style: kOpenSans)
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 3.5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Belum punya akun?",
                        style: kOpenSans.copyWith(
                            fontSize: 12,
                            //0.235.dp,
                            color: defaultBlack,
                            fontWeight: light),
                      ),
                      TextButton(
                        child: Text(
                          'Daftar',
                          style: kOpenSans.copyWith(
                              fontSize: 12,
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
