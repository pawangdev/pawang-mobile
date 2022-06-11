import 'dart:io' as file;
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pawang_mobile/services/scan_service.dart';
import 'package:pawang_mobile/views/dashboard_screen.dart';
import 'package:pawang_mobile/views/setting_screen.dart';
import 'package:pawang_mobile/views/validasi_scan_screen.dart';
import 'package:pawang_mobile/widgets/icon_bottom.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ScanStruk extends StatefulWidget {
  static const String routeName = "/scan-struk";
  const ScanStruk({Key? key}) : super(key: key);

  @override
  State<ScanStruk> createState() => _ScanStrukState();
}

class _ScanStrukState extends State<ScanStruk> {
  XFile? _image;
  // dynamic _pickImageError;
  // late InputImage inputImage;
  // final ImagePicker _picker = ImagePicker();

  late String nominal;
  late String imageFilePath;

  scanReceipt(bool is_fromGal) async {
    // GET AND CROP THE IMAGE
    try {
      final image = await ScanService().getImage(is_fromGal);
      if (image != null) {
        setState(() {
          _image = image;
          imageFilePath = _image!.path.toString();
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 33.0, horizontal: 32.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Text(
                    "Scan Struk",
                    //0.253.dp
                    style: kOpenSans.copyWith(
                        fontSize: 16, fontWeight: bold, color: kBlack),
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
                    style: kOpenSans.copyWith(fontSize: 12, color: kBlack),
                  ),
                ),
                SizedBox(
                  height: 3.2.h,
                ),
                // ----- BOX IMAGE -----
                Expanded(
                  child: Container(
                    child: _image != null
                        ? Image.file(
                            file.File(_image!.path),
                            fit: BoxFit.contain,
                          )
                        : Center(
                            child: Text(
                              "Silahkan pilih struk terlebih dahulu",
                              //0.22.dp
                              style: kOpenSans.copyWith(
                                  color: kGray,
                                  fontSize: 10,
                                  fontWeight: medium),
                            ),
                          ),
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      border: Border.all(color: kGray, width: 0.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SizedBox(height: 1.75.h),
                _image == null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(kDefaultBorderRadius),
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [kPrimary, kPurple])),
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
                                onPressed: () => scanReceipt(false)),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 20),
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Divider(
                                    color: kBlack,
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
                                      color: kGray,
                                      fontWeight: medium,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Divider(
                                    color: kBlack,
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
                                      color: kPrimary),
                                ),
                                onPressed: () => scanReceipt(true),
                                style: OutlinedButton.styleFrom(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                  side: const BorderSide(color: kPrimary),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Row(children: [
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
                                    color: kPrimary),
                              ),
                              onPressed: () {
                                setState(() {
                                  _image = null;
                                });
                              },
                              style: OutlinedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                side: const BorderSide(color: kPrimary),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        kDefaultBorderRadius)),
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
                                    backgroundColor:
                                        MaterialStateProperty.all(kPrimary),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            kDefaultBorderRadius),
                                      ),
                                    ),
                                  ),
                                  onPressed: () async {
                                    try {
                                      await ScanService()
                                          .cropImage(_image)
                                          .then((imageCropped) async {
                                        var response = await ScanService()
                                            .uploadImage(imageCropped!);
                                        print(response);
                                        setState(() {
                                          nominal = response;
                                        });
                                      });
                                      Navigator.pushNamed(
                                          context, ValidasiScanScreen.routeName,
                                          arguments: ArgumentsValidation(
                                              nominal: nominal,
                                              filePath: imageFilePath =
                                                  _image!.path));
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
                                        backgroundColor: kError,
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
                                  ))),
                        ),
                      ]),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: SizedBox(
            height: 8.h,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 42),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconBottomBar(
                      text: "Beranda",
                      iconEnable: "assets/images/home1.png",
                      iconDisable: "assets/images/home2.png",
                      selected: false,
                      onPressed: () {
                        Navigator.pushNamed(context, DashboardScreen.routeName);
                      }),
                  IconBottomBar(
                      text: "Scan Struk",
                      iconEnable: "assets/images/scan1.png",
                      iconDisable: "assets/images/scan2.png",
                      selected: true,
                      onPressed: () {
                        Navigator.pushNamed(context, ScanStruk.routeName);
                      }),
                  IconBottomBar(
                      text: "Pengaturan",
                      iconEnable: "assets/images/setting1.png",
                      iconDisable: "assets/images/setting2.png",
                      selected: false,
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
