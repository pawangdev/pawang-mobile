import 'package:flutter/material.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/widgets/input_field.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddCategoryScreen extends StatefulWidget {
  static const String routeName = '/tambah-kategori';
  const AddCategoryScreen({Key? key}) : super(key: key);

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  final TextEditingController namaKategori = TextEditingController();
  final TextEditingController iconKategori = TextEditingController();
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
                    "Tambah Kategori",
                    style: kOpenSans.copyWith(
                        fontSize: 16, fontWeight: bold, color: kBlack),
                  ),
                  Container(
                    width: 7.2.w,
                    padding: const EdgeInsets.all(6),
                  ),
                ],
              ),
              SizedBox(
                height: 3.4.h,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: InputField(
                  inputLabel: "Nama Kategori",
                  inputController: namaKategori,
                  errorText: _inputData ? null : 'Nama Kategori wajib diisi',
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: InputField(
                  inputLabel: "Icon",
                  inputController: iconKategori,
                  errorText: _inputData ? null : 'Icon wajib diisi',
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
                          "Tambah Kategori",
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
