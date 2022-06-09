import 'package:flutter/material.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/models/profile_user_model.dart';
import 'package:pawang_mobile/services/user_service.dart';
import 'package:pawang_mobile/views/dashboard_screen.dart';
import 'package:pawang_mobile/views/edit_profile.dart';
import 'package:pawang_mobile/views/landing_screen.dart';
import 'package:pawang_mobile/views/scan_struk_screen.dart';
import 'package:pawang_mobile/widgets/icon_bottom.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skeleton_text/skeleton_text.dart';

class SettingsScreen extends StatefulWidget {
  static const String routeName = '/settings';
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  ProfileModel user = ProfileModel(
      id: 0,
      name: "",
      email: "",
      phone: "",
      gender: "",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now());

  @override
  void initState() {
    getUserProfile();
    super.initState();
  }

  void getUserProfile() async {
    var dataUser = await UserService().userProfile();

    setState(() {
      user = dataUser as ProfileModel;
    });
  }

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
                          fontSize: 16, fontWeight: bold, color: kBlack),
                    ),
                  ),
                  SizedBox(
                    height: 4.4.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 13.8.h,
                          width: 28.w,
                          child: Image.asset('assets/images/profile_blue.png')),
                      SizedBox(height: 2.4.h),
                      user.name != ""
                          ? Text(
                              user.name,
                              style: kOpenSans.copyWith(
                                  fontSize: 14,
                                  fontWeight: bold,
                                  color: kBlack),
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
                                        color: kWhite,
                                      ),
                                    ),
                                  ),
                                  Text('Edit profil',
                                      style: kOpenSans.copyWith(
                                          fontSize: 14, fontWeight: semibold))
                                ],
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 16,
                              )
                            ],
                          ),
                          onTap: () {
                            Navigator.pushNamed(
                                context, EditProfileScreen.routeName);
                          }),
                      SizedBox(
                        child: Divider(
                          color: kGray,
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
                                    height: 3.9.h,
                                    width: 8.3.w,
                                    decoration: BoxDecoration(
                                      color: kPurple3,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Icon(
                                      Icons.logout_rounded,
                                      color: kWhite,
                                    ),
                                  ),
                                ),
                                Text('Keluar',
                                    style: kOpenSans.copyWith(
                                        fontSize: 14, fontWeight: semibold))
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
                                              color: kPrimary),
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        style: OutlinedButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4),
                                          side:
                                              const BorderSide(color: kPrimary),
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
                                                  kPrimary),
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
                                              color: kWhite,
                                              fontWeight: medium,
                                              fontSize: 14),
                                        ),
                                        onPressed: () async {
                                          final prefs = await SharedPreferences
                                              .getInstance();
                                          prefs.remove("token");
                                          Navigator.pushNamed(
                                              context, LandingScreen.routeName);
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
                          color: kGray,
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
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: SizedBox(
            height: 7.h,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 42),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconBottomBar(
                      text: "Beranda",
                      icon: Icons.home,
                      selected: false,
                      onPressed: () {
                        Navigator.pushNamed(context, DashboardScreen.routeName);
                      }),
                  IconBottomBar(
                      text: "Scan Struk",
                      icon: Icons.fullscreen,
                      selected: false,
                      onPressed: () {
                        Navigator.pushNamed(context, ScanStruk.routeName);
                      }),
                  IconBottomBar(
                      text: "Pengaturan",
                      icon: Icons.settings_outlined,
                      selected: true,
                      onPressed: () {
                        Navigator.pushNamed(context, SettingsScreen.routeName);
                      }),
                ],
              ),
            ),
          ),
        ));
  }
}
