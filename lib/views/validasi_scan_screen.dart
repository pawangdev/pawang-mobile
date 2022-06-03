import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/views/riwayat_screen.dart';
import 'package:pawang_mobile/models/pengeluaran_model.dart';
import 'package:pawang_mobile/services/pengeluaran_service.dart';
import 'package:pawang_mobile/views/dashboard_screen.dart';
import 'package:pawang_mobile/widgets/input_field.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ValidasiScanScreen extends StatefulWidget {
  static const String routeName = '/validasi-scan';
  const ValidasiScanScreen({Key? key}) : super(key: key);

  @override
  State<ValidasiScanScreen> createState() => _ValidasiScanScreenState();
}

class _ValidasiScanScreenState extends State<ValidasiScanScreen> {
  final TextEditingController namaPengeluaran = TextEditingController();
  final TextEditingController nominalPengeluaran = TextEditingController();
  final TextEditingController kategoriPengeluaran = TextEditingController();
  final TextEditingController tanggalPengeluaran = TextEditingController();
  String? filePath;
  bool _validated = false;

  Future<void> simpanData(PengeluaranModel data) async {
    try {
      await PengeluaranService().create(data);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ArgumentsValidation;
    nominalPengeluaran.text = args.nominal;
    filePath = args.filePath;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 33.0, horizontal: 32.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconBack(
                      blueMode: true,
                      onTap: () {
                        Navigator.pop(context);
                      }),
                  Text(
                    "Validasi Scan Struk",
                    style: kOpenSans.copyWith(
                        fontSize: 16, fontWeight: bold, color: kBlack),
                  ),
                  Container(
                    width: 7.2.w,
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Mohon Lakukan Validasi untuk Menghindari Kesalahan",
                style: kOpenSans.copyWith(fontSize: 0.2.dp),
              ),
              SizedBox(
                height: 3.4.h,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: InputField(
                  inputLabel: "Nama Pengeluaran",
                  inputController: namaPengeluaran,
                  errorText: _validated ? null : 'Nama Pengeluaran wajib diisi',
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: InputField(
                  inputLabel: "Nominal",
                  inputController: nominalPengeluaran,
                  errorText: _validated ? null : 'Nominal wajib diisi',
                  enable: false,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: InputField(
                  inputLabel: "Kategori",
                  inputController: kategoriPengeluaran,
                  errorText: _validated ? null : 'Kategori wajib diisi',
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: InputField(
                  inputLabel: "Tanggal",
                  inputController: tanggalPengeluaran,
                  errorText: _validated ? null : 'Tanggal wajib diisi',
                  keyboardType: TextInputType.none,
                  onTap: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2099))
                        .then((date) {
                      if (date != null) {
                        initializeDateFormatting('id_ID', null);
                        String format = DateFormat.yMMMMd('id_ID').format(date);
                        setState(() {
                          tanggalPengeluaran.text = format;
                        });
                      }
                    });
                  },
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(vertical: 15),
                          ),
                          backgroundColor: MaterialStateProperty.all(kPrimary),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(kDefaultBorderRadius),
                            ),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            namaPengeluaran.text.isEmpty
                                ? _validated = false
                                : _validated = true;
                            nominalPengeluaran.text.isEmpty
                                ? _validated = false
                                : _validated = true;
                            kategoriPengeluaran.text.isEmpty
                                ? _validated = false
                                : _validated = true;
                            tanggalPengeluaran.text.isEmpty
                                ? _validated = false
                                : _validated = true;
                          });

                          if (_validated) {
                            try {
                              PengeluaranModel data = PengeluaranModel(
                                  namaPengeluaran: namaPengeluaran.text,
                                  nominalPengeluaran:
                                      double.parse(nominalPengeluaran.text),
                                  kategoriPengeluaran: kategoriPengeluaran.text,
                                  tanggalPengeluaran: tanggalPengeluaran.text,
                                  filePath: filePath.toString());
                              simpanData(data).then((value) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("Sukses menyimpan data"),
                                  backgroundColor: kSuccess,
                                ));

                                Navigator.pushNamedAndRemoveUntil(context,
                                    RiwayatScreen.routeName, (route) => false);
                              });
                            } catch (e) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(e.toString()),
                                backgroundColor: kError,
                              ));
                            }
                          }
                        },
                        child: Text(
                          "Simpan Pengeluaran",
                          style: kOpenSans.copyWith(
                            fontSize: 0.253.dp,
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

class ArgumentsValidation {
  String nominal;
  String filePath;

  ArgumentsValidation({required this.filePath, required this.nominal});
}
