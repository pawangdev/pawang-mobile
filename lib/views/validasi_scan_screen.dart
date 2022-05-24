import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawang_mobile/config/theme_constants.dart';
import 'package:pawang_mobile/models/PengeluaranModel.dart';
import 'package:pawang_mobile/services/PengeluaranService.dart';
import 'package:pawang_mobile/views/riwayat_screen.dart';
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
    nominal_pengeluaran.text = args.nominal;
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
                  InkWell(
                    child: Container(
                      width: 32,
                      height: 32,
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        border: Border.all(color: kPrimary),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: SvgPicture.asset(
                        'assets/images/back_btn.svg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
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
                  errorText: _validated ? null : 'Nama Pengeluaran wajib diisi',
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: InputField(
                  inputLabel: "Nominal",
                  inputController: nominal_pengeluaran,
                  errorText: _validated ? null : 'Nominal wajib diisi',
                  enable: false,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: InputField(
                  inputLabel: "Kategori",
                  inputController: kategori_pengeluaran,
                  errorText: _validated ? null : 'Kategori wajib diisi',
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: InputField(
                  inputLabel: "Tanggal",
                  inputController: tanggal_pengeluaran,
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
                          tanggal_pengeluaran.text = format;
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
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: 15),
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
                            nama_pengeluaran.text.isEmpty
                                ? _validated = false
                                : _validated = true;
                            nominal_pengeluaran.text.isEmpty
                                ? _validated = false
                                : _validated = true;
                            kategori_pengeluaran.text.isEmpty
                                ? _validated = false
                                : _validated = true;
                            tanggal_pengeluaran.text.isEmpty
                                ? _validated = false
                                : _validated = true;
                          });

                          if (_validated) {
                            try {
                              PengeluaranModel data = PengeluaranModel(
                                  nama_pengeluaran: nama_pengeluaran.text,
                                  nominal_pengeluaran:
                                      double.parse(nominal_pengeluaran.text),
                                  kategori_pengeluaran:
                                      kategori_pengeluaran.text,
                                  tanggal_pengeluaran: tanggal_pengeluaran.text,
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

class ArgumentsValidation {
  String nominal;
  String filePath;

  ArgumentsValidation({required this.filePath, required this.nominal});
}
