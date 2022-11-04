// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/modules/dashboard/dashboard.dart';
import 'package:pawang_mobile/modules/transaction/transaction.dart';
import 'package:pawang_mobile/modules/wallet/wallet.dart';
import 'package:pawang_mobile/routes/routes.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';
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
              Container(
                height: Get.height * 0.18,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [defaultPrimary, defaultPurple])),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: Get.height * 0.07, left: 32, right: 32),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconBack(blueMode: false, onTap: (() => Get.back())),
                    Column(
                      children: [
                        SvgPicture.asset(
                          'assets/images/wallet.svg',
                          color: defaultWhite,
                        ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        Text(
                          'Dompet',
                          style: kOpenSans.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                              color: defaultWhite),
                        ),
                      ],
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
                          "Wallet Masih Kosong",
                          style: textMuted.copyWith(
                              fontSize: 18, fontWeight: semiBold),
                        ),
                      )
                    : ListView.builder(
                        itemCount: dashboardController.wallets.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          var wallet = dashboardController.wallets[index];
                          if (args == null) {
                            return WalletCard2(
                              wallet: wallet,
                              isChoose: false,
                            );
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
