import 'dart:io';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/modules/scan_receipe/scan_receipe.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScanReceipeView extends StatelessWidget {
  final ScanReceipeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 33.0, horizontal: 32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text(
                  "Scan Struk",
                  //0.253.dp
                  style: kOpenSans.copyWith(
                      fontSize: 16, fontWeight: bold, color: defaultBlack),
                ),
              ),
              SizedBox(
                height: 3.8.h,
              ),
              Center(
                child: Text(
                  "Mohon atur posisi struk agar dapat terdeteksi",
                  //0.23.dp
                  textAlign: TextAlign.center,
                  style: kOpenSans.copyWith(fontSize: 12, color: defaultBlack),
                ),
              ),
              SizedBox(
                height: 3.2.h,
              ),
              // ----- BOX IMAGE -----
              Expanded(
                child: Container(
                  child: GetBuilder<ScanReceipeController>(
                    builder: (controller) => controller.imageFilePath != null
                        ? Image.file(
                            File(controller.imageFilePath!.path),
                            fit: BoxFit.contain,
                          )
                        : Center(
                            child: Text(
                              "Silahkan pilih struk terlebih dahulu",
                              //0.22.dp
                              style: kOpenSans.copyWith(
                                  color: defaultGray,
                                  fontSize: 10,
                                  fontWeight: medium),
                            ),
                          ),
                  ),
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    border: Border.all(color: defaultGray, width: 0.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 1.75.h),
              SizedBox(
                child: GetBuilder<ScanReceipeController>(
                  builder: (controller) => controller.imageFilePath == null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      defaultBorderRadius),
                                  gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [defaultPrimary, defaultPurple])),
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
                                                  BorderRadius.circular(12)))),
                                  onPressed: () {
                                    controller.scanReceipt(false);
                                  }),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 20),
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Divider(
                                      color: defaultBlack,
                                      height: 0.15.h,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(
                                      "atau",
                                      //0.235.dp
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: defaultGray,
                                        fontWeight: medium,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Divider(
                                      color: defaultBlack,
                                      height: 0.15.h,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 12),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: OutlinedButton(
                                  child: Text(
                                    "Pilih dari Galeri",
                                    //0.255.dp
                                    style: kOpenSans.copyWith(
                                        fontSize: 16,
                                        fontWeight: bold,
                                        color: defaultPrimary),
                                  ),
                                  onPressed: () {
                                    controller.scanReceipt(true);
                                  },
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    side:
                                        const BorderSide(color: defaultPrimary),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            Flexible(
                              fit: FlexFit.tight,
                              child: Container(
                                margin: const EdgeInsets.only(top: 12),
                                child: OutlinedButton(
                                  child: Text(
                                    "Ulangi",
                                    //0.235.dp
                                    style: kOpenSans.copyWith(
                                        fontSize: 14,
                                        fontWeight: bold,
                                        color: defaultPrimary),
                                  ),
                                  onPressed: () {
                                    controller.resetScan();
                                  },
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    side:
                                        const BorderSide(color: defaultPrimary),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            defaultBorderRadius)),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 2.8.w,
                            ),
                            Flexible(
                              fit: FlexFit.tight,
                              child: Container(
                                margin: const EdgeInsets.only(top: 12),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                      const EdgeInsets.symmetric(vertical: 12),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                        defaultPrimary),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            defaultBorderRadius),
                                      ),
                                    ),
                                  ),
                                  onPressed: () async {
                                    try {
                                      controller.uploadReceipt();
                                      // setState(() {
                                      //   _isLoading = true;
                                      // });
                                      // await ScanService()
                                      //     .cropImage(_image)
                                      //     .then((imageCropped) async {
                                      //   try {
                                      //     var response = await ScanService()
                                      //         .uploadImage(imageCropped!);
                                      //     if (response
                                      //         .toString()
                                      //         .isNotEmpty) {
                                      //       // setState(() {
                                      //       //   _isLoading = false;
                                      //       // });

                                      //       // setState(() {
                                      //       //   nominal = response;
                                      //       // });
                                      //     } else {
                                      //       // setState(() {
                                      //       //   _isLoading = false;
                                      //       // });
                                      //     }
                                      //   } catch (e) {
                                      //     // setState(() {
                                      //     //   _isLoading = false;
                                      //     // });
                                      //   }
                                      // });
                                      // Navigator.pushNamed(context,
                                      //     ValidasiScanScreen.routeName,
                                      //     arguments: ArgumentsValidation(
                                      //         nominal: nominal,
                                      //         filePath: imageFilePath =
                                      //             _image!.path));
                                    } catch (e) {
                                      Flushbar(
                                        message:
                                            "Tidak Dapat Menemukan Total !",
                                        icon: const Icon(
                                          Icons.check,
                                          size: 28.0,
                                          color: Colors.white,
                                        ),
                                        margin: const EdgeInsets.all(8),
                                        borderRadius: BorderRadius.circular(8),
                                        backgroundColor: defaultError,
                                        duration: const Duration(seconds: 3),
                                      ).show(context);
                                    }
                                  },
                                  child: Text(
                                    "Lanjut",
                                    style: kOpenSans.copyWith(
                                      fontSize: 14,
                                      fontWeight: bold,
                                    ),
                                  ),
                                ),
                              ),
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
