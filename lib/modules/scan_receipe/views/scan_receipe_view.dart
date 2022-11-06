// ignore_for_file: use_key_in_widget_constructors

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/modules/scan_receipe/scan_receipe.dart';
import 'package:pawang_mobile/widgets/button_custom.dart';

class ScanReceipeView extends StatelessWidget {
  final ScanReceipeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text(
                  "Scan Struk",
                  style: kInter.copyWith(
                    fontSize: 16,
                    fontWeight: bold,
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.038,
              ),
              const Center(
                child: Text(
                  "Mohon atur posisi struk agar dapat terdeteksi",
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: Get.height * 0.042,
              ),
              // ----- BOX IMAGE -----

              SizedBox(
                child: GetBuilder<ScanReceipeController>(
                  builder: (controller) => controller.imageFilePath == null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Stack(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      height: Get.height * 0.5,
                                      child: Center(
                                        child: Text(
                                          "Silahkan pilih struk terlebih dahulu",
                                          style: kInter.copyWith(
                                              color: defaultGray,
                                              fontWeight: medium),
                                        ),
                                      ),
                                      padding: const EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: defaultGray, width: 0.5),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    Container(
                                      height: Get.height * 0.04,
                                    )
                                  ],
                                ),
                                Positioned(
                                  top: Get.height * 0.462,
                                  left: Get.width * 0.335,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            defaultBorderRadius),
                                        gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [
                                              defaultPrimary,
                                              defaultPurple
                                            ])),
                                    child: TextButton(
                                        child: Image.asset(
                                          'assets/images/scan3.png',
                                          width: 32,
                                          fit: BoxFit.cover,
                                        ),
                                        style: ButtonStyle(
                                            padding: MaterialStateProperty.all(
                                                const EdgeInsets.all(14)),
                                            shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)))),
                                        onPressed: () {
                                          controller.scanReceipt(false);
                                        }),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Get.height * 0.008,
                            ),
                            SizedBox(
                              width: Get.width,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Divider(
                                      color: defaultGray,
                                      height: Get.height * 0.0015,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(
                                      "atau",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: defaultGray,
                                        fontWeight: medium,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Divider(
                                      color: defaultGray,
                                      height: Get.height * 0.0015,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            ButtonCustom(
                                elevatedMode: false,
                                text: "Pilih dari Galeri",
                                onTap: () {
                                  controller.scanReceipt(true);
                                }),
                          ],
                        )
                      : Column(
                          children: [
                            Container(
                              width: Get.width,
                              height: Get.height * 0.58,
                              child: Image.file(
                                File(controller.imageFilePath!.path),
                                fit: BoxFit.contain,
                              ),
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: defaultGray, width: 0.5),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            Row(
                              children: [
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 12),
                                    child: ButtonCustom(
                                      text: 'Ulangi',
                                      elevatedMode: false,
                                      onTap: () {
                                        controller.resetScan();
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: Get.width * 0.028,
                                ),
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 12),
                                    child: ButtonCustom(
                                      text: 'Lanjut',
                                      onTap: () async {
                                        try {
                                          await controller.uploadReceipt();
                                        } catch (e) {
                                          print(e);
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
