import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pawang_mobile/config/theme_constants.dart';
import 'package:pawang_mobile/widgets/InputField.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';

class TambahPemasukanScreen extends StatefulWidget {
  static const String routeName = '/tambah-pemasukan';
  const TambahPemasukanScreen({Key? key}) : super(key: key);

  @override
  State<TambahPemasukanScreen> createState() => _TambahPemasukanScreenState();
}

class _TambahPemasukanScreenState extends State<TambahPemasukanScreen> {
  final TextEditingController nama_pemasukan = TextEditingController();
  final TextEditingController nominal_pemasukan = TextEditingController();
  final TextEditingController kategori_pemasukan = TextEditingController();
  final TextEditingController tanggal_pemasukan = TextEditingController();
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
                    "Tambah Pemasukan",
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
                  inputLabel: "Nama Pemasukan",
                  inputController: nama_pemasukan,
                  errorText: _inputData ? null : 'Nama Pemasukan wajib diisi',
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: InputField(
                  inputLabel: "Nominal",
                  inputController: nominal_pemasukan,
                  errorText: _inputData ? null : 'Nominal wajib diisi',
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: InputField(
                  inputLabel: "Kategori",
                  inputController: kategori_pemasukan,
                  errorText: _inputData ? null : 'Kategori wajib diisi',
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: InputField(
                  inputLabel: "Tanggal",
                  inputController: tanggal_pemasukan,
                  errorText: _inputData ? null : 'Tanggal wajib diisi',
                  enable: true,
                  readOnly: true,
                  keyboardType: TextInputType.none,
                  onTap: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2099))
                        .then((date) {});
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
                        onPressed: () {},
                        child: Text(
                          "Simpan Pemasukan",
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
