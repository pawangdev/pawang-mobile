import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/widgets/InputField.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';

class TambahPengeluaranScreen extends StatefulWidget {
  static const String routeName = '/tambah-pengeluaran';
  const TambahPengeluaranScreen({Key? key}) : super(key: key);

  @override
  State<TambahPengeluaranScreen> createState() =>
      _TambahPengeluaranScreenState();
}

class _TambahPengeluaranScreenState extends State<TambahPengeluaranScreen> {
  final TextEditingController nama_pengeluaran = TextEditingController();
  final TextEditingController nominal_pengeluaran = TextEditingController();
  final TextEditingController kategori_pengeluaran = TextEditingController();
  final TextEditingController tanggal_pengeluaran = TextEditingController();
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
                  IconBack(PurpleMode: true),
                  Text(
                    "Tambah Pengeluaran",
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
                height: 30,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: InputField(
                  inputLabel: "Nama Pengeluaran",
                  inputController: nama_pengeluaran,
                  errorText: _inputData ? null : 'Nama pengeluaran wajib diisi',
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: InputField(
                  inputLabel: "Nominal",
                  inputController: nominal_pengeluaran,
                  errorText: _inputData ? null : 'Nominal wajib diisi',
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: InputField(
                  inputLabel: "Kategori",
                  inputController: kategori_pengeluaran,
                  errorText: _inputData ? null : 'Kategori wajib diisi',
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: InputField(
                    inputLabel: "Tanggal",
                    inputController: tanggal_pengeluaran,
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
                            tanggal_pengeluaran.text = format;
                          });
                        }
                      });
                    }),
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
