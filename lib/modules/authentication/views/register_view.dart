import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/modules/authentication/controllers/register_controller.dart';
import 'package:pawang_mobile/routes/app_pages.dart';
import 'package:pawang_mobile/utils/storage.dart';
import 'package:pawang_mobile/widgets/button_custom.dart';
import 'package:pawang_mobile/widgets/input_field.dart';
import 'package:get/get.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);
  final controller = Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: Get.locale?.toLanguageTag() == 'id' ? 0 : 1,
      length: 2,
      child: Scaffold(
        body: DoubleBack(
          onFirstBackPress: (context) {
            Get.rawSnackbar(
              snackPosition: SnackPosition.BOTTOM,
              padding: const EdgeInsets.all(10),
              duration: const Duration(milliseconds: 900),
              margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 40),
              borderRadius: 20,
              icon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  'assets/images/lock.png',
                  fit: BoxFit.fill,
                ),
              ),
              backgroundColor: defaultBlack.withOpacity(0.8),
              messageText: Text(
                'Tekan sekali lagi untuk keluar'.tr,
                style: kInter.copyWith(color: defaultWhite),
              ),
            );
          },
          child: LayoutBuilder(builder: (context, constraint) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: [
                          Stack(
                            children: [
                              Image.asset(
                                'assets/images/register.png',
                                fit: BoxFit.fill,
                              ),
                              Positioned(
                                right: Get.width * 0.01,
                                top: Get.height * 0.05,
                                child: Container(
                                  width: Get.width * 0.12,
                                  height: Get.height * 0.03,
                                  decoration: BoxDecoration(
                                      color: defaultBlack.withOpacity(0.2),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(40))),
                                  child: TabBar(
                                    onTap: (int index) {
                                      if (index == 0) {
                                        Get.updateLocale(const Locale('id'))
                                            .then((value) =>
                                                Storage.removeValue('locale'));
                                        Storage.saveValue('locale', 'id');
                                      } else {
                                        Get.updateLocale(const Locale('en'))
                                            .then((value) =>
                                                Storage.removeValue('locale'));
                                        Storage.saveValue('locale', 'en');
                                      }
                                    },
                                    labelColor: defaultBlack,
                                    unselectedLabelColor: defaultGray,
                                    isScrollable: true,
                                    labelPadding: EdgeInsets.symmetric(
                                        horizontal: Get.width * 0.013),
                                    indicator: const BoxDecoration(
                                        color: defaultWhite,
                                        shape: BoxShape.circle),
                                    tabs: [
                                      Center(
                                        child: Text(
                                          'ID',
                                          maxLines: 1,
                                          style: kInter.copyWith(
                                              fontWeight: medium, fontSize: 12),
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          'EN',
                                          maxLines: 1,
                                          style: kInter.copyWith(
                                              fontWeight: medium, fontSize: 12),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: Get.height * 0.05),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 32.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Buat Akun".tr,
                                      style: kInter.copyWith(
                                          fontWeight: bold, fontSize: 20),
                                    ),
                                    SizedBox(height: Get.height * 0.008),
                                    Text(
                                      "Kami sangat senang dengan kehadiranmu"
                                          .tr,
                                      style: kInter.copyWith(
                                          fontWeight: regular, fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: Get.height * 0.02,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 32.0),
                                key: controller.formKey,
                                child: Column(
                                  children: [
                                    InputField(
                                      validator: ValidationBuilder(
                                              localeName:
                                                  Get.locale?.toLanguageTag() ==
                                                          'en'
                                                      ? 'en'
                                                      : 'id')
                                          .required()
                                          .build(),
                                      icon: const Icon(
                                          Icons.person_outline_rounded),
                                      inputLabel: "Nama Lengkap".tr,
                                      inputController:
                                          controller.nameTextController,
                                      keyboardType: TextInputType.name,
                                    ),
                                    SizedBox(height: Get.height * 0.025),
                                    InputField(
                                      validator: ValidationBuilder(
                                              localeName:
                                                  Get.locale?.toLanguageTag() ==
                                                          'en'
                                                      ? 'en'
                                                      : 'id')
                                          .required()
                                          .email()
                                          .build(),
                                      icon: const Icon(
                                          Icons.alternate_email_rounded),
                                      inputLabel: "Email",
                                      capitalization: TextCapitalization.none,
                                      inputController:
                                          controller.emailTextController,
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                    SizedBox(height: Get.height * 0.025),
                                    Obx(
                                      () => TextFormField(
                                        textInputAction: TextInputAction.done,
                                        scrollPadding: EdgeInsets.only(
                                            bottom: Get.height * 0.4),
                                        onFieldSubmitted: (_) {
                                          controller.formValdidate();
                                          controller.register();
                                        },
                                        validator: ValidationBuilder(
                                                localeName: Get.locale
                                                            ?.toLanguageTag() ==
                                                        'en'
                                                    ? 'en'
                                                    : 'id')
                                            .required()
                                            .minLength(8)
                                            .build(),
                                        controller:
                                            controller.passwordTextController,
                                        decoration: InputDecoration(
                                          icon: const Icon(Icons.lock_rounded),
                                          hintText: 'Password',
                                          fillColor: defaultWhite,
                                          suffixIcon: IconButton(
                                            color: defaultGray,
                                            icon: Icon(
                                                controller.isObsecure.value
                                                    ? Icons.visibility
                                                    : Icons.visibility_off),
                                            onPressed: () {
                                              controller.isObsecure.value =
                                                  !controller.isObsecure.value;
                                            },
                                          ),
                                        ),
                                        autofocus: false,
                                        obscureText:
                                            controller.isObsecure.value,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: Get.height * 0.1),
                      Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 32.0),
                            child: ButtonCustom(
                              text: "Daftar".tr,
                              onTap: () {
                                controller.formValdidate();
                                controller.register();
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Sudah punya akun?".tr,
                                  style: kInter.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400)),
                              TextButton(
                                child: Text('Masuk'.tr,
                                    style: kInter.copyWith(
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
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
