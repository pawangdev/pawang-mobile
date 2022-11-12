import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/modules/profile/controllers/change_password_controller.dart';
import 'package:pawang_mobile/widgets/button_custom.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';
import 'package:pawang_mobile/widgets/input_field.dart';

class ChangePasswordView extends StatelessWidget {
  final ChangePasswordController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32),
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
                  "Ganti Password".tr,
                  style: kInter.copyWith(fontSize: 16, fontWeight: bold),
                ),
                SizedBox(
                  width: Get.width * 0.072,
                )
              ],
            ),
            SizedBox(height: Get.height * 0.045),
            Form(
              key: const Key('change-password'),
              child: Column(
                children: [
                  InputField(
                      validator: ValidationBuilder(localeName: 'id').build(),
                      icon: const Icon(Icons.lock_outline_rounded),
                      inputLabel: 'Password Lama'.tr,
                      isPassword: true,
                      keyboardType: TextInputType.visiblePassword,
                      inputController: controller.passwordNowTextController),
                  SizedBox(height: Get.height * 0.025),
                  InputField(
                      validator: ValidationBuilder(localeName: 'id').build(),
                      icon: const Icon(Icons.lock_outline_rounded),
                      inputLabel: 'Password Baru'.tr,
                      isPassword: true,
                      keyboardType: TextInputType.visiblePassword,
                      inputController: controller.passwordNewTextController),
                  SizedBox(height: Get.height * 0.025),
                  InputField(
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) {
                        controller.updatePassword();
                      },
                      validator: ValidationBuilder(localeName: 'id').build(),
                      icon: const Icon(Icons.lock_outline_rounded),
                      inputLabel: 'Password Baru Konfirmasi'.tr,
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
                child: ButtonCustom(
                  text: 'Simpan Perubahan'.tr,
                  onTap: () => controller.updatePassword(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
