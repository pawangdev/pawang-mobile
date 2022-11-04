import 'package:flutter/material.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/modules/dashboard/dashboard.dart';
import 'package:pawang_mobile/modules/settings/settings.dart';
import 'package:pawang_mobile/routes/routes.dart';
import 'package:pawang_mobile/utils/storage.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/widgets/button_custom.dart';
import 'package:pawang_mobile/widgets/setting_item.dart';
import 'package:skeleton_text/skeleton_text.dart';

class SettingsView extends StatelessWidget {
  final SettingsController controller = Get.find();
  final DashboardController dashboardController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, left: 32, right: 32),
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Pengaturan",
                    style: kInter.copyWith(
                        fontSize: 16, fontWeight: bold, color: defaultBlack),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.044,
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
                              style: kInter.copyWith(
                                  fontSize: 14,
                                  fontWeight: bold,
                                  color: defaultBlack),
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
                      text: 'Edit Profile',
                      icon: Icons.edit_rounded,
                      onTap: () {
                        Get.toNamed(RoutesName.editprofile);
                      },
                    ),
                    SettingItem(
                      color: defaultPurple,
                      text: 'Keluar',
                      icon: Icons.logout_rounded,
                      onTap: () {
                        showDialog<void>(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) => AlertDialog(
                            title: Text(
                              'Keluar',
                              style: kInter.copyWith(
                                  fontSize: 16, fontWeight: bold),
                              textAlign: TextAlign.center,
                            ),
                            content: Text(
                              'Apakah anda yakin ingin keluar?',
                              style: kInter.copyWith(
                                  fontSize: 14, fontWeight: medium),
                              textAlign: TextAlign.center,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            actions: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: ButtonCustom(
                                      text: "Kembali",
                                      elevatedMode: false,
                                      onTap: () {
                                        Get.back();
                                      },
                                    ),
                                  ),
                                  SizedBox(width: Get.width * 0.01),
                                  Expanded(
                                    child: ButtonCustom(
                                      text: 'Keluar',
                                      elevatedMode: false,
                                      blueMode: false,
                                      onTap: () async {
                                        Get.snackbar(
                                          'Sukses !',
                                          "Berhasil Keluar !",
                                          backgroundColor: Colors.green,
                                          colorText: Colors.white,
                                          icon: const Icon(
                                            Icons.check,
                                            color: Colors.white,
                                          ),
                                        );
                                        Storage.removeValue("token").then(
                                            (value) => Get.offAllNamed(
                                                RoutesName.login));
                                        // Navigator.pushNamedAndRemoveUntil(
                                        //   context,
                                        //   LandingScreen.routeName,
                                        //   (route) => false,
                                        // );
                                      },
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
      ),
    );
  }
}
