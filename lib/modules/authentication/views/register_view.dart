import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/modules/authentication/controllers/register_controller.dart';
import 'package:pawang_mobile/routes/app_pages.dart';
import 'package:pawang_mobile/widgets/input_field.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';
import 'package:get/get.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);
  final controller = Get.find<RegisterController>();

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
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.025,
                  ),
                  Text(
                    "Buat Akun",
                    style: kOpenSans.copyWith(fontWeight: bold, fontSize: 18),
                  ),
                  Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        SizedBox(height: Get.height * 0.035),
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: InputField(
                            validator: ValidationBuilder(localeName: 'id')
                                .required()
                                .build(),
                            inputLabel: "Nama Lengkap",
                            inputController: controller.nameTextController,
                            keyboardType: TextInputType.name,
                          ),
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
                                height: Get.height * 0.014,
                              ),
                              Obx(
                                () => TextFormField(
                                  validator: ValidationBuilder(localeName: 'id')
                                      .required()
                                      .minLength(8)
                                      .build(),
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
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: InputField(
                            validator: ValidationBuilder(localeName: 'id')
                                .required()
                                .phone()
                                .build(),
                            inputLabel: "Nomer Telepon",
                            inputController: controller.phoneTextController,
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
                                    fontWeight: bold,
                                    color: defaultBlack),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Obx(
                                        () => Radio(
                                          value: "male",
                                          groupValue: controller
                                              .genderTextController.value,
                                          onChanged: (value) {
                                            controller.genderTextController
                                                .value = value as String;
                                          },
                                        ),
                                      ),
                                      Text(
                                        "Laki-Laki",
                                        style: kOpenSans.copyWith(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.025,
                                  ),
                                  Row(
                                    children: [
                                      Obx(
                                        () => Radio(
                                          value: "female",
                                          groupValue: controller
                                              .genderTextController.value,
                                          onChanged: (value) {
                                            controller.genderTextController
                                                .value = value as String;
                                          },
                                        ),
                                      ),
                                      Text(
                                        "Perempuan",
                                        style: kOpenSans.copyWith(fontSize: 12),
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
                    height: Get.height * 0.035,
                  ),
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
                        onPressed: () {
                          controller.formValdidate();
                          controller.register();
                        },
                        child: Text(
                          "Daftar",
                          style: kOpenSans.copyWith(
                              color: defaultWhite,
                              fontSize: 16,
                              fontWeight: semiBold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Sudah punya akun? ",
                          style: kOpenSans.copyWith(
                              fontSize: 14,
                              color: defaultBlack,
                              fontWeight: FontWeight.w400)),
                      TextButton(
                        child: Text('Masuk',
                            style: kOpenSans.copyWith(
                                fontSize: 14,
                                color: defaultPrimary,
                                fontWeight: bold)),
                        onPressed: () {
                          Get.toNamed(RoutesName.login);
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
