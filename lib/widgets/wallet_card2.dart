import 'package:flutter/material.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/models/wallet_model.dart';
import 'package:pawang_mobile/modules/wallet/wallet.dart';
import 'package:pawang_mobile/utils/currency_format.dart';
import 'package:pawang_mobile/widgets/input_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';

class WalletCard2 extends StatelessWidget {
  final WalletsDataModel wallet;

  WalletCard2({Key? key, required this.wallet}) : super(key: key);

  final WalletController controller = Get.find();

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
            wallet.name,
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
            CurrencyFormat.convertToIdr(wallet.balance, 2),
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
                        controller.idWallet = wallet.id;
                        controller.nameTextController.text = wallet.name;
                        controller.balanceTextController.text =
                            wallet.balance.toString();
                        showModalBottomSheet<void>(
                          isScrollControlled: true,
                          enableDrag: true,
                          context: context,
                          builder: (BuildContext context) {
                            return Padding(
                              padding: MediaQuery.of(context).viewInsets,
                              child: Container(
                                height: 40.h,
                                color: kWhite,
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      // Nominal
                                      Text(
                                        'Ubah Data',
                                        style: kOpenSans.copyWith(
                                            fontSize: 18, fontWeight: bold),
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 20),
                                        child: Column(
                                          children: [
                                            InputField(
                                              inputLabel: "Nama Dompet",
                                              inputController:
                                                  controller.nameTextController,
                                              keyboardType: TextInputType.text,
                                              enable: true,
                                              // errorText: _inputData ? null : 'Nominal wajib diisi',
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            InputField(
                                              inputLabel: "Saldo",
                                              inputController: controller
                                                  .balanceTextController,
                                              keyboardType: TextInputType.text,
                                              enable: true,
                                              // errorText: _inputData ? null : 'Nominal wajib diisi',
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: SizedBox(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
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
                                              onPressed: () =>
                                                  controller.updateWallet(),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
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
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      side: const BorderSide(color: kError),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text(
                      'Hapus Dompet',
                      style: kOpenSans.copyWith(
                          color: kError, fontWeight: medium, fontSize: 16),
                    ),
                    onPressed: () {
                      controller.idWallet = wallet.id;
                      showDialog<void>(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) => AlertDialog(
                          title: Text(
                            'Hapus Dompet',
                            style: kOpenSans.copyWith(
                                fontSize: 18, fontWeight: bold),
                            textAlign: TextAlign.center,
                          ),
                          content: Text(
                            'Apakah kamu yakin akan menghapus dompet ini?',
                            style: kOpenSans.copyWith(
                                fontSize: 16, fontWeight: light),
                            textAlign: TextAlign.center,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: OutlinedButton(
                                    child: Text(
                                      "Kembali",
                                      style: kOpenSans.copyWith(
                                          fontSize: 16,
                                          fontWeight: medium,
                                          color: kPrimary),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context, 'Kembali');
                                    },
                                    style: OutlinedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4),
                                      side: const BorderSide(color: kPrimary),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 1.w),
                                Expanded(
                                  child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4),
                                      side: const BorderSide(color: kError),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                    ),
                                    child: Text(
                                      'Hapus',
                                      style: kOpenSans.copyWith(
                                          color: kError,
                                          fontWeight: medium,
                                          fontSize: 16),
                                    ),
                                    onPressed: () {
                                      controller.deleteWallet();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
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
