import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/models/user_profile_model.dart';
import 'package:pawang_mobile/models/transaction_model.dart';
import 'package:pawang_mobile/models/wallet_model.dart';
import 'package:pawang_mobile/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:pawang_mobile/services/transaction_service.dart';
import 'package:pawang_mobile/services/user_service.dart';
import 'package:pawang_mobile/services/wallet_service.dart';
import 'package:pawang_mobile/modules/category/views/kategori_screen.dart';
import 'package:pawang_mobile/utils/currency_format.dart';
import 'package:pawang_mobile/widgets/pengeluaran_card.dart';
import 'package:pawang_mobile/widgets/layanan_card.dart';
import 'package:pawang_mobile/widgets/saldo_card.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DashboardView extends StatelessWidget {
  DashboardView({Key? key}) : super(key: key);
  final DashboardController controller = Get.find();

  // late Future dataPengeluaran;
  // late Future<TransactionsModel> _transactions;
  // late Future<WalletsModel> _wallets;

  // get margin => null;

  // ProfileModel user = ProfileModel(
  //     id: 0,
  //     name: "",
  //     email: "",
  //     phone: "",
  //     gender: "",
  //     createdAt: DateTime.now(),
  //     updatedAt: DateTime.now());

  // @override
  // void initState() {
  //   super.initState();
  //   getUserProfile();
  //   _wallets = WalletService().getWallets();
  //   _transactions = TransactionService.getTransactions();
  // }

  // void getUserProfile() async {
  //   try {
  //     var dataUser = await UserService().userProfile();

  //     setState(() {
  //       user = dataUser as ProfileModel;
  //     });
  //   } catch (e) {
  //     final prefs = await SharedPreferences.getInstance();
  //     prefs.remove("token");
  //     Navigator.pushNamedAndRemoveUntil(
  //         context, LandingScreen.routeName, (route) => false);
  //   }
  // }

  Widget plus() {
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, AddWalletScreen.routeName);
      },
      child: Container(
        decoration: BoxDecoration(
            color: kWhite, borderRadius: BorderRadius.circular(20)),
        child: const Center(child: Icon(Icons.add_rounded)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [kPrimary, kPurple])),
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
                                color: kWhite,
                                borderRadius: BorderRadius.circular(50.0),
                                image: DecorationImage(
                                  image: AssetImage(controller
                                              .user.value.gender ==
                                          "male"
                                      ? "assets/images/man.png"
                                      : controller.user.value.gender == "female"
                                          ? "assets/images/woman.png"
                                          : "assets/images/white.jpg"),
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
                                        color: kWhite),
                                  ),
                                  controller.user.value.name != ""
                                      ? Text(controller.user.value.name,
                                          style: kOpenSans.copyWith(
                                              fontSize: 13,
                                              fontWeight: bold,
                                              color: kWhite))
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
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      kWhite.withOpacity(0.5),
                                      kWhite.withOpacity(0.3),
                                      kWhite.withOpacity(0.5)
                                    ]),
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                                child: Icon(
                              Icons.add_rounded,
                              color: kWhite.withOpacity(0.8),
                            )),
                          ),
                        );
                      }
                      var wallet = controller.wallets[index];
                      return GestureDetector(
                        onTap: () {},
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
                            color: kWhite),
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
                              // Navigator.pushNamed(
                              //     context, TambahPemasukanScreen.routeName);
                            },
                          ),
                          LayananCard(
                            icon: 'assets/images/pengeluaran.png',
                            title: 'Pengeluaran',
                            onTap: () {
                              // Navigator.pushNamed(
                              //     context, TambahPengeluaranScreen.routeName);
                            },
                          ),
                          LayananCard(
                            icon: 'assets/images/wallet.png',
                            title: 'Dompet',
                            onTap: () {
                              // Navigator.pushNamed(
                              //     context, WalletScreen.routeName);
                            },
                          ),
                          LayananCard(
                            icon: 'assets/images/kategori.png',
                            title: 'Kategori',
                            onTap: () {
                              Navigator.pushNamed(
                                  context, KategoriScreen.routeName);
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
                                        color: kGray.withOpacity(0.7),
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
                                      color: kBlack),
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
                                              onTap: () {
                                                // Navigator.pushNamed(context,
                                                //     DetailPengeluaran.routeName,
                                                //     arguments:
                                                //         snapshot.data!.data[index]);
                                              },
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
                                            "Anda belum memiliki pengeluaran",
                                            style: kOpenSans.copyWith(
                                                color: kGray,
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
                        color: kWhite,
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