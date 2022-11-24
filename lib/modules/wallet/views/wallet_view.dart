// ignore_for_file: use_key_in_widget_constructors

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/modules/dashboard/dashboard.dart';
import 'package:pawang_mobile/modules/transaction/transaction.dart';
import 'package:pawang_mobile/modules/wallet/wallet.dart';
import 'package:pawang_mobile/routes/routes.dart';
import 'package:pawang_mobile/utils/currency_format.dart';
import 'package:pawang_mobile/widgets/button_custom.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';
import 'package:pawang_mobile/widgets/input_field.dart';
import 'package:pawang_mobile/widgets/wallet_card2.dart';
import 'package:get/get.dart';

class WalletView extends StatelessWidget {
  final WalletController controller = Get.find();
  final DashboardController dashboardController = Get.find();
  final TransactionController transactionController = Get.find();
  final args = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset('assets/images/background.png'),
              Container(
                padding: EdgeInsets.only(
                    top: Get.height * 0.07, left: 32, right: 32),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconBack(blueMode: false, onTap: (() => Get.back())),
                    Text(
                      'Dompet'.tr,
                      style: kInter.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                        color: defaultWhite,
                      ),
                    ),
                    if (args == null)
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(RoutesName.addwallet);
                        },
                        child: const Icon(
                          Icons.add_rounded,
                          color: defaultWhite,
                        ),
                      )
                    else
                      SizedBox(
                        width: Get.width * 0.072,
                        height: Get.height * 0.036,
                      ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: Get.height * 0.005,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Obx(
                () => dashboardController.wallets.isEmpty
                    ? Center(
                        child: Text(
                          "Anda Belum Memiliki Dompet".tr,
                          style: kInter.copyWith(
                              color: defaultGray,
                              fontSize: 13,
                              fontWeight: medium),
                          textAlign: TextAlign.center,
                        ),
                      )
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: dashboardController.wallets.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          var wallet = dashboardController.wallets[index];
                          if (args == null) {
                            return WalletCard2(
                                wallet: wallet,
                                onTap: () {
                                  showDialog<void>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: Text(
                                        wallet.name,
                                        style: kInter.copyWith(
                                            fontSize: 16, fontWeight: bold),
                                        textAlign: TextAlign.center,
                                      ),
                                      content: Text(
                                        CurrencyFormat.convertToIdr(
                                            wallet.balance, 2),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: kInter.copyWith(
                                          color: defaultBlack,
                                          fontWeight: medium,
                                          fontSize: 15,
                                        ),
                                      ),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      actions: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                                child: ButtonCustom(
                                              text: 'Edit',
                                              onTap: () {
                                                Get.back();
                                                controller.idWallet = wallet.id;
                                                controller.nameTextController
                                                    .text = wallet.name;
                                                controller.balanceTextController
                                                        .text =
                                                    wallet.balance.toString();
                                                showModalBottomSheet<void>(
                                                  isScrollControlled: true,
                                                  enableDrag: true,
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return Padding(
                                                      padding:
                                                          MediaQuery.of(context)
                                                              .viewInsets,
                                                      child: Container(
                                                        height:
                                                            Get.height * 0.45,
                                                        color: defaultWhite,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(20.0),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              // Nominal
                                                              Text(
                                                                'Edit Data',
                                                                style: kInter
                                                                    .copyWith(
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            bold),
                                                              ),
                                                              SizedBox(
                                                                height:
                                                                    Get.height *
                                                                        0.04,
                                                              ),
                                                              Container(
                                                                margin:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        bottom:
                                                                            20),
                                                                child: Column(
                                                                  children: [
                                                                    InputField(
                                                                      icon: const Icon(
                                                                          Icons
                                                                              .payment_rounded),
                                                                      inputLabel:
                                                                          "Nama Dompet"
                                                                              .tr,
                                                                      inputController:
                                                                          controller
                                                                              .nameTextController,
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .text,
                                                                      enable:
                                                                          true,
                                                                      // errorText: _inputData ? null : 'Nominal wajib diisi',
                                                                    ),
                                                                    SizedBox(
                                                                      height: Get
                                                                              .height *
                                                                          0.035,
                                                                    ),
                                                                    InputField(
                                                                      textInputAction:
                                                                          TextInputAction
                                                                              .done,
                                                                      onFieldSubmitted:
                                                                          (_) {
                                                                        controller
                                                                            .updateWallet();
                                                                      },
                                                                      icon: const Icon(
                                                                          Icons
                                                                              .monetization_on_outlined),
                                                                      inputLabel:
                                                                          "Saldo"
                                                                              .tr,
                                                                      inputController:
                                                                          controller
                                                                              .balanceTextController,
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .number,
                                                                      enable:
                                                                          true,
                                                                      inputFormatters: [
                                                                        CurrencyTextInputFormatter(
                                                                            locale:
                                                                                'id',
                                                                            decimalDigits:
                                                                                0,
                                                                            symbol:
                                                                                '')
                                                                      ],
                                                                      // errorText: _inputData ? null : 'Nominal wajib diisi',
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .bottomCenter,
                                                                  child:
                                                                      ButtonCustom(
                                                                    text:
                                                                        'Simpan Perubahan'
                                                                            .tr,
                                                                    onTap: () =>
                                                                        controller
                                                                            .updateWallet(),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    controller.resetAllInput());
                                              },
                                            )),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: ButtonCustom(
                                                text: 'Hapus'.tr,
                                                elevatedMode: false,
                                                blueMode: false,
                                                onTap: () {
                                                  Get.back();
                                                  controller.idWallet =
                                                      wallet.id;
                                                  controller.deleteWallet();
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          } else {
                            return GestureDetector(
                              onTap: () {
                                transactionController.walletId.value =
                                    wallet.id;
                                transactionController.displayWalletName.text =
                                    wallet.name;
                                Get.back();
                              },
                              child: WalletCard2(
                                wallet: wallet,
                                isChoose: true,
                              ),
                            );
                          }
                        },
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
