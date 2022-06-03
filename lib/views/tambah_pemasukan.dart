import 'package:flutter/material.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/widgets/input_field.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TambahPemasukanScreen extends StatefulWidget {
  static const String routeName = '/tambah-pemasukan';
  const TambahPemasukanScreen({Key? key}) : super(key: key);

  @override
  State<TambahPemasukanScreen> createState() => _TambahPemasukanScreenState();
}

class _TambahPemasukanScreenState extends State<TambahPemasukanScreen> {
  final TextEditingController namaPemasukan = TextEditingController();
  final TextEditingController nominalPemasukan = TextEditingController();
  final TextEditingController kategoriPemasukan = TextEditingController();
  final TextEditingController tanggalPemasukan = TextEditingController();
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
                    "Tambah Pemasukan",
                    style: kOpenSans.copyWith(
                        fontSize: 16, fontWeight: bold, color: kBlack),
                  ),
                  Container(
                    width: 7.2.w,
                  ),
                ],
              ),
              SizedBox(
                height: 3.4.h,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: InputField(
                  inputLabel: "Nama Pemasukan",
                  inputController: namaPemasukan,
                  errorText: _inputData ? null : 'Nama Pemasukan wajib diisi',
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: InputField(
                  inputLabel: "Nominal",
                  inputController: nominalPemasukan,
                  errorText: _inputData ? null : 'Nominal wajib diisi',
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: InputField(
                  inputLabel: "Kategori",
                  inputController: kategoriPemasukan,
                  errorText: _inputData ? null : 'Kategori wajib diisi',
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: InputField(
                  inputLabel: "Tanggal",
                  inputController: tanggalPemasukan,
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
                          "Simpan Pemasukan",
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
