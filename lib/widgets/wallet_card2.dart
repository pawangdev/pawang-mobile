import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/models/wallet_model.dart';
import 'package:pawang_mobile/modules/wallet/wallet.dart';
import 'package:pawang_mobile/utils/currency_format.dart';
import 'package:pawang_mobile/widgets/button_custom.dart';
import 'package:pawang_mobile/widgets/input_field.dart';

// ignore: must_be_immutable
class WalletCard2 extends StatelessWidget {
  final WalletDataModel wallet;
  bool isChoose = false;

  WalletCard2({Key? key, required this.wallet, required this.isChoose})
      : super(key: key);

  final WalletController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      width: Get.width,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: Get.width * 0.5,
            child: Text(
              wallet.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: kOpenSans.copyWith(
                color: defaultPrimary,
                fontWeight: semiBold,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(
            height: Get.height * 0.014,
          ),
          Text(
            CurrencyFormat.convertToIdr(wallet.balance, 2),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: kOpenSans.copyWith(
              color: defaultBlack,
              fontWeight: medium,
              fontSize: 15,
            ),
          ),
          isChoose == false
              ? const SizedBox(
                  height: 15,
                )
              : const SizedBox(),
          isChoose == false
              ? Row(
                  children: [
                    Expanded(
                        child: ButtonCustom(
                      text: 'Edit Dompet',
                      onTap: () {
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
                                height: Get.height * 0.45,
                                color: defaultWhite,
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
                                            fontSize: 16, fontWeight: bold),
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.04,
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
                                              height: Get.height * 0.035,
                                            ),
                                            InputField(
                                              inputLabel: "Saldo",
                                              inputController: controller
                                                  .balanceTextController,
                                              keyboardType:
                                                  TextInputType.number,
                                              enable: true,
                                              // errorText: _inputData ? null : 'Nominal wajib diisi',
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                          child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: ButtonCustom(
                                          text: 'Simpan Perubahan',
                                          onTap: () =>
                                              controller.updateWallet(),
                                        ),
                                      )),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ).then((value) => controller.resetAllInput());
                      },
                    )),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: ButtonCustom(
                        text: 'Hapus Dompet',
                        elevatedMode: false,
                        blueMode: false,
                        onTap: () {
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: ButtonCustom(
                                        text: 'Kembali',
                                        elevatedMode: false,
                                        onTap: () {
                                          Navigator.pop(context, 'Kembali');
                                        },
                                      ),
                                    ),
                                    SizedBox(width: Get.width * 0.01),
                                    Expanded(
                                        child: ButtonCustom(
                                      text: 'Hapus',
                                      elevatedMode: false,
                                      blueMode: false,
                                      onTap: () {
                                        controller.deleteWallet();
                                      },
                                    )),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )
              : const SizedBox()
        ],
      ),
      decoration: BoxDecoration(
          color: defaultWhite,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: defaultBlack.withOpacity(0.07),
              spreadRadius: 2,
              blurRadius: 10,
            )
          ]),
    );
  }
}
