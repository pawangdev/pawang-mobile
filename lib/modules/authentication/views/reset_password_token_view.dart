import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/modules/authentication/controllers/reset_password_controller.dart';
import 'package:pawang_mobile/modules/authentication/views/reset_password_confirmation.dart';
import 'package:pawang_mobile/routes/routes.dart';

class ResetPasswordTokenView extends StatelessWidget {
  final ResetPasswordController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          onPressed: () => Get.back(),
                          icon: const Icon(TablerIcons.chevron_left),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Verifikasi Token",
                          style: kOpenSans.copyWith(
                              fontWeight: semiBold, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Center(
                  child: Container(
                    width: 180,
                    height: 180,
                    padding: const EdgeInsets.all(38.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      color: Colors.blue.shade100,
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/email.png"),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    "Silahkan masukkan token yang telah kamu dapat pada email kamu, jika tidak masuk check pada kotak spam email kamu",
                    style: kOpenSans.copyWith(color: defaultGray),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextField(
                  controller: controller.tokenTextController,
                  maxLength: 8,
                  decoration: const InputDecoration(label: Text("Token Kode")),
                ),
                const SizedBox(
                  height: 32,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => controller.sendVerifyToken(),
                    child: Text(
                      "Verifikasi Token",
                      style: kOpenSans.copyWith(fontWeight: semiBold),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(defaultBorderRadius))),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blue.shade300),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.all(12.0),
                      ),
                    ),
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
