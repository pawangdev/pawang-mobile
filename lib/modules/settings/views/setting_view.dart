import 'package:flutter/material.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/modules/dashboard/dashboard.dart';
import 'package:pawang_mobile/modules/settings/settings.dart';
import 'package:pawang_mobile/routes/routes.dart';
import 'package:pawang_mobile/utils/storage.dart';
import 'package:get/get.dart';
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
                    style: kOpenSans.copyWith(
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
                              style: kOpenSans.copyWith(
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
                    InkWell(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    height: Get.height * 0.039,
                                    width: Get.width * 0.083,
                                    decoration: BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Icon(
                                      Icons.edit_rounded,
                                      color: defaultWhite,
                                      size: 20,
                                    ),
                                  ),
                                ),
                                Text('Edit Profil',
                                    style: kOpenSans.copyWith(
                                        fontSize: 14, fontWeight: semiBold))
                              ],
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 16,
                            )
                          ],
                        ),
                        onTap: () {
                          Get.toNamed(RoutesName.editprofile);
                        }),
                    SizedBox(
                      child: Divider(
                        color: defaultGray,
                        height: Get.height * 0.0005,
                      ),
                      height: Get.height * 0.035,
                    ),
                    InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  height: Get.height * 0.04,
                                  width: Get.width * 0.083,
                                  decoration: BoxDecoration(
                                    color: defaultPurple,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Icon(
                                    Icons.logout_rounded,
                                    color: defaultWhite,
                                    size: 20,
                                  ),
                                ),
                              ),
                              Text('Keluar',
                                  style: kOpenSans.copyWith(
                                      fontSize: 14, fontWeight: semiBold))
                            ],
                          ),
                          const Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 16,
                          )
                        ],
                      ),
                      onTap: () {
                        showDialog<void>(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) => AlertDialog(
                            title: Text(
                              'Keluar',
                              style: kOpenSans.copyWith(
                                  fontSize: 16, fontWeight: bold),
                              textAlign: TextAlign.center,
                            ),
                            content: Text(
                              'Apakah anda yakin ingin keluar?',
                              style: kOpenSans.copyWith(
                                  fontSize: 15, fontWeight: light),
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
                                    child: OutlinedButton(
                                      child: Text(
                                        "Kembali",
                                        style: kOpenSans.copyWith(
                                            fontSize: 14,
                                            fontWeight: medium,
                                            color: defaultPrimary),
                                      ),
                                      onPressed: () {
                                        Get.back();
                                      },
                                      style: OutlinedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4),
                                        side: const BorderSide(
                                            color: defaultPrimary),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: Get.width * 0.01),
                                  Expanded(
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                defaultPrimary),
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        'Keluar',
                                        style: kOpenSans.copyWith(
                                            color: defaultWhite,
                                            fontWeight: medium,
                                            fontSize: 14),
                                      ),
                                      onPressed: () async {
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
                                                RoutesName.landing));
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
                    SizedBox(
                      child: Divider(
                        color: defaultGray,
                        height: Get.height * 0.0005,
                      ),
                      height: Get.height * 0.035,
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
