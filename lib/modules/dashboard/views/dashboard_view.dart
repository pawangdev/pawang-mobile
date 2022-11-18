import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/modules/dashboard/dashboard.dart';
import 'package:pawang_mobile/modules/navigation/navigation.dart';
import 'package:pawang_mobile/modules/reminder/controllers/reminder_controller.dart';
import 'package:pawang_mobile/modules/transaction/controllers/transaction_controller.dart';
import 'package:pawang_mobile/routes/routes.dart';
import 'package:pawang_mobile/utils/currency_format.dart';
import 'package:pawang_mobile/widgets/button_custom.dart';
import 'package:pawang_mobile/widgets/layanan_card.dart';
import 'package:pawang_mobile/widgets/pengeluaran_card.dart';
import 'package:pawang_mobile/widgets/remind_card.dart';
import 'package:pawang_mobile/widgets/saldo_card.dart';
import 'package:skeleton_text/skeleton_text.dart';

class DashboardView extends StatelessWidget {
  DashboardView({Key? key}) : super(key: key);
  final DashboardController controller = Get.find();

  final TransactionController controllerTransaction = Get.find();
  final NavigationController controllerNavigation = Get.find();
  final ReminderController controllerReminder = Get.find();

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
                    )),
                Row(
                  children: [
                    SizedBox(
                      width: Get.width * 0.5,
                    ),
                    Container(
                        width: Get.width * 0.5,
                        height: Get.height * 0.25,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(200)),
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
                Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 32, left: 32, right: 32),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                            () => Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: Get.width * 0.085,
                                  height: Get.height * 0.047,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).brightness ==
                                            Brightness.light
                                        ? defaultWhite
                                        : const Color(0XFF39434D),
                                    borderRadius: BorderRadius.circular(50.0),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          controller.user.value.gender == "male"
                                              ? "assets/images/man.png"
                                              : controller.user.value.gender ==
                                                      "female"
                                                  ? "assets/images/woman.png"
                                                  : "assets/images/user.png"),
                                      fit: BoxFit.cover,
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
                                        "Selamat Datang,".tr,
                                        style: kInter.copyWith(
                                          fontSize: 12,
                                          fontWeight: medium,
                                          color: Theme.of(context).brightness ==
                                                  Brightness.light
                                              ? defaultWhite
                                              : const Color(0XFF39434D),
                                        ),
                                      ),
                                      controller.user.value.name != ""
                                          ? SizedBox(
                                              width: Get.width * 0.5,
                                              child: Text(
                                                  controller.user.value.name,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: kInter.copyWith(
                                                    fontSize: 14,
                                                    fontWeight: semiBold,
                                                    color: Theme.of(context)
                                                                .brightness ==
                                                            Brightness.light
                                                        ? defaultWhite
                                                        : const Color(
                                                            0XFF39434D),
                                                  )),
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
                          onPageChanged: (index, reason) {
                            if (controller.wallets.length > index) {
                              controller.selectedWallets.value = index;
                            }
                          },
                          viewportFraction: 0.86,
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
                                        color: defaultBlack.withOpacity(0.2),
                                        blurRadius: 25,
                                        spreadRadius: -5)
                                  ],
                                  gradient: const LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomCenter,
                                      colors: [Colors.white60, Colors.white10]),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      width: 2, color: Colors.white30),
                                ),
                                child: Center(
                                    child: Icon(
                                  Icons.add_rounded,
                                  size: 30,
                                  color: defaultBlack.withOpacity(0.7),
                                )),
                              ),
                            );
                          }
                          var wallet = controller.wallets[index];
                          return SizedBox(
                            width: Get.width,
                            // color: Colors.amber,
                            child: GestureDetector(
                              onTap: () => Get.toNamed(RoutesName.wallet),
                              child: WalletCard(
                                  income: CurrencyFormat.convertToIdr(
                                      wallet.totalIncome, 2),
                                  outcome: CurrencyFormat.convertToIdr(
                                      wallet.totalOutcome, 2),
                                  namaWallet: wallet.name,
                                  balance: CurrencyFormat.convertToIdr(
                                          wallet.balance, 2)
                                      .toString()),
                            ),
                          );
                        },
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
                            title: 'Transaksi'.tr,
                            onTap: () {
                              Get.toNamed(RoutesName.addtransaction);
                            },
                          ),
                          LayananCard(
                            icon: 'assets/images/wallet.png',
                            title: 'Dompet'.tr,
                            onTap: () {
                              Get.toNamed(RoutesName.wallet);
                            },
                          ),
                          LayananCard(
                            icon: 'assets/images/kategori.png',
                            title: 'Kategori'.tr,
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
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Transaksi Terakhir'.tr,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: kInter.copyWith(fontWeight: bold),
                      ),
                      InkWell(
                        onTap: () {
                          controllerNavigation.changeTabIndex(1);
                          controllerTransaction.isFilter.value = true;
                          controllerTransaction.selectedFilterWalletId.value =
                              controller.selectedWallets.value;
                        },
                        child: Text(
                          'Lihat Semua'.tr,
                          style: kInter.copyWith(
                              fontSize: 12,
                              fontWeight: medium,
                              color: Colors.blue),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.005,
                  ),
                  Obx(() => controller.wallets.isNotEmpty
                      ? controller.wallets[controller.selectedWallets.value]
                              .transactions.isNotEmpty
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
                                          .wallets[
                                              controller.selectedWallets.value]
                                          .transactions[index]),
                                  child: CardPengeluaran(
                                      data: controller
                                          .wallets[
                                              controller.selectedWallets.value]
                                          .transactions[index]),
                                );
                              },
                              itemCount: controller
                                          .wallets[
                                              controller.selectedWallets.value]
                                          .transactions
                                          .length >
                                      3
                                  ? 3
                                  : controller
                                      .wallets[controller.selectedWallets.value]
                                      .transactions
                                      .length,
                            )
                          : Padding(
                              padding: const EdgeInsets.symmetric(vertical: 25),
                              child: Center(
                                child: Text(
                                  "Anda Belum Memiliki Transaksi".tr,
                                  style: kInter.copyWith(
                                      color: defaultGray,
                                      fontSize: 13,
                                      fontWeight: medium),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                      : Padding(
                          padding: const EdgeInsets.symmetric(vertical: 25),
                          child: Center(
                            child: Text(
                              "Anda Belum Memiliki Dompet".tr,
                              style: kInter.copyWith(
                                  color: defaultGray,
                                  fontSize: 13,
                                  fontWeight: medium),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )),
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
                        'Jangan Lupa Dibayar'.tr,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: kInter.copyWith(fontWeight: bold),
                      ),
                      InkWell(
                        onTap: () {
                          controllerNavigation.changeTabIndex(3);
                        },
                        child: Text(
                          'Lihat Semua'.tr,
                          style: kInter.copyWith(
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
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: controller.reminders.length > 3
                                  ? 3
                                  : controller.reminders.length,
                              itemBuilder: (
                                BuildContext context,
                                int index,
                              ) {
                                var remind = controller.reminders[index];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 3, vertical: 8),
                                  child: GestureDetector(
                                    onTap: () {
                                      showDialog<void>(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                          title: Text(
                                            'Edit',
                                            style: kInter.copyWith(
                                                fontSize: 18, fontWeight: bold),
                                            textAlign: TextAlign.center,
                                          ),
                                          content: Row(
                                            children: [
                                              Image.asset(
                                                'assets/images/bell.png',
                                                width: 20,
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                controllerReminder
                                                    .nameTextController
                                                    .text = remind.name!,
                                                style: kInter.copyWith(
                                                    fontSize: 16,
                                                    fontWeight: medium),
                                              ),
                                            ],
                                          ),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          actions: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: ButtonCustom(
                                                    text: "Edit",
                                                    elevatedMode: false,
                                                    onTap: () {
                                                      controllerReminder
                                                          .nameTextController
                                                          .text = remind.name!;
                                                      controllerReminder
                                                          .dateTextController
                                                          .text = remind.date!;
                                                      Get.back();
                                                      Get.toNamed(
                                                        RoutesName.addreminder,
                                                        arguments: {
                                                          "is_adding": true,
                                                          "id": remind.id
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                                SizedBox(
                                                    width: Get.width * 0.01),
                                                Expanded(
                                                  child: ButtonCustom(
                                                      text: 'Hapus'.tr,
                                                      elevatedMode: false,
                                                      blueMode: false,
                                                      onTap: () {
                                                        Get.back();
                                                        controllerReminder
                                                            .deleteReminder(
                                                          remind.id,
                                                        );
                                                      }),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    },
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
                                "Anda Belum Memiliki Tagihan".tr,
                                style: kInter.copyWith(
                                  color: defaultGray,
                                  fontSize: 13,
                                  fontWeight: medium,
                                ),
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
