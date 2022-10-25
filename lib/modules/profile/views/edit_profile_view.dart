import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/modules/dashboard/dashboard.dart';
import 'package:pawang_mobile/modules/profile/controllers/edit_profile_controller.dart';
import 'package:pawang_mobile/routes/routes.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';
import 'package:pawang_mobile/widgets/input_field.dart';
import 'package:get/get.dart';

class EditProfileView extends StatelessWidget {
  final EditProfileController controller = Get.find();
  final DashboardController dashboardController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                          fontSize: 16, fontWeight: bold, color: defaultBlack),
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
                        child: Image.asset(dashboardController
                                    .user.value.gender ==
                                "male"
                            ? "assets/images/man.png"
                            : dashboardController.user.value.gender == "female"
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
                  key: Key('edit-profile'),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InputField(
                          validator:
                              ValidationBuilder(localeName: 'id').build(),
                          inputLabel: 'Nama Lengkap',
                          inputController: controller.nameTextController),
                      SizedBox(
                        height: 5,
                      ),
                      InputField(
                          validator:
                              ValidationBuilder(localeName: 'id').build(),
                          inputLabel: 'Nomer Telepon',
                          inputController: controller.phoneTextController),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Jenis Kelamin",
                        style: kOpenSans.copyWith(
                            fontSize: 12,
                            // 0.21.dp,
                            fontWeight: bold,
                            color: defaultBlack),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Obx(
                                () => Radio(
                                  value: "male",
                                  groupValue:
                                      controller.genderTextController.value,
                                  onChanged: (value) {
                                    controller.genderTextController.value =
                                        value as String;
                                  },
                                ),
                              ),
                              Text(
                                "Laki-Laki",
                                style: kOpenSans.copyWith(fontSize: 12),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: Get.width * 0.025,
                          ),
                          Row(
                            children: [
                              Obx(
                                () => Radio(
                                  value: "female",
                                  groupValue:
                                      controller.genderTextController.value,
                                  onChanged: (value) {
                                    controller.genderTextController.value =
                                        value as String;
                                  },
                                ),
                              ),
                              Text(
                                "Perempuan",
                                style: kOpenSans.copyWith(fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                Align(
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
                                color: defaultPrimary),
                          ),
                          onPressed: () {
                            Get.toNamed(RoutesName.changepassword);
                          },
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            side: const BorderSide(color: defaultPrimary),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                      ),
                      SizedBox(height: Get.height * 0.02),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(defaultBorderRadius),
                              gradient: const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [defaultPrimary, defaultPurple])),
                          child: TextButton(
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                  const EdgeInsets.symmetric(vertical: 15),
                                ),
                              ),
                              onPressed: () => controller.updateProfile(),
                              child: Text(
                                "Simpan Perubahan",
                                style: kOpenSans.copyWith(
                                  color: defaultWhite,
                                  fontSize: 16,
                                  fontWeight: bold,
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
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
