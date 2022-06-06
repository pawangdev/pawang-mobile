import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/services/wallet_service.dart';
import 'package:pawang_mobile/views/dashboard_screen.dart';
import 'package:pawang_mobile/widgets/input_field.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddWalletScreen extends StatefulWidget {
  static const String routeName = '/tambah-dompet';
  const AddWalletScreen({Key? key}) : super(key: key);

  @override
  State<AddWalletScreen> createState() => _AddWalletScreenState();
}

class _AddWalletScreenState extends State<AddWalletScreen> {
  final TextEditingController namaDompet = TextEditingController();
  final TextEditingController nominalDompet = TextEditingController();
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
                    "Tambah Dompet",
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
                  inputLabel: "Nama Dompet",
                  inputController: namaDompet,
                  errorText: _inputData ? null : 'Nama Dompet wajib diisi',
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: InputField(
                  inputLabel: "Saldo Awal",
                  inputController: nominalDompet,
                  keyboardType: TextInputType.number,
                  errorText: _inputData ? null : 'Saldo Awal wajib diisi',
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
                          var data = <String, dynamic>{
                            'name': namaDompet.text,
                            'balance': int.parse(nominalDompet.text),
                          };

                          WalletService().createWallet(data).then((value) {
                            if (value == true) {
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                DashboardScreen.routeName,
                                (route) => false,
                              );

                              Flushbar(
                                message: "Berhasil Membuat Wallet !",
                                icon: const Icon(
                                  Icons.check,
                                  size: 28.0,
                                  color: Colors.white,
                                ),
                                margin: const EdgeInsets.all(8),
                                borderRadius: BorderRadius.circular(8),
                                backgroundColor: kSuccess,
                                duration: const Duration(seconds: 3),
                              ).show(context);
                            }
                          });
                        },
                        child: Text(
                          "Simpan Dompet",
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
