import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawang_mobile/config/theme_constants.dart';
import 'package:pawang_mobile/views/scan_struk_screen.dart';
import 'package:pawang_mobile/widgets/InputField.dart';

class ValidasiScanScreen extends StatefulWidget {
  static const String routeName = '/validasi-scan';
  const ValidasiScanScreen({Key? key}) : super(key: key);

  @override
  State<ValidasiScanScreen> createState() => _ValidasiScanScreenState();
}

class _ValidasiScanScreenState extends State<ValidasiScanScreen> {
  final TextEditingController nama_pengeluaran = TextEditingController();
  final TextEditingController nominal_pengeluaran = TextEditingController();
  final TextEditingController kategori_pengeluaran = TextEditingController();
  final TextEditingController tanggal_pengeluaran = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final nominal = ModalRoute.of(context)!.settings.arguments as String;
    nominal_pengeluaran.text = nominal;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 33.0, horizontal: 32.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 32,
                      height: 32,
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        border: Border.all(color: kPurple),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: InkWell(
                        child: SvgPicture.asset(
                          'assets/images/back_btn.svg',
                          fit: BoxFit.cover,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  Text(
                    "Validasi Scan Struk",
                    style: kOpenSans.copyWith(
                        fontSize: 16, fontWeight: bold, color: kBlack),
                  ),
                  Container(
                    width: 32,
                    height: 32,
                    padding: EdgeInsets.all(6),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Mohon Lakukan Validasi untuk Menghindari Kesalahan",
                style: kOpenSans.copyWith(fontSize: 12),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: InputField(
                  inputLabel: "Nama Pengeluaran",
                  inputController: nama_pengeluaran,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: InputField(
                  inputLabel: "Nominal",
                  inputController: nominal_pengeluaran,
                  enable: false,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: InputField(
                  inputLabel: "Kategori",
                  inputController: kategori_pengeluaran,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: InputField(
                  inputLabel: "Tanggal",
                  inputController: tanggal_pengeluaran,
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: 15),
                          ),
                          backgroundColor: MaterialStateProperty.all(kPurple),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(kDefaultBorderRadius),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Simpan Pengeluaran",
                          style: kOpenSans.copyWith(
                            fontSize: 16,
                            fontWeight: bold,
                          ),
                        )),
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
