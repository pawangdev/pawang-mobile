import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/services/user_service.dart';
import 'package:pawang_mobile/views/dashboard_screen.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';
import 'package:pawang_mobile/widgets/input_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EditProfileScreen extends StatefulWidget {
  static const String routeName = '/edit-profile';
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController nameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 32),
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
                    "Edit Profile",
                    style: kOpenSans.copyWith(
                        fontSize: 16, fontWeight: bold, color: kBlack),
                  ),
                  SizedBox(
                    width: 7.2.w,
                  )
                ],
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
                ],
              ),
              SizedBox(
                height: 4.4.h,
              ),
              InputField(
                  inputLabel: 'Nama Lengkap',
                  inputController: nameTextController),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: OutlinedButton(
                          child: Text(
                            "Ganti Password",
                            style: kOpenSans.copyWith(
                                fontSize: 16,
                                fontWeight: bold,
                                color: kPrimary),
                          ),
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            side: const BorderSide(color: kPrimary),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                      ),
                      SizedBox(height: 2.h),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(vertical: 15),
                              ),
                              backgroundColor:
                                  MaterialStateProperty.all(kPrimary),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      kDefaultBorderRadius),
                                ),
                              ),
                            ),
                            onPressed: () {
                              var data = <String, dynamic>{
                                "name": nameTextController.text,
                              };

                              UserService()
                                  .userUpdateProfile(data)
                                  .then((response) {
                                if (response == true) {
                                  Navigator.pushReplacementNamed(
                                      context, DashboardScreen.routeName);

                                  Flushbar(
                                    message: "Berhasil Update Profile !",
                                    icon: const Icon(
                                      Icons.check,
                                      size: 28.0,
                                      color: Colors.white,
                                    ),
                                    margin: const EdgeInsets.all(8),
                                    borderRadius: BorderRadius.circular(8),
                                    backgroundColor: kSuccess,
                                    duration: const Duration(seconds: 3),
                                  ).show(context);
                                } else {
                                  Flushbar(
                                    message: "Terdapat Kesalahan !",
                                    icon: const Icon(
                                      Icons.check,
                                      size: 28.0,
                                      color: Colors.white,
                                    ),
                                    margin: const EdgeInsets.all(8),
                                    borderRadius: BorderRadius.circular(8),
                                    backgroundColor: kError,
                                    duration: const Duration(seconds: 3),
                                  ).show(context);
                                }
                              });
                            },
                            child: Text(
                              "Simpan Perubahan",
                              style: kOpenSans.copyWith(
                                fontSize: 16,
                                fontWeight: bold,
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
