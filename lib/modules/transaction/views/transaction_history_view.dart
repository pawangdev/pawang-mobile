// ignore_for_file: use_key_in_widget_constructors, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/modules/transaction/controllers/transaction_controller.dart';
import 'package:pawang_mobile/routes/routes.dart';
import 'package:pawang_mobile/utils/currency_format.dart';
import 'package:pawang_mobile/widgets/pengeluaran_card.dart';
import 'package:pawang_mobile/widgets/wallet_card3.dart';

class TransactionHistoryView extends StatelessWidget {
  final TransactionController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: Get.height * 0.25,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [defaultPrimary, defaultPurple])),
                    child: Padding(
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: Get.height * 0.012,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Transaksi'.tr,
                                style: kInter.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                    color: defaultWhite),
                              ),
                              GestureDetector(
                                child: const Icon(
                                  Icons.list_rounded,
                                  color: defaultWhite,
                                ),
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(30))),
                                    builder: (BuildContext context) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            top: 15.0, right: 32, left: 25),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Filter Dompet'.tr,
                                                  style: kInter.copyWith(
                                                    fontWeight: medium,
                                                  ),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    controller.isFilter.value =
                                                        false;

                                                    controller
                                                        .selectedFilterWalletId
                                                        .value = 10000;

                                                    Get.back();
                                                  },
                                                  child: Text("Reset".tr),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            controller.dashboardController
                                                    .wallets.isEmpty
                                                ? Center(
                                                    child: Text(
                                                        'Tidak Ada Dompet'.tr),
                                                  )
                                                : Expanded(
                                                    child: ListView.builder(
                                                      itemCount: controller
                                                          .dashboardController
                                                          .wallets
                                                          .length,
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              int index) {
                                                        final wallet = controller
                                                            .dashboardController
                                                            .wallets[index];
                                                        return GestureDetector(
                                                          onTap: () {
                                                            controller.isFilter
                                                                .value = true;
                                                            controller
                                                                .selectedFilterWalletId
                                                                .value = index;

                                                            Get.back();
                                                          },
                                                          child: Obx(
                                                            () => WalletCard3(
                                                              isSelected: controller
                                                                      .selectedFilterWalletId
                                                                      .value ==
                                                                  index,
                                                              nama: wallet.name,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              )
                            ],
                          ),
                          SizedBox(
                            height: Get.height * 0.03,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Sisa Uang Kamu'.tr,
                                    style: kInter.copyWith(
                                        fontWeight: medium,
                                        color: defaultWhite),
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.01,
                                  ),
                                  Obx(
                                    () => Text(
                                      !controller.isFilter.value
                                          ? CurrencyFormat.convertToIdr(
                                                  controller
                                                      .dashboardController
                                                      .transactionDetailData
                                                      .value
                                                      .totalBalance,
                                                  2)
                                              .toString()
                                          : CurrencyFormat.convertToIdr(
                                                  controller
                                                      .dashboardController
                                                      .wallets[controller
                                                          .selectedFilterWalletId
                                                          .value]
                                                      .balance,
                                                  2)
                                              .toString(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: kInter.copyWith(
                                          fontSize: 20,
                                          fontWeight: bold,
                                          color: defaultWhite),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: Get.height * 0.05,
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                      width: Get.width * 0.5,
                      height: Get.height * 0.24,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(1000)),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            defaultWhite.withOpacity(0.02),
                            defaultWhite.withOpacity(0.5),
                          ],
                        ),
                      )),
                ],
              ),
              Positioned(
                top: Get.height * 0.21,
                left: Get.width * 0.072,
                child: Container(
                  height: Get.height * 0.08,
                  width: Get.width * 0.85,
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.light
                        ? defaultWhite
                        : Color(0XFF1B2430),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: defaultBlack.withOpacity(0.12),
                        spreadRadius: 2,
                        blurRadius: 10,
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.arrow_downward_rounded,
                                size: 16,
                                color: defaultSuccess,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text('Pemasukan'.tr,
                                  style: kInter.copyWith(fontWeight: semiBold)),
                            ],
                          ),
                          Obx(
                            () => FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                !controller.isFilter.value
                                    ? CurrencyFormat.convertToIdr(
                                            controller
                                                .dashboardController
                                                .transactionDetailData
                                                .value
                                                .totalIncome,
                                            2)
                                        .toString()
                                    : CurrencyFormat.convertToIdr(
                                            controller
                                                .dashboardController
                                                .wallets[controller
                                                    .selectedFilterWalletId
                                                    .value]
                                                .totalIncome,
                                            2)
                                        .toString(),
                                maxLines: 1,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: kInter.copyWith(
                                    fontWeight: medium, color: defaultSuccess),
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        width: 1,
                        height: 30,
                        color: defaultGray,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.arrow_upward_rounded,
                                size: 16,
                                color: defaultError,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text('Pengeluaran'.tr,
                                  style: kInter.copyWith(fontWeight: semiBold)),
                            ],
                          ),
                          Obx(
                            () => FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                !controller.isFilter.value
                                    ? CurrencyFormat.convertToIdr(
                                            controller
                                                .dashboardController
                                                .transactionDetailData
                                                .value
                                                .totalOutcome,
                                            2)
                                        .toString()
                                    : CurrencyFormat.convertToIdr(
                                            controller
                                                .dashboardController
                                                .wallets[controller
                                                    .selectedFilterWalletId
                                                    .value]
                                                .totalOutcome,
                                            2)
                                        .toString(),
                                maxLines: 1,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: kInter.copyWith(
                                    fontWeight: medium, color: defaultError),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 32),
            child: Column(
              children: [
                Text(
                  'Riwayat Transaksi'.tr,
                  style: kInter.copyWith(fontWeight: bold, color: defaultGray),
                ),
                SizedBox(
                  height: Get.height * 0.0125,
                ),
                Obx(
                  () => controller.isFilter.value
                      ? controller
                              .dashboardController
                              .wallets[controller.selectedFilterWalletId.value]
                              .transactions
                              .isNotEmpty
                          ? ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                final wallet = controller
                                    .dashboardController
                                    .wallets[
                                        controller.selectedFilterWalletId.value]
                                    .transactions[index];
                                return InkWell(
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: () => Get.toNamed(
                                      RoutesName.detailtransaction,
                                      arguments: wallet),
                                  child: Column(
                                    children: [
                                      CardPengeluaran(data: wallet),
                                      SizedBox(
                                        height: Get.height * 0.018,
                                      ),
                                    ],
                                  ),
                                );
                              },
                              itemCount: controller
                                  .dashboardController
                                  .wallets[
                                      controller.selectedFilterWalletId.value]
                                  .transactions
                                  .length,
                            )
                          : Center(
                              child: Text(
                                'Tidak ada transaksi'.tr,
                                style: kInter.copyWith(
                                    fontWeight: medium, color: defaultGray),
                              ),
                            )
                      : controller.dashboardController.transactions.isNotEmpty
                          ? ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                final wallet = controller
                                    .dashboardController.transactions[index];
                                return InkWell(
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: () => Get.toNamed(
                                      RoutesName.detailtransaction,
                                      arguments: wallet),
                                  child: Column(
                                    children: [
                                      CardPengeluaran(data: wallet),
                                      SizedBox(
                                        height: Get.height * 0.018,
                                      ),
                                    ],
                                  ),
                                );
                              },
                              itemCount: controller
                                  .dashboardController.transactions.length,
                            )
                          : Center(
                              child: Text(
                                "Anda Belum Memiliki Transaksi".tr,
                                style: kInter.copyWith(
                                    color: defaultGray, fontWeight: medium),
                                textAlign: TextAlign.center,
                              ),
                            ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
