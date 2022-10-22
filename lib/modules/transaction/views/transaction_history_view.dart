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
                            style: kOpenSans.copyWith(
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
                                    style: kOpenSans.copyWith(
                                        fontSize: 12,
                                        fontWeight: medium,
                                        color: defaultWhite),
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.02,
                                  ),
                                  Obx(
                                    () => Text(
                                      CurrencyFormat.convertToIdr(
                                              controller.transactionDetailData
                                                  .value.totalBalance,
                                              2)
                                          .toString(),
                                      style: kOpenSans.copyWith(
                                          fontSize: 24,
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
              Positioned(
                top: Get.height * 0.21,
                left: Get.width * 0.155,
                child: Container(
                  height: Get.height * 0.07,
                  width: Get.width * 0.69,
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
                                size: 13,
                                color: defaultSuccess,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text('Pemasukan',
                                  style: kOpenSans.copyWith(
                                      fontSize: 10,
                                      fontWeight: semiBold,
                                      color: defaultBlack)),
                            ],
                          ),
                          Obx(
                            () => Text(
                              CurrencyFormat.convertToIdr(
                                      controller.transactionDetailData.value
                                          .totalIncome,
                                      2)
                                  .toString(),
                              style: kOpenSans.copyWith(
                                  fontSize: 12,
                                  fontWeight: bold,
                                  color: defaultSuccess),
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
                                size: 13,
                                color: defaultError,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text('Pengeluaran',
                                  style: kOpenSans.copyWith(
                                      fontSize: 10,
                                      fontWeight: semiBold,
                                      color: defaultBlack)),
                            ],
                          ),
                          Obx(
                            () => Text(
                              CurrencyFormat.convertToIdr(
                                      controller.transactionDetailData.value
                                          .totalOutcome,
                                      2)
                                  .toString(),
                              style: kOpenSans.copyWith(
                                  fontSize: 12,
                                  fontWeight: bold,
                                  color: defaultError),
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
                  style: kOpenSans.copyWith(
                      fontSize: 14, fontWeight: bold, color: defaultGray),
                ),
                SizedBox(
                  height: Get.height * 0.0125,
                ),
                Obx(
                  () => controller.dashboardController.transactions.isNotEmpty
                      ? ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onTap: () => Get.toNamed(
                                  RoutesName.detailtransaction,
                                  arguments: controller
                                      .dashboardController.transactions[index]),
                              child: Column(
                                children: [
                                  CardPengeluaran(
                                      data: controller.dashboardController
                                          .transactions[index]),
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
                            "Anda belum memiliki transaksi",
                            style: kOpenSans.copyWith(
                                color: defaultGray,
                                fontSize: 13,
                                fontWeight: medium),
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
