import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/modules/authentication/controllers/reset_password_controller.dart';
import 'package:pawang_mobile/widgets/button_custom.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';

class ResetPasswordRequestEmailView extends StatelessWidget {
  final ResetPasswordController controller =
      Get.find<ResetPasswordController>();
  ResetPasswordRequestEmailView({Key? key}) : super(key: key);

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
                        "Lupa Password".tr,
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
                  padding: const EdgeInsets.all(34.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    color: Colors.blue.shade100,
                  ),
                  child: Container(
                    width: 130,
                    height: 130,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/lock.png"),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                "Masukkan email yang kamu gunakan untuk mendaftar. Kami akan mengirimkan token untuk mengatur ulang password kamu."
                    .tr,
                style: kInter.copyWith(color: defaultGray),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 24,
              ),
              Form(
                key: controller.formKey,
                child: TextFormField(
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) {
                    controller.formValdidate();
                    controller.sendRequestToken();
                  },
                  scrollPadding: EdgeInsets.only(bottom: Get.height * 0.4),
                  controller: controller.emailTextController,
                  validator: ValidationBuilder(localeName: 'id')
                      .required()
                      .email()
                      .build(),
                  decoration: InputDecoration(label: Text("Alamat Email".tr)),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              ButtonCustom(
                text: 'Kirim Kode'.tr,
                onTap: () {
                  controller.formValdidate();
                  controller.sendRequestToken();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
