import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/models/profile_user_model.dart';
import 'package:pawang_mobile/services/PengeluaranService.dart';
import 'package:pawang_mobile/services/user_service.dart';
import 'package:pawang_mobile/views/add_wallet.dart';
import 'package:pawang_mobile/views/detail_pengeluaran_screen.dart';
import 'package:pawang_mobile/views/kategori_screen.dart';
import 'package:pawang_mobile/views/scan_struk_screen.dart';
import 'package:pawang_mobile/views/setting_screen.dart';
import 'package:pawang_mobile/views/tambah_pemasukan.dart';
import 'package:pawang_mobile/views/tambah_pengeluaran.dart';
import 'package:pawang_mobile/views/wallet_screen.dart';
import 'package:pawang_mobile/widgets/CardPengeluaran2.dart';
import 'package:pawang_mobile/widgets/IconBottom.dart';
import 'package:pawang_mobile/widgets/LayananCard.dart';
import 'package:pawang_mobile/widgets/saldo_card.dart';
import 'package:skeleton_text/skeleton_text.dart';

class DashboardScreen extends StatefulWidget {
  static const String routeName = '/dashboard';
  DashboardScreen({Key? key}) : super(key: key);

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
        // cards.add({
        //   'name': 'Tambah',
        //   'amount': 2000,
        // });
        // setState(() {});
      },
      child: Container(
        decoration: BoxDecoration(
            color: kWhite, borderRadius: BorderRadius.circular(20)),
        child: Center(child: Icon(Icons.add_rounded)),
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
          decoration: BoxDecoration(
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
                                          fontSize: 12,
                                          fontWeight: bold,
                                          color: kWhite),
                                    ),
                                    user.name != ""
                                        ? Text(user.name,
                                            style: kOpenSans.copyWith(
                                                fontSize: 12,
                                                fontWeight: medium,
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
                  const SizedBox(height: 15),
                  CarouselSlider(
                    options: CarouselOptions(
                      disableCenter: true,
                      aspectRatio: 2.8,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                    ),
                    items: cardWidgets(),
                  ),
                  const SizedBox(
                    height: 20,
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
                              fontSize: 16, fontWeight: bold, color: kWhite),
                        ),
                        const SizedBox(
                          height: 20,
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
                  const SizedBox(height: 30),
                ],
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.42,
              minChildSize: 0.42,
              maxChildSize: 0.94,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin:
                            const EdgeInsets.only(left: 32, right: 32, top: 30),
                        child: Text(
                          'Riwayat',
                          style: kOpenSans.copyWith(
                              fontSize: 16, fontWeight: bold, color: kBlack),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: ListView.builder(
                            controller: scrollController,
                            itemCount: 1,
                            itemBuilder: (BuildContext context, index) {
                              return FutureBuilder(
                                future: dataPengeluaran,
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  if (snapshot.hasData) {
                                    if (snapshot.data?.length != 0) {
                                      return ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return InkWell(
                                            highlightColor: Colors.transparent,
                                            splashColor: Colors.transparent,
                                            onTap: () {
                                              Navigator.pushNamed(context,
                                                  DetailPengeluaran.routeName,
                                                  arguments:
                                                      snapshot.data[index]);
                                            },
                                            child: CardPengeluaran2(
                                                data: snapshot.data[index]),
                                          );
                                        },
                                        itemCount: snapshot.data?.length,
                                      );
                                    } else {
                                      return Expanded(
                                        child: Center(
                                            child: Text(
                                          "Anda belum memiliki pengeluaran",
                                          style: kOpenSans.copyWith(
                                              color: kGray,
                                              fontSize: 14,
                                              fontWeight: medium),
                                          textAlign: TextAlign.center,
                                        )),
                                      );
                                    }
                                  } else {
                                    return Expanded(
                                      child: Center(
                                          child: Text(
                                        "Anda belum memiliki pengeluaran",
                                        style: kOpenSans.copyWith(
                                            color: kGray,
                                            fontSize: 14,
                                            fontWeight: medium),
                                        textAlign: TextAlign.center,
                                      )),
                                    );
                                  }
                                },
                              );
                            }),
                      ),
                    ],
                  ),
                  decoration: const BoxDecoration(
                      color: kWhite,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24))),
                );
              },
            ),
          ]),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: SizedBox(
            height: 64,
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
