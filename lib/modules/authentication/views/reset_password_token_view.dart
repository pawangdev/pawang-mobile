import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/modules/authentication/controllers/reset_password_controller.dart';
import 'package:pawang_mobile/widgets/button_custom.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';

class ResetPasswordTokenView extends StatelessWidget {
  final ResetPasswordController controller = Get.find();

  ResetPasswordTokenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: IconBack(blueMode: true, onTap: () => Get.back()),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Verifikasi Token".tr,
                        style:
                            kInter.copyWith(fontWeight: semiBold, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Center(
                child: Container(
                  width: 180,
                  height: 180,
                  padding: const EdgeInsets.all(38.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    color: Colors.blue.shade100,
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/email.png"),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  "Silahkan masukkan token yang telah kamu dapat pada email kamu, jika tidak masuk check pada kotak spam email kamu"
                      .tr,
                  style: kInter.copyWith(color: defaultGray),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Form(
                // key: controller.formKey,
                child: TextFormField(
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) {
                    controller.sendVerifyToken();
                  },
                  scrollPadding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  controller: controller.tokenTextController,
                  validator: ValidationBuilder(
                          localeName:
                              Get.locale?.toLanguageTag() == 'en' ? 'en' : 'id')
                      .required()
                      .minLength(6)
                      .maxLength(6)
                      .build(),
                  maxLength: 6,
                  decoration: InputDecoration(label: Text("Token Kode".tr)),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              ButtonCustom(
                text: 'Verifikasi Token'.tr,
                onTap: () {
                  // controller.formValdidate();
                  controller.sendVerifyToken();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
