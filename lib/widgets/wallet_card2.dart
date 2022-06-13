import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/widgets/input_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WalletCard2 extends StatefulWidget {
  final String name;
  final String balance;

  const WalletCard2({Key? key, required this.name, required this.balance})
      : super(key: key);

  @override
  State<WalletCard2> createState() => _WalletCard2State();
}

class _WalletCard2State extends State<WalletCard2> {
  final TextEditingController _walletTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.name,
            //snapshot.data!.data[index].name,
            style: kOpenSans.copyWith(
              color: kPrimary,
              fontWeight: semibold,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 1.4.h,
          ),
          Text(
            'Rp. ' + widget.balance.toString(),
            //${snapshot.data!.data[index].balance}',
            style: kOpenSans.copyWith(
              color: kBlack,
              fontWeight: medium,
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 4.95.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [kPrimary, kPurple])),
                  child: TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(vertical: 1)),
                      ),
                      child: Text(
                        'Edit Dompet',
                        style: kOpenSans.copyWith(
                            color: kWhite, fontWeight: medium, fontSize: 16),
                      ),
                      onPressed: () {
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: 40.h,
                              color: kWhite,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // Nominal
                                    Text(
                                      'Ubah Data',
                                      style: kOpenSans.copyWith(
                                          fontSize: 18, fontWeight: bold),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 20),
                                      child: InputField(
                                        inputLabel: "Nominal",
                                        inputController: _walletTextController,
                                        keyboardType: TextInputType.number,
                                        enable: true,
                                        // errorText: _inputData ? null : 'Nominal wajib diisi',
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: ElevatedButton(
                                              style: ButtonStyle(
                                                padding:
                                                    MaterialStateProperty.all(
                                                        const EdgeInsets.all(
                                                            10)),
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        kPrimary),
                                                shape:
                                                    MaterialStateProperty.all(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                ),
                                              ),
                                              child: Text(
                                                'Simpan Perubahan',
                                                style: kOpenSans.copyWith(
                                                    color: kWhite,
                                                    fontWeight: medium,
                                                    fontSize: 16),
                                              ),
                                              onPressed: () {}),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      side: const BorderSide(color: kError),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text(
                      'Hapus Dompet',
                      style: kOpenSans.copyWith(
                          color: kError, fontWeight: medium, fontSize: 16),
                    ),
                    onPressed: () {}),
              ),
            ],
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: kWhite,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: kBlack.withOpacity(0.07),
              spreadRadius: 2,
              blurRadius: 10,
            )
          ]),
    );
  }
}
