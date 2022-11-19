import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/modules/dashboard/dashboard.dart';
import 'package:pawang_mobile/modules/profile/controllers/edit_profile_controller.dart';
import 'package:pawang_mobile/routes/routes.dart';
import 'package:pawang_mobile/widgets/button_custom.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';
import 'package:pawang_mobile/widgets/input_field.dart';
import 'package:get/get.dart';

class EditProfileView extends StatelessWidget {
  final EditProfileController controller = Get.find();
  final DashboardController dashboardController = Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                'Apakah anda ingin membuang perubahan ini?'.tr,
                style: kInter.copyWith(fontSize: 16, fontWeight: semiBold),
                textAlign: TextAlign.center,
              ),
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                Row(
                  children: [
                    Expanded(
                      child: ButtonCustom(
                        elevatedMode: false,
                        onTap: () {
                          Navigator.pop(context, false);
                        },
                        text: 'Tidak'.tr,
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.01,
                    ),
                    Expanded(
                      child: ButtonCustom(
                        elevatedMode: false,
                        onTap: () {
                          Navigator.pop(context, true);
                          controller.resetAllInput();
                          Get.back();
                        },
                        text: 'Ya'.tr,
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        );
        return shouldPop!;
      },
      child: Scaffold(
        body: LayoutBuilder(builder: (context, constraint) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconBack(
                              blueMode: true,
                              onTap: () {
                                showDialog<bool>(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(
                                        'Apakah anda ingin membuang perubahan ini?'
                                            .tr,
                                        style: kInter.copyWith(
                                            fontSize: 16, fontWeight: semiBold),
                                        textAlign: TextAlign.center,
                                      ),
                                      actionsAlignment:
                                          MainAxisAlignment.center,
                                      actions: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: ButtonCustom(
                                                elevatedMode: false,
                                                onTap: () {
                                                  Navigator.pop(context, false);
                                                },
                                                text: 'Tidak'.tr,
                                              ),
                                            ),
                                            SizedBox(
                                              width: Get.width * 0.01,
                                            ),
                                            Expanded(
                                              child: ButtonCustom(
                                                elevatedMode: false,
                                                onTap: () {
                                                  Navigator.pop(context, true);
                                                  controller.resetAllInput();
                                                  Get.back();
                                                },
                                                text: 'Ya'.tr,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }),
                          Text(
                            "Edit Profil".tr,
                            style: kInter.copyWith(
                              fontSize: 16,
                              fontWeight: bold,
                            ),
                          ),
                          SizedBox(
                            width: Get.width * 0.072,
                          )
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 0.044,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Obx(
                            () => SizedBox(
                              height: Get.height * 0.138,
                              width: Get.width * 0.28,
                              child: Image.asset(
                                  dashboardController.user.value.gender ==
                                          "male"
                                      ? "assets/images/man.png"
                                      : dashboardController.user.value.gender ==
                                              "female"
                                          ? "assets/images/woman.png"
                                          : "assets/images/user.png"),
                            ),
                          ),
                          SizedBox(height: Get.height * 0.014),
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 0.044,
                      ),
                      Form(
                        key: const Key('edit-profile'),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InputField(
                                validator: ValidationBuilder(
                                        localeName:
                                            Get.locale?.toLanguageTag() == 'en'
                                                ? 'en'
                                                : 'id')
                                    .build(),
                                icon: const Icon(Icons.person_outline_rounded),
                                inputLabel: 'Nama Lengkap'.tr,
                                inputController: controller.nameTextController),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            InputField(
                                validator: ValidationBuilder(
                                        localeName:
                                            Get.locale?.toLanguageTag() == 'en'
                                                ? 'en'
                                                : 'id')
                                    .build(),
                                icon: const Icon(Icons.phone_rounded),
                                inputLabel: 'Nomer Telepon'.tr,
                                inputController:
                                    controller.phoneTextController),
                            SizedBox(
                              height: Get.height * 0.014,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    controller.genderTextController.value =
                                        'male' as String;
                                  },
                                  child: Row(
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
                                        "Laki-Laki".tr,
                                        style: kInter.copyWith(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: Get.width * 0.025,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    controller.genderTextController.value =
                                        'female' as String;
                                  },
                                  child: Row(
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
                                        "Perempuan".tr,
                                        style: kInter.copyWith(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      ButtonCustom(
                        elevatedMode: false,
                        text: 'Ganti Password'.tr,
                        onTap: () {
                          Get.toNamed(RoutesName.changepassword);
                        },
                      ),
                      SizedBox(height: Get.height * 0.02),
                      ButtonCustom(
                        text: 'Simpan Perubahan'.tr,
                        onTap: () {
                          controller.updateProfile();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class ArgsEditProfile {
  String name;
  String gender;

  ArgsEditProfile({required this.name, required this.gender});
}
