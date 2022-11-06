// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/modules/transaction/controllers/transaction_controller.dart';
import 'package:pawang_mobile/routes/routes.dart';
import 'package:pawang_mobile/utils/currency_format.dart';
import 'package:pawang_mobile/widgets/pengeluaran_card.dart';

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
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: Get.height * 0.012,
                          ),
                          Text(
                            'Transaksi',
                            style: kInter.copyWith(
                                fontSize: 16,
                                fontWeight: bold,
                                color: defaultWhite),
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
                                    'Sisa Uang Kamu',
                                    style: kInter.copyWith(
                                        fontWeight: medium,
                                        color: defaultWhite),
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.01,
                                  ),
                                  Obx(
                                    () => Text(
                                      CurrencyFormat.convertToIdr(
                                              controller
                                                  .dashboardController
                                                  .transactionDetailData
                                                  .value
                                                  .totalBalance,
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
                    color: defaultWhite,
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
                    color: defaultWhite,
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
                              Text('Pemasukan',
                                  style: kInter.copyWith(
                                      fontWeight: semiBold,
                                      color: defaultBlack)),
                            ],
                          ),
                          Obx(
                            () => FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                CurrencyFormat.convertToIdr(
                                        controller
                                            .dashboardController
                                            .transactionDetailData
                                            .value
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
                              Text('Pengeluaran',
                                  style: kInter.copyWith(
                                      fontWeight: semiBold,
                                      color: defaultBlack)),
                            ],
                          ),
                          Obx(
                            () => FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                CurrencyFormat.convertToIdr(
                                        controller
                                            .dashboardController
                                            .transactionDetailData
                                            .value
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
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
            child: Column(
              children: [
                Text(
                  'Riwayat Transaksi',
                  style: kInter.copyWith(fontWeight: bold, color: defaultGray),
                ),
                SizedBox(
                  height: Get.height * 0.0125,
                ),
                Obx(
                  () => controller
                          .dashboardController
                          .wallets[controller
                              .dashboardController.selectedWallets.value]
                          .transactions
                          .isNotEmpty
                      ? ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            final wallet = controller
                                .dashboardController
                                .wallets[controller
                                    .dashboardController.selectedWallets.value]
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
                              .wallets[controller
                                  .dashboardController.selectedWallets.value]
                              .transactions
                              .length,
                        )
                      : Center(
                          child: Text(
                            "Anda belum memiliki transaksi",
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
