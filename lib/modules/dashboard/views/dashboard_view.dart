import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/modules/dashboard/dashboard.dart';
import 'package:pawang_mobile/routes/routes.dart';
import 'package:pawang_mobile/utils/currency_format.dart';
import 'package:pawang_mobile/widgets/pengeluaran_card.dart';
import 'package:pawang_mobile/widgets/layanan_card.dart';
import 'package:pawang_mobile/widgets/saldo_card.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DashboardView extends StatelessWidget {
  DashboardView({Key? key}) : super(key: key);
  final DashboardController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [defaultPrimary, defaultPurple])),
        child: Stack(children: <Widget>[
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 32, right: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                        () => Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                color: defaultWhite,
                                borderRadius: BorderRadius.circular(50.0),
                                image: DecorationImage(
                                  image: AssetImage(controller
                                              .user.value.gender ==
                                          "male"
                                      ? "assets/images/man.png"
                                      : controller.user.value.gender == "female"
                                          ? "assets/images/woman.png"
                                          : "assets/images/user.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Hallo,",
                                    style: kOpenSans.copyWith(
                                        fontSize: 10,
                                        //0.2.dp,
                                        fontWeight: medium,
                                        color: defaultWhite),
                                  ),
                                  controller.user.value.name != ""
                                      ? Text(controller.user.value.name,
                                          style: kOpenSans.copyWith(
                                              fontSize: 13,
                                              fontWeight: bold,
                                              color: defaultWhite))
                                      : SkeletonAnimation(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          shimmerColor: Colors.white54,
                                          child: Container(
                                            height: 15,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.25,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              color:
                                                  Colors.white.withOpacity(0.5),
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
                SizedBox(height: 2.h),
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
                            balance:
                                CurrencyFormat.convertToIdr(wallet.balance, 2)
                                    .toString()),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 2.4.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32, right: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Layanan',
                        style: kOpenSans.copyWith(
                            fontSize: 14, //0.24.dp,
                            fontWeight: bold,
                            color: defaultWhite),
                      ),
                      SizedBox(
                        height: 2.4.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          LayananCard(
                            icon: 'assets/images/pemasukan.png',
                            title: 'Pemasukan',
                            onTap: () {
                              Get.toNamed(RoutesName.addincome);
                            },
                          ),
                          LayananCard(
                            icon: 'assets/images/pengeluaran.png',
                            title: 'Pengeluaran',
                            onTap: () {
                              Get.toNamed(RoutesName.addoutcome);
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
                      )
                    ],
                  ),
                ),
                SizedBox(height: 3.4.h),
              ],
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.36,
            minChildSize: 0.36,
            maxChildSize: 0.94,
            builder: (BuildContext context, ScrollController scrollController) {
              return SizedBox(
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: Container(
                    child: ListView.builder(
                        controller: scrollController,
                        itemCount: 1,
                        itemBuilder: (BuildContext context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Container(
                                    margin: const EdgeInsets.only(top: 5),
                                    height: 0.7.h,
                                    width: 24.w,
                                    decoration: BoxDecoration(
                                        color: defaultGray.withOpacity(0.7),
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 32, top: 20, bottom: 16),
                                child: Text(
                                  'Riwayat',
                                  textAlign: TextAlign.start,
                                  style: kOpenSans.copyWith(
                                      fontSize: 14,
                                      fontWeight: bold,
                                      color: defaultBlack),
                                ),
                              ),
                              Container(
                                constraints: BoxConstraints(minHeight: 30.h),
                                child: Obx(
                                  () => controller.transactions.isNotEmpty
                                      ? ListView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          scrollDirection: Axis.vertical,
                                          shrinkWrap: true,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return InkWell(
                                              highlightColor:
                                                  Colors.transparent,
                                              splashColor: Colors.transparent,
                                              onTap: () => Get.toNamed(
                                                  RoutesName.detailtransaction,
                                                  arguments: controller
                                                      .transactions[index]),
                                              child: CardPengeluaran(
                                                  data: controller
                                                      .transactions[index]),
                                            );
                                          },
                                          itemCount:
                                              controller.transactions.length,
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
                              ),
                            ],
                          );
                        }),
                    decoration: const BoxDecoration(
                        color: defaultWhite,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24))),
                  ),
                ),
              );
            },
          ),
        ]),
      ),
    );
  }
}
