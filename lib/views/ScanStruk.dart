import 'package:flutter/material.dart';
import 'package:pawang_mobile/config/theme_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScanStruk extends StatelessWidget {
  const ScanStruk({Key? key}) : super(key: key);

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
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                      foregroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                      shadowColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                    onPressed: () {},
                    child: Container(
                      width: 32,
                      height: 32,
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        border: Border.all(color: kPurple),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: InkWell(
                        child: SvgPicture.asset(
                          'assets/images/back_btn.svg',
                          fit: BoxFit.cover,
                        ),
                        onTap: () => {},
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Center(
                      child: Text(
                        "Scan Struk",
                        style: kOpenSans.copyWith(
                            fontSize: 16, fontWeight: bold, color: kBlack),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 33,
              ),
              Text(
                "Mohon atur posisi struk agar dapat terdeteksi",
                style: kOpenSans.copyWith(color: kBlack),
              ),
              const SizedBox(
                height: 28,
              ),
              Container(
                width: 320,
                height: 440,
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  border: Border.all(color: kGray),
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              Flexible(
                fit: FlexFit.loose,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(kPurple),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.all(12)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)))),
                        child: SvgPicture.asset(
                          'assets/images/scan_btn.svg',
                          fit: BoxFit.cover,
                        )),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Atau",
                      style: kOpenSans.copyWith(color: kGray),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Flexible(
                          fit: FlexFit.tight,
                          flex: 1,
                          child: OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                  side: const BorderSide(color: kPurple),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12))),
                              child: Text(
                                "Pilih dari Galeri",
                                style: kOpenSans.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                    color: kPurple),
                              )),
                        )
                      ],
                    ),
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
