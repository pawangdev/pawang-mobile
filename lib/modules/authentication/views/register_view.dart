import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/modules/authentication/controllers/register_controller.dart';
import 'package:pawang_mobile/routes/app_pages.dart';
import 'package:pawang_mobile/widgets/input_field.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';
import 'package:pawang_mobile/widgets/loading.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
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
                    height: 2.5.h,
                  ),
                  const Text(
                    "Buat Akun",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20
                        //0.27.dp
                        ),
                  ),
                  Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        SizedBox(height: 3.5.h),
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: InputField(
                            validator:
                                ValidationBuilder(localeName: 'id').build(),
                            inputLabel: "Nama Lengkap",
                            inputController: controller.nameTextController,
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
                                    color: kBlack),
                              ),
                              SizedBox(
                                height: 1.4.h,
                              ),
                              Obx(
                                () => TextFormField(
                                  validator: ValidationBuilder(localeName: 'id')
                                      .minLength(8, 'Minimal 8 huruf')
                                      .build(),
                                  controller: controller.passwordTextController,
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
                                .phone('Isi dengan format nomer telepon')
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
                                    // 0.21.dp,
                                    fontWeight: bold,
                                    color: kBlack),
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
                                    width: 2.5.w,
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
                        onPressed: () => controller.register(),
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
                              fontSize: 12, color: kBlack, fontWeight: light)),
                      TextButton(
                        child: Text('Masuk',
                            style: kOpenSans.copyWith(
                                fontSize: 12,
                                color: kPrimary,
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