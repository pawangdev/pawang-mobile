import 'package:flutter/material.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/modules/dashboard/dashboard.dart';
import 'package:pawang_mobile/modules/settings/settings.dart';
import 'package:pawang_mobile/routes/routes.dart';
import 'package:pawang_mobile/utils/storage.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/widgets/button_custom.dart';
import 'package:pawang_mobile/widgets/select_button.dart';
import 'package:pawang_mobile/widgets/setting_item.dart';
import 'package:skeleton_text/skeleton_text.dart';

class SettingsView extends StatelessWidget {
  final SettingsController controller = Get.find();
  final DashboardController dashboardController = Get.find();

  SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Pengaturan".tr,
                  style: kInter.copyWith(fontSize: 16, fontWeight: bold),
                ),
              ),
              SizedBox(
                height: Get.height * 0.04,
              ),
              Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: Get.height * 0.138,
                      width: Get.width * 0.28,
                      child: Image.asset(dashboardController
                                  .user.value.gender ==
                              "male"
                          ? "assets/images/man.png"
                          : dashboardController.user.value.gender == "female"
                              ? "assets/images/woman.png"
                              : "assets/images/user.png"),
                    ),
                    SizedBox(height: Get.height * 0.024),
                    dashboardController.user.value.name != ""
                        ? Text(
                            dashboardController.user.value.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: kInter.copyWith(fontWeight: bold),
                          )
                        : SkeletonAnimation(
                            borderRadius: BorderRadius.circular(8.0),
                            shimmerColor: Colors.white70,
                            child: Container(
                              height: 12,
                              width: Get.width * 0.40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: Colors.grey.withOpacity(0.5),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.044,
              ),
              Column(
                children: [
                  SettingItem(
                    color: Colors.orange,
                    text: 'Edit Profil'.tr,
                    icon: Icons.edit_rounded,
                    onTap: () {
                      Get.toNamed(RoutesName.editprofile);
                    },
                  ),
                  SettingItem(
                    color: defaultSuccess,
                    text: 'Bahasa'.tr,
                    icon: Icons.language,
                    iconSufix: false,
                    contentSufix: Text(
                      Get.locale?.toLanguageTag() == 'id' ? 'ID' : 'EN',
                      style: kInter.copyWith(
                          fontWeight: medium, color: defaultGray),
                    ),
                    onTap: () {
                      showDialog<void>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: Text(
                            'Bahasa'.tr,
                            textAlign: TextAlign.center,
                            style:
                                kInter.copyWith(fontSize: 16, fontWeight: bold),
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SelectButton(
                                nama: 'Bahasa Indonesia',
                                isSelected: Get.locale?.toLanguageTag() == 'id'
                                    ? true
                                    : false,
                                onTap: () {
                                  Get.updateLocale(const Locale('id')).then(
                                      (value) => Storage.removeValue('locale'));
                                  Storage.saveValue('locale', 'id');
                                  Get.back();
                                },
                              ),
                              SelectButton(
                                nama: 'English Language',
                                isSelected: Get.locale?.toLanguageTag() == 'en'
                                    ? true
                                    : false,
                                onTap: () {
                                  Get.updateLocale(const Locale('en')).then(
                                      (value) => Storage.removeValue('locale'));
                                  Storage.saveValue('locale', 'en');
                                  Get.back();
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  SettingItem(
                    color: Colors.indigoAccent,
                    text: 'Mode Malam'.tr,
                    icon: Icons.dark_mode,
                    iconSufix: false,
                    contentSufix: Switch(
                      value: Theme.of(context).brightness == Brightness.dark,
                      onChanged: (value) {
                        if (value == true) {
                          Get.changeThemeMode(
                            ThemeMode.dark,
                          );
                          Storage.removeValue('themeMode');
                          Storage.saveValue('themeMode', 'dark');
                          Get.back();
                        } else {
                          Get.changeThemeMode(
                            ThemeMode.light,
                          );
                          Storage.removeValue('themeMode');
                          Storage.saveValue('themeMode', 'light');
                          Get.back();
                        }
                      },
                    ),
                  ),
                  SettingItem(
                    color: defaultPurple,
                    text: 'Keluar'.tr,
                    icon: Icons.logout_rounded,
                    onTap: () {
                      showDialog<void>(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) => AlertDialog(
                          title: Text(
                            'Keluar'.tr,
                            style:
                                kInter.copyWith(fontSize: 16, fontWeight: bold),
                            textAlign: TextAlign.center,
                          ),
                          content: Text(
                            'Apakah anda yakin ingin keluar?'.tr,
                            style: kInter.copyWith(
                                fontSize: 14, fontWeight: medium),
                            textAlign: TextAlign.center,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: ButtonCustom(
                                    text: "Kembali".tr,
                                    elevatedMode: false,
                                    onTap: () {
                                      Get.back();
                                    },
                                  ),
                                ),
                                SizedBox(width: Get.width * 0.01),
                                Expanded(
                                  child: ButtonCustom(
                                    text: 'Keluar'.tr,
                                    elevatedMode: false,
                                    blueMode: false,
                                    onTap: () => controller.logout(),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
