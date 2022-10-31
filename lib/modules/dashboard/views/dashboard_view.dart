import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/modules/dashboard/dashboard.dart';
import 'package:pawang_mobile/modules/navigation/navigation.dart';
import 'package:pawang_mobile/modules/transaction/controllers/transaction_controller.dart';
import 'package:pawang_mobile/routes/routes.dart';
import 'package:pawang_mobile/utils/currency_format.dart';
import 'package:pawang_mobile/widgets/pengeluaran_card.dart';
import 'package:pawang_mobile/widgets/layanan_card.dart';
import 'package:pawang_mobile/widgets/remind_card.dart';
import 'package:pawang_mobile/widgets/saldo_card.dart';
import 'package:skeleton_text/skeleton_text.dart';

class DashboardView extends StatelessWidget {
  DashboardView({Key? key}) : super(key: key);
  final DashboardController controller = Get.find();

  final TransactionController controllerTransaction = Get.find();
  final NavigationController controllerNavigation = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: <Widget>[
                Container(
                    height: Get.height * 0.275,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                          bottom: Radius.elliptical(60, 20)),
                      gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [defaultPrimary, defaultPurple]),
                      // color: defaultPrimary,
                    )),
                Row(
                  children: [
                    SizedBox(
                      width: Get.width * 0.5,
                    ),
                    Container(
                        width: Get.width * 0.5,
                        height: Get.height * 0.275,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(1000)),
                          // color: Colors.amber
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              defaultWhite.withOpacity(0.02),
                              defaultWhite.withOpacity(0.5),
                              // defaultWhite.withOpacity(0.2),
                              //     // Colors.white38
                              //   ],
                              //   // stops: [0.0, 1.0],
                              // ),
                            ],
                          ),
                        )),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 35, left: 32, right: 32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                            () => Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: Get.width * 0.085,
                                  height: Get.height * 0.05,
                                  decoration: BoxDecoration(
                                    color: defaultWhite,
                                    borderRadius: BorderRadius.circular(50.0),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          controller.user.value.gender == "male"
                                              ? "assets/images/man.png"
                                              : controller.user.value.gender ==
                                                      "female"
                                                  ? "assets/images/woman.png"
                                                  : "assets/images/user.png"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Hallo,",
                                        style: kOpenSans.copyWith(
                                            fontSize: 12,
                                            fontWeight: medium,
                                            color: defaultWhite),
                                      ),
                                      controller.user.value.name != ""
                                          ? SizedBox(
                                              width: Get.width * 0.5,
                                              child: Text(
                                                  controller.user.value.name,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: kOpenSans.copyWith(
                                                      fontSize: 14,
                                                      fontWeight: semiBold,
                                                      color: defaultWhite)),
                                            )
                                          : SkeletonAnimation(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              shimmerColor: Colors.white54,
                                              child: Container(
                                                height: 15,
                                                width: Get.width * 0.25,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  color: Colors.white
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                            ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Get.height * 0.02),
                    Obx(
                      () => Container(
                        child: CarouselSlider.builder(
                          itemCount: controller.wallets.length + 1,
                          options: CarouselOptions(
                            viewportFraction: 0.86,
                            // padEnds: false,
                            clipBehavior: Clip.none,
                            aspectRatio: 2.3,
                            enlargeCenterPage: true,
                            enableInfiniteScroll: false,
                          ),
                          itemBuilder:
                              (BuildContext context, int index, int realIndex) {
                            if (index == controller.wallets.length) {
                              return GestureDetector(
                                onTap: () => Get.toNamed(RoutesName.addwallet),
                                child: Container(
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                defaultBlack.withOpacity(0.2),
                                            blurRadius: 10,
                                            spreadRadius: 2)
                                      ],
                                      gradient: const LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            defaultPrimary,
                                            defaultPurple
                                          ]),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                      child: Icon(
                                    Icons.add_rounded,
                                    size: 30,
                                    color: defaultWhite.withOpacity(0.8),
                                  )),
                                ),
                              );
                            }
                            var wallet = controller.wallets[index];
                            return Container(
                              width: Get.width,
                              // color: Colors.amber,
                              child: GestureDetector(
                                onTap: () => Get.toNamed(RoutesName.wallet),
                                child: WalletCard(
                                    income: CurrencyFormat.convertToIdr(
                                            controllerTransaction
                                                .transactionDetailData
                                                .value
                                                .totalIncome,
                                            2)
                                        .toString(),
                                    outcome: CurrencyFormat.convertToIdr(
                                            controllerTransaction
                                                .transactionDetailData
                                                .value
                                                .totalOutcome,
                                            2)
                                        .toString(),
                                    namaWallet: wallet.name,
                                    balance: CurrencyFormat.convertToIdr(
                                            wallet.balance, 2)
                                        .toString()),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          LayananCard(
                            icon: 'assets/images/pemasukan.png',
                            title: 'Transaksi',
                            onTap: () {
                              Get.toNamed(RoutesName.addtransaction);
                            },
                          ),
                          LayananCard(
                            icon: 'assets/images/wallet.png',
                            title: 'Dompet',
                            onTap: () {
                              Get.toNamed(RoutesName.wallet);
                            },
                          ),
                          LayananCard(
                            icon: 'assets/images/kategori.png',
                            title: 'Kategori',
                            onTap: () {
                              Get.toNamed(RoutesName.category);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: Get.height * 0.035),

            // SizedBox(height: Get.height * 0.035),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Transaksi terakhir',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: kOpenSans.copyWith(
                            fontWeight: bold, color: defaultBlack),
                      ),
                      InkWell(
                        onTap: () {
                          controllerNavigation.changeTabIndex(1);
                        },
                        child: Text(
                          'Lihat semua',
                          style: kOpenSans.copyWith(
                              fontSize: 12,
                              fontWeight: medium,
                              color: Colors.blue),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.008,
                  ),
                  Obx(
                    () => controller.transactions.isNotEmpty
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
                                    arguments: controller.transactions[index]),
                                child: CardPengeluaran(
                                    data: controller.transactions[index]),
                              );
                            },
                            itemCount: controller.transactions.length > 3
                                ? 3
                                : controller.transactions.length,
                          )
                        : Padding(
                            padding: const EdgeInsets.symmetric(vertical: 25),
                            child: Center(
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
                  ),
                ],
              ),
            ),
            SizedBox(height: Get.height * 0.035),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Jangan lupa dibayar',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: kOpenSans.copyWith(
                            fontWeight: bold, color: defaultBlack),
                      ),
                      InkWell(
                        onTap: () {
                          controllerNavigation.changeTabIndex(3);
                        },
                        child: Text(
                          'Lihat semua',
                          style: kOpenSans.copyWith(
                              fontSize: 12,
                              fontWeight: medium,
                              color: Colors.blue),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Obx(
                    () => controller.reminders.isNotEmpty
                        ? SizedBox(
                            height: Get.height * 0.12,
                            child: ListView.builder(
                              physics: const ClampingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: controller.reminders.length > 3
                                  ? 3
                                  : controller.reminders.length,
                              itemBuilder: (
                                BuildContext context,
                                int index,
                              ) {
                                // return Text('Data Dummy');
                                var remind = controller.reminders[index];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 3, vertical: 8),
                                  child: GestureDetector(
                                    onTap: () =>
                                        controllerNavigation.changeTabIndex(3),
                                    child: RemindCard(
                                      data: remind,
                                      icon: 'assets/images/bell.png',
                                      name: remind.name!,
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.symmetric(vertical: 25),
                            child: Center(
                              child: Text(
                                "Anda belum memiliki Tagihan",
                                style: kOpenSans.copyWith(
                                    color: defaultGray,
                                    fontSize: 13,
                                    fontWeight: medium),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
