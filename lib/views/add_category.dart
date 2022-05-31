import 'package:flutter/material.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/widgets/InputField.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';

class AddCategoryScreen extends StatefulWidget {
  static const String routeName = '/tambah-kategori';
  const AddCategoryScreen({Key? key}) : super(key: key);

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  final TextEditingController nama_kategori = TextEditingController();
  final TextEditingController icon_kategori = TextEditingController();
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
                    "Tambah Kategori",
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
                  inputLabel: "Nama Kategori",
                  inputController: nama_kategori,
                  errorText: _inputData ? null : 'Nama Kategori wajib diisi',
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: InputField(
                  inputLabel: "Icon",
                  inputController: icon_kategori,
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
