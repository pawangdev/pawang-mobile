import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/modules/authentication/controllers/register_controller.dart';
import 'package:pawang_mobile/routes/app_pages.dart';
import 'package:pawang_mobile/widgets/button_custom.dart';
import 'package:pawang_mobile/widgets/input_field.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';
import 'package:get/get.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);
  final controller = Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 32),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                "Buat Akun",
                style: kOpenSans.copyWith(fontWeight: bold, fontSize: 18),
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
                          .build(),
                      inputLabel: "Nama Lengkap",
                      inputController: controller.nameTextController,
                      // keyboardType: TextInputType.name,
                    ),
                    SizedBox(height: Get.height * 0.035),
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
                    InputField(
                      validator: ValidationBuilder(localeName: 'id')
                          .required()
                          .phone()
                          .build(),
                      inputLabel: "Nomer Telepon",
                      inputController: controller.phoneTextController,
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(height: Get.height * 0.035),
                    Obx(
                      () => TextFormField(
                        textInputAction: TextInputAction.done,
                        validator: ValidationBuilder(localeName: 'id')
                            .required()
                            .minLength(8)
                            .build(),
                        controller: controller.passwordTextController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          fillColor: defaultWhite,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(defaultBorderRadius),
                          ),
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
                    SizedBox(height: Get.height * 0.025),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Obx(
                              () => Radio(
                                value: "male",
                                groupValue:
                                    controller.genderTextController.value,
                                onChanged: (value) {
                                  controller.genderTextController.value =
                                      value as String;
                                },
                              ),
                            ),
                            Text(
                              "Laki-Laki",
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
                                groupValue:
                                    controller.genderTextController.value,
                                onChanged: (value) {
                                  controller.genderTextController.value =
                                      value as String;
                                },
                              ),
                            ),
                            Text(
                              "Perempuan",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ButtonCustom(
                    text: "Daftar",
                    onTap: () {
                      controller.formValdidate();
                      controller.register();
                    },
                  ),
                ),
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
                      Get.offNamed(RoutesName.login);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
