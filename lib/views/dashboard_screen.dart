import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/services/pengeluaran_service.dart';
import 'package:pawang_mobile/views/add_wallet.dart';
import 'package:pawang_mobile/views/detail_pengeluaran_screen.dart';
import 'package:pawang_mobile/views/kategori_screen.dart';
import 'package:pawang_mobile/views/scan_struk_screen.dart';
import 'package:pawang_mobile/views/setting_screen.dart';
import 'package:pawang_mobile/views/tambah_pemasukan.dart';
import 'package:pawang_mobile/views/tambah_pengeluaran.dart';
import 'package:pawang_mobile/views/wallet_screen.dart';
import 'package:pawang_mobile/widgets/pengeluaran_card.dart';
import 'package:pawang_mobile/widgets/icon_bottom.dart';
import 'package:pawang_mobile/widgets/layanan_card.dart';
import 'package:pawang_mobile/widgets/saldo_card.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  get margin => null;

  Future getToken() async {
    final prefs = await SharedPreferences.getInstance();
    print(prefs.getString('token'));
  }

  @override
  void initState() {
    super.initState();
    updateListView();
  }

  void updateListView() {
    setState(() {
      dataPengeluaran = PengeluaranService().read();
    });
  }

  Widget plus() {
    return GestureDetector(
      onTap: () {
        getToken();
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
            balance: '${cards[index]['amount']}',
            color: kWhite));

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
                                          fontSize: 0.22.dp,
                                          fontWeight: bold,
                                          color: kWhite),
                                    ),
                                    Text("Mu'adz Fathulloh",
                                        style: kOpenSans.copyWith(
                                            fontSize: 0.22.dp,
                                            fontWeight: medium,
                                            color: kWhite))
                                  ],
                                ),
                              ),
                            ]),
                      ],
                    ),
                  ),
                  SizedBox(height: 2.h),
                  CarouselSlider(
                    options: CarouselOptions(
                      disableCenter: true,
                      aspectRatio: 2.8,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                    ),
                    items: cardWidgets(),
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
                              fontSize: 0.25.dp,
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
              initialChildSize: 0.42,
              minChildSize: 0.42,
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
                                          color: kGray,
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.only(left: 32, top: 20),
                                  child: Text(
                                    'Riwayat',
                                    textAlign: TextAlign.start,
                                    style: kOpenSans.copyWith(
                                        fontSize: 0.25.dp,
                                        fontWeight: bold,
                                        color: kBlack),
                                  ),
                                ),
                                Container(
                                  constraints: BoxConstraints(minHeight: 30.h),
                                  child: FutureBuilder(
                                    future: dataPengeluaran,
                                    builder: (BuildContext context,
                                        AsyncSnapshot snapshot) {
                                      if (snapshot.hasData) {
                                        if (snapshot.data?.length != 0) {
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
                                                      arguments:
                                                          snapshot.data[index]);
                                                },
                                                child: CardPengeluaran(
                                                    data: snapshot.data[index]),
                                              );
                                            },
                                            itemCount: snapshot.data?.length,
                                          );
                                        } else {
                                          return Center(
                                              child: Text(
                                            "Anda belum memiliki pengeluaran",
                                            style: kOpenSans.copyWith(
                                                color: kGray,
                                                fontSize: 0.23.dp,
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
                                              fontSize: 0.23.dp,
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
            height: 8.h,
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
