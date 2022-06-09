import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/models/profile_user_model.dart';
import 'package:pawang_mobile/models/transaction_model.dart';
import 'package:pawang_mobile/models/wallet_model.dart';
import 'package:pawang_mobile/services/transaction_service.dart';
import 'package:pawang_mobile/services/user_service.dart';
import 'package:pawang_mobile/services/pengeluaran_service.dart';
import 'package:pawang_mobile/services/wallet_service.dart';
import 'package:pawang_mobile/views/add_wallet.dart';
import 'package:pawang_mobile/views/detail_pengeluaran_screen.dart';
import 'package:pawang_mobile/views/kategori_screen.dart';
import 'package:pawang_mobile/views/scan_struk_screen.dart';
import 'package:pawang_mobile/views/setting_screen.dart';
import 'package:pawang_mobile/views/tambah_pemasukan.dart';
import 'package:pawang_mobile/views/tambah_pengeluaran.dart';
import 'package:pawang_mobile/views/wallet_screen.dart';
import 'package:pawang_mobile/utils/currency_format.dart';
import 'package:pawang_mobile/widgets/pengeluaran_card.dart';
import 'package:pawang_mobile/widgets/icon_bottom.dart';
import 'package:pawang_mobile/widgets/layanan_card.dart';
import 'package:pawang_mobile/widgets/saldo_card.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DashboardScreen extends StatefulWidget {
  static const String routeName = '/dashboard';
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

List<Map<String, dynamic>> cards = [
  {
    'name': 'My Wallet',
    'amount': 30000,
  },
];

class _DashboardScreenState extends State<DashboardScreen> {
  late Future dataPengeluaran;
  late Future<TransactionsModel> _transactions;
  late Future<WalletsModel> _wallets;

  get margin => null;

  ProfileModel user = ProfileModel(
      id: 0,
      name: "",
      email: "",
      phone: "",
      gender: "",
      createdAt: DateTime.now(),
      updatedAt: DateTime.now());

  @override
  void initState() {
    super.initState();
    updateListView();
    getUserProfile();
    _wallets = WalletService().getWallets();
    _transactions = TransactionService.getTransactions();
  }

  void getUserProfile() async {
    var dataUser = await UserService().userProfile();

    setState(() {
      user = dataUser as ProfileModel;
    });
  }

  void updateListView() {
    setState(() {
      dataPengeluaran = PengeluaranService().read();
    });
  }

  Widget plus() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AddWalletScreen.routeName);
      },
      child: Container(
        decoration: BoxDecoration(
            color: kWhite, borderRadius: BorderRadius.circular(20)),
        child: const Center(child: Icon(Icons.add_rounded)),
      ),
    );
  }

  List<Widget> cardWidgets() {
    List<Widget> widgets = List<Widget>.generate(
        cards.length,
        (index) => WalletCard(
              name: '${cards[index]['name']}',
              namaWallet: '${cards[index]['namaWallet']}',
              balance: '${cards[index]['balance']}',
            ));

    widgets.add(plus());

    return widgets;
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
                    padding:
                        const EdgeInsets.only(top: 30, left: 32, right: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                  'assets/images/profile_white.svg'),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Hallo,",
                                      style: kOpenSans.copyWith(
                                          fontSize: 11,
                                          //0.2.dp,
                                          fontWeight: medium,
                                          color: kWhite),
                                    ),
                                    user.name != ""
                                        ? Text(user.name,
                                            style: kOpenSans.copyWith(
                                                fontSize: 12,
                                                fontWeight: bold,
                                                color: kWhite))
                                        : SkeletonAnimation(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            shimmerColor: Colors.white54,
                                            child: Container(
                                              height: 12,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.25,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                color: Colors.white
                                                    .withOpacity(0.5),
                                              ),
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                            ]),
                      ],
                    ),
                  ),
                  SizedBox(height: 2.h),
                  FutureBuilder(
                    future: _wallets,
                    builder: (BuildContext context,
                        AsyncSnapshot<WalletsModel> snapshot) {
                      var state = snapshot.connectionState;
                      if (state != ConnectionState.done) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        if (snapshot.hasData) {
                          return CarouselSlider.builder(
                            itemCount: snapshot.data!.data.length + 1,
                            options: CarouselOptions(
                              disableCenter: true,
                              aspectRatio: 2.8,
                              enlargeCenterPage: true,
                              enableInfiniteScroll: false,
                            ),
                            itemBuilder: (BuildContext context, int index,
                                int realIndex) {
                              if (index == snapshot.data!.data.length) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, AddWalletScreen.routeName);
                                  },
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
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Center(
                                        child: Icon(
                                      Icons.add_rounded,
                                      color: kWhite.withOpacity(0.8),
                                    )),
                                  ),
                                );
                              }
                              var wallet = snapshot.data!.data[index];
                              return WalletCard(
                                  name: user.name,
                                  namaWallet: wallet.name,
                                  balance: CurrencyFormat.convertToIdr(
                                          wallet.balance, 2)
                                      .toString());
                            },
                          );
                        } else if (snapshot.hasError) {
                          return Center(child: Text(snapshot.error.toString()));
                        } else {
                          return Text('');
                        }
                      }
                    },
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
                              icon: 'assets/images/pemasukan.svg',
                              title: 'Pemasukan',
                              onTap: () {
                                Navigator.pushNamed(
                                    context, TambahPemasukanScreen.routeName);
                              },
                            ),
                            LayananCard(
                              icon: 'assets/images/pengeluaran.svg',
                              title: 'Pengeluaran',
                              onTap: () {
                                Navigator.pushNamed(
                                    context, TambahPengeluaranScreen.routeName);
                              },
                            ),
                            LayananCard(
                              icon: 'assets/images/wallet.svg',
                              title: 'Dompet',
                              onTap: () {
                                Navigator.pushNamed(
                                    context, WalletScreen.routeName);
                              },
                            ),
                            LayananCard(
                              icon: 'assets/images/kategori.svg',
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
              initialChildSize: 0.43,
              minChildSize: 0.43,
              maxChildSize: 0.94,
              builder:
                  (BuildContext context, ScrollController scrollController) {
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
                                  child: FutureBuilder(
                                    future: _transactions,
                                    builder: (BuildContext context,
                                        AsyncSnapshot<TransactionsModel>
                                            snapshot) {
                                      if (snapshot.hasData) {
                                        if (snapshot.data?.data.length != 0) {
                                          return ListView.builder(
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
                                                  Navigator.pushNamed(
                                                      context,
                                                      DetailPengeluaran
                                                          .routeName,
                                                      arguments: snapshot
                                                          .data!.data[index]);
                                                },
                                                child: CardPengeluaran(
                                                    data: snapshot
                                                        .data!.data[index]),
                                              );
                                            },
                                            itemCount:
                                                snapshot.data?.data.length,
                                          );
                                        } else {
                                          return Center(
                                              child: Text(
                                            "Anda belum memiliki pengeluaran",
                                            style: kOpenSans.copyWith(
                                                color: kGray,
                                                fontSize: 13, //0.23.dp,
                                                fontWeight: medium),
                                            textAlign: TextAlign.center,
                                          ));
                                        }
                                      } else {
                                        return Center(
                                            child: Text(
                                          "Anda belum memiliki pengeluaran",
                                          style: kOpenSans.copyWith(
                                              color: kGray,
                                              fontSize: 13,
                                              fontWeight: medium),
                                          textAlign: TextAlign.center,
                                        ));
                                      }
                                    },
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
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: SizedBox(
            height: 7.h,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 42),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconBottomBar(
                      text: "Beranda",
                      icon: Icons.home,
                      selected: true,
                      onPressed: () {
                        Navigator.pushNamed(context, DashboardScreen.routeName);
                      }),
                  IconBottomBar(
                      text: "Scan Struk",
                      icon: Icons.fullscreen,
                      selected: false,
                      onPressed: () {
                        Navigator.pushNamed(context, ScanStruk.routeName);
                      }),
                  IconBottomBar(
                      text: "Pengaturan",
                      icon: Icons.settings_outlined,
                      selected: false,
                      onPressed: () {
                        Navigator.pushNamed(context, SettingsScreen.routeName);
                      }),
                ],
              ),
            ),
          ),
        ));
  }
}
