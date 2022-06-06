import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/widgets/input_field.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TambahPengeluaranScreen extends StatefulWidget {
  static const String routeName = '/tambah-pengeluaran';
  const TambahPengeluaranScreen({Key? key}) : super(key: key);

  @override
  State<TambahPengeluaranScreen> createState() =>
      _TambahPengeluaranScreenState();
}

class _TambahPengeluaranScreenState extends State<TambahPengeluaranScreen> {
  final TextEditingController namaPengeluaran = TextEditingController();
  final TextEditingController nominalPengeluaran = TextEditingController();
  final TextEditingController kategoriPengeluaran = TextEditingController();
  final TextEditingController tanggalPengeluaran = TextEditingController();
  bool _inputData = true;

  @override
  Widget build(BuildContext context) {
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
                    },
                  ),
                  Text(
                    "Tambah Pengeluaran",
                    style: kOpenSans.copyWith(
                        fontSize: 16, fontWeight: bold, color: kBlack),
                  ),
                  Container(width: 7.2.w),
                ],
              ),
              SizedBox(
                height: 3.2.h,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: InputField(
                  inputLabel: "Nama Pengeluaran",
                  inputController: namaPengeluaran,
                  errorText: _inputData ? null : 'Nama pengeluaran wajib diisi',
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: InputField(
                  inputLabel: "Nominal",
                  inputController: nominalPengeluaran,
                  errorText: _inputData ? null : 'Nominal wajib diisi',
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: InputField(
                  inputLabel: "Kategori",
                  inputController: kategoriPengeluaran,
                  errorText: _inputData ? null : 'Kategori wajib diisi',
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: InputField(
                    inputLabel: "Tanggal",
                    inputController: tanggalPengeluaran,
                    errorText: _inputData ? null : 'Tanggal wajib diisi',
                    enable: true,
                    readOnly: false,
                    keyboardType: TextInputType.none,
                    onTap: () {
                      showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2099))
                          .then((date) {
                        if (date != null) {
                          //initializeDateFormatting('id_ID', null);
                          String format =
                              DateFormat.yMMMMd('id_ID').format(date);
                          setState(() {
                            tanggalPengeluaran.text = format;
                          });
                        }
                      });
                    }),
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
