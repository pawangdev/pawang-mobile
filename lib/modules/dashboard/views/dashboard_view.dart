import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/modules/dashboard/dashboard.dart';
import 'package:pawang_mobile/modules/navigation/navigation.dart';
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
  final NavigationController controllerNavigation = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                Container(
                    height: Get.height * 0.45,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [defaultPrimary, defaultPurple]))),
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
                      () => CarouselSlider.builder(
                        itemCount: controller.wallets.length + 1,
                        options: CarouselOptions(
                          disableCenter: true,
                          aspectRatio: 2.8,
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
                                    gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          defaultWhite.withOpacity(0.5),
                                          defaultWhite.withOpacity(0.3),
                                          defaultWhite.withOpacity(0.5)
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
                          return GestureDetector(
                            onTap: () => Get.toNamed(RoutesName.wallet),
                            child: WalletCard(
                                name: controller.user.value.name,
                                namaWallet: wallet.name,
                                balance: CurrencyFormat.convertToIdr(
                                        wallet.balance, 2)
                                    .toString()),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.042,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Container(
                width: Get.width,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: defaultBlack.withOpacity(0.05),
                      spreadRadius: 2,
                      blurRadius: 10,
                    )
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: defaultWhite,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
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
                                fontSize: 14,
                                fontWeight: bold,
                                color: defaultBlack),
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
                                        arguments:
                                            controller.transactions[index]),
                                    child: CardPengeluaran(
                                        data: controller.transactions[index]),
                                  );
                                },
                                itemCount: controller.transactions.length > 3
                                    ? 3
                                    : controller.transactions.length,
                              )
                            : Padding(
                                padding: const EdgeInsets.only(top: 25),
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
              ),
            ),
            SizedBox(
              height: Get.height * 0.035,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Container(
                width: Get.width,
                // height: 200.h,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: defaultBlack.withOpacity(0.05),
                      spreadRadius: 2,
                      blurRadius: 10,
                    )
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: defaultWhite,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
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
                                fontSize: 14,
                                fontWeight: bold,
                                color: defaultBlack),
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
                            ? CarouselSlider.builder(
                                itemCount: controller.reminders.length > 3
                                    ? 3
                                    : controller.reminders.length,
                                options: CarouselOptions(
                                  height: Get.height * 0.155,
                                  disableCenter: true,
                                  aspectRatio: 2,
                                  enlargeCenterPage: true,
                                  enableInfiniteScroll: false,
                                ),
                                itemBuilder: (BuildContext context, int index,
                                    int realIndex) {
                                  var remind = controller.reminders[index];
                                  return GestureDetector(
                                    onTap: () =>
                                        controllerNavigation.changeTabIndex(3),
                                    child: RemindCard(
                                      data: remind,
                                      icon: '-',
                                      name: remind.name!,
                                    ),
                                  );
                                },
                              )
                            : Padding(
                                padding: const EdgeInsets.only(top: 20),
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
              ),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
