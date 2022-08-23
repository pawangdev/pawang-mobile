import 'package:flutter/material.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/modules/dashboard/dashboard.dart';
import 'package:pawang_mobile/modules/settings/settings.dart';
import 'package:pawang_mobile/routes/routes.dart';
import 'package:pawang_mobile/utils/storage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:skeleton_text/skeleton_text.dart';

class SettingsView extends StatelessWidget {
  final SettingsController controller = Get.find();
  final DashboardController dashboardController = Get.find();
  // ProfileModel user = ProfileModel(
  //     id: 0,
  //     name: "",
  //     email: "",
  //     phone: "",
  //     gender: "",
  //     createdAt: DateTime.now(),
  //     updatedAt: DateTime.now());

  // @override
  // void initState() {
  //   getUserProfile();
  //   super.initState();
  // }

  // void getUserProfile() async {
  //   var dataUser = await UserService().userProfile();

  //   setState(() {
  //     user = dataUser as ProfileModel;
  //   });
  // }

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
                  height: 4.4.h,
                ),
                Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 13.8.h,
                        width: 28.w,
                        child: Image.asset(dashboardController
                                    .user.value.gender ==
                                "male"
                            ? "assets/images/man.png"
                            : dashboardController.user.value.gender == "female"
                                ? "assets/images/woman.png"
                                : "assets/images/white.jpg"),
                      ),
                      SizedBox(height: 2.4.h),
                      dashboardController.user.value.name != ""
                          ? Text(
                              dashboardController.user.value.name,
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
                                width: MediaQuery.of(context).size.width * 0.40,
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
                  height: 4.4.h,
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
                                    height: 3.9.h,
                                    width: 8.3.w,
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
                        height: 0.05.h,
                      ),
                      height: 2.8.h,
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
                                  height: 4.h,
                                  width: 8.3.w,
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
                                  SizedBox(width: 1.w),
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
                                          "Berhasil Keluar",
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
                        height: 0.05.h,
                      ),
                      height: 2.8.h,
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
