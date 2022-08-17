import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/services/user_service.dart';
import 'package:pawang_mobile/views/change_password_screen.dart';
import 'package:pawang_mobile/views/dashboard_screen.dart';
import 'package:pawang_mobile/views/navigation_screen.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';
import 'package:pawang_mobile/widgets/input_field.dart';
import 'package:pawang_mobile/widgets/loading.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EditProfileScreen extends StatefulWidget {
  static const String routeName = '/edit-profile';
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController nameTextController = TextEditingController();
  late String gender;
  final formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _init = true;

  void _submit() {
    final form = formKey.currentState;

    if (form!.validate()) {
      form.save();
      var data = <String, dynamic>{
        "name": nameTextController.text,
      };

      try {
        setState(() {
          _isLoading = true;
        });
        UserService().userUpdateProfile(data).then((response) {
          if (response == true) {
            setState(() {
              _isLoading = false;
            });
            Navigator.pushReplacementNamed(context, NavigationScreen.routeName);

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
            setState(() {
              _isLoading = false;
            });
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
      } catch (e) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ArgsEditProfile;

    if (_init) {
      nameTextController.text = args.name;
      gender = args.gender;

      setState(() {
        _init = false;
      });
    }
    return Scaffold(
      body: SafeArea(
        child: _isLoading
            ? const Loading()
            : Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 32),
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
                            child: Image.asset(gender == "male"
                                ? "assets/images/man.png"
                                : gender == "female"
                                    ? "assets/images/woman.png"
                                    : "assets/images/white.jpg")),
                        SizedBox(height: 2.4.h),
                      ],
                    ),
                    SizedBox(
                      height: 4.4.h,
                    ),
                    Form(
                      key: formKey,
                      child: InputField(
                          validator:
                              ValidationBuilder(localeName: 'id').build(),
                          inputLabel: 'Nama Lengkap',
                          inputController: nameTextController),
                    ),
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
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, ChangePasswordScreen.routeName);
                                },
                                style: OutlinedButton.styleFrom(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  side: const BorderSide(color: kPrimary),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                ),
                              ),
                            ),
                            SizedBox(height: 2.h),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        kDefaultBorderRadius),
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [kPrimary, kPurple])),
                                child: TextButton(
                                    style: ButtonStyle(
                                      padding: MaterialStateProperty.all(
                                        const EdgeInsets.symmetric(
                                            vertical: 15),
                                      ),
                                    ),
                                    onPressed: _submit,
                                    child: Text(
                                      "Simpan Perubahan",
                                      style: kOpenSans.copyWith(
                                        color: kWhite,
                                        fontSize: 16,
                                        fontWeight: bold,
                                      ),
                                    )),
                              ),
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

class ArgsEditProfile {
  String name;
  String gender;

  ArgsEditProfile({required this.name, required this.gender});
}
