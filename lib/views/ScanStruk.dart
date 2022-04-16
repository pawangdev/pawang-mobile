import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pawang_mobile/config/theme_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

class ScanStruk extends StatefulWidget {
  static const String routeName = "/scan-struk";
  const ScanStruk({Key? key}) : super(key: key);

  @override
  State<ScanStruk> createState() => _ScanStrukState();
}

class _ScanStrukState extends State<ScanStruk> {
  XFile? _image;

  final ImagePicker _picker = ImagePicker();

  Future getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    final inputImage = InputImage.fromFilePath(image!.path);

    if (image != null) {
      setState(() {
        _image = image;
      });
      searchTotal(inputImage);
    }
  }

  Future searchTotal(InputImage image) async {
    final textDetector = GoogleMlKit.vision.textDetector();
    final RecognisedText recognisedText =
        await textDetector.processImage(image);
    final findTotal = <double>[];
    double total_belanja = 0;
    double temp;
    int counter = 0;
    bool found = false;

    for (TextBlock block in recognisedText.blocks) {
      for (TextLine line in block.lines) {
        print('text : ${line.text} | corner : ${line.cornerPoints}');
        if (line.text.contains(RegExp(r'[A-Z]')) ||
            line.text.contains(RegExp(r'[a-z]')) ||
            line.text.contains(RegExp(r'=')) &&
                !line.text.contains(RegExp(r'Rp')) &&
                !line.text.contains(RegExp(r'RP'))) {
          counter++;
          if (line.text.contains(RegExp(r'total')) ||
              line.text.contains(RegExp(r'TOTAL')) &&
                  line.text.compareTo('Subtotal') != 0 &&
                  line.text.compareTo('SUBTOTAL') != 0) {
            found = true;
          }
        } else {
          if (found) {
            String a = line.text.replaceAll(RegExp('[^A-Za-z0-9]'), '');
            if (a.contains(' ')) {
              a = a.replaceAll(RegExp(r' '), '');
            }
            if (a.contains('Rp') || a.contains('Rp.') || a.contains('Rp. ')) {
              a = a.replaceAll(RegExp(r'Rp'), '');
            } else if (a.contains('RP') ||
                a.contains('RP.') ||
                a.contains('RP. ')) {
              a = a.replaceAll(RegExp(r'RP'), '');
            }
            if (a.compareTo('') != 0) {
              findTotal.add(double.parse(a));
            }
          }
        }
      }
      counter = 0;
    }
    
    temp = findTotal[0];
    for (double i in findTotal) {
      if (i >= temp) {
        total_belanja = i;
      } else {
        temp = i;
      }
    }
    print('total belanja : ${total_belanja}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 33.0, horizontal: 32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: Container(
                      width: 32,
                      height: 32,
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        border: Border.all(color: kPurple),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: SvgPicture.asset(
                        'assets/images/back_btn.svg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    onTap: () {
                      // Navigator.pushNamed(context, Riwayat.routeName)
                    },
                  ),
                  Text(
                    "Scan Struk",
                    style: kOpenSans.copyWith(
                        fontSize: 16, fontWeight: bold, color: kBlack),
                  ),
                  Container(
                    width: 65,
                    height: 32,
                    padding: EdgeInsets.all(6),
                  ),
                ],
              ),
              const SizedBox(
                height: 33,
              ),
              Center(
                child: Text(
                  "Mohon atur posisi struk agar dapat terdeteksi",
                  style: kOpenSans.copyWith(color: kBlack),
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              // ----- BOX IMAGE -----
              SizedBox(
                width: double.infinity,
                child: Container(
                  child: _image != null
                      ? Image.file(File(_image!.path))
                      : Center(
                          child: Text(
                            "Silahkan Inputkan Struk Terlebih Dahulu",
                            style: kOpenSans.copyWith(
                                color: kGray, fontSize: 12, fontWeight: medium),
                          ),
                        ),
                  height: 440,
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    border: Border.all(color: kGray),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Flexible(
                fit: FlexFit.loose,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        child: SvgPicture.asset(
                          'assets/images/scan_btn.svg',
                          fit: BoxFit.cover,
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(kPurple),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.all(14)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)))),
                        onPressed: () {}),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      "---------------------    Atau    ---------------------",
                      style: kOpenSans.copyWith(
                          color: kGray, fontSize: 14, fontWeight: light),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                            child: Text(
                              "Pilih dari Galeri",
                              style: kOpenSans.copyWith(
                                  fontSize: 16,
                                  fontWeight: bold,
                                  color: kPurple),
                            ),
                            onPressed: getImage,
                            style: OutlinedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                side: const BorderSide(color: kPurple),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12))))),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
