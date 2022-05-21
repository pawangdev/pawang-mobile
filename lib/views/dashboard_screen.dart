import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawang_mobile/config/theme_constants.dart';
import 'package:pawang_mobile/services/PengeluaranService.dart';
import 'package:pawang_mobile/views/detail_pengeluaran_screen.dart';
import 'package:pawang_mobile/views/kategori_screen.dart';
import 'package:pawang_mobile/views/landing_screen.dart';
import 'package:pawang_mobile/views/riwayat_screen.dart';
import 'package:pawang_mobile/views/scan_struk_screen.dart';
import 'package:pawang_mobile/widgets/CardPengeluaran2.dart';
import 'package:pawang_mobile/widgets/IconBottom.dart';
import 'package:pawang_mobile/widgets/LayananCard.dart';

class DashboardScreen extends StatefulWidget {
  static const String routeName = '/dashboard';
  DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late Future dataPengeluaran;

  get margin => null;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPurple,
        body: Stack(children: <Widget>[
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 30, left: 32, right: 32),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/images/profile_white.svg'),
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
                                  Text("Mu'adz Fathulloh",
                                      style: kOpenSans.copyWith(
                                          fontSize: 12,
                                          fontWeight: medium,
                                          color: kWhite))
                                ],
                              ),
                            ),
                          ]),
                      InkWell(
                        child: const Icon(
                          Icons.logout_rounded,
                          color: kWhite,
                        ),
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  color: const Color(0xFF737373),
                                  child: Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).canvasColor,
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(30),
                                            topRight: Radius.circular(30))),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Text(
                                            'Keluar',
                                            style: kOpenSans.copyWith(
                                                color: kBlack,
                                                fontWeight: bold,
                                                fontSize: 16),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            'Apakah anda yakin ingin keluar?',
                                            style: kOpenSans.copyWith(
                                                color: kGray,
                                                fontWeight: medium,
                                                fontSize: 12),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 120, right: 120),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                ElevatedButton(
                                                  style: ButtonStyle(
                                                    fixedSize:
                                                        MaterialStateProperty
                                                            .all(const Size(
                                                                60, 30)),
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(kPurple),
                                                    shape: MaterialStateProperty
                                                        .all(
                                                      RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                    ),
                                                  ),
                                                  child: Text(
                                                    'Ya',
                                                    style: kOpenSans.copyWith(
                                                        color: kWhite,
                                                        fontWeight: semibold,
                                                        fontSize: 14),
                                                  ),
                                                  onPressed: () =>
                                                      Navigator.pushNamed(
                                                          context,
                                                          LandingScreen
                                                              .routeName),
                                                ),
                                                OutlinedButton(
                                                  child: Text(
                                                    "Tidak",
                                                    style: kOpenSans.copyWith(
                                                        fontSize: 14,
                                                        fontWeight: bold,
                                                        color: kPurple),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                    padding: const EdgeInsets
                                                        .symmetric(vertical: 4),
                                                    side: const BorderSide(
                                                        color: kPurple),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        },
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 35),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Saldo',
                          style: kOpenSans.copyWith(
                            color: kBlack,
                            fontWeight: medium,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Rp. XXXXXXXX',
                          style: kOpenSans.copyWith(
                            color: kBlack,
                            fontWeight: bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: kWhite,
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 0.5,
                          blurRadius: 0.5,
                          offset:
                              const Offset(1, 3), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                            onTap: () {},
                          ),
                          LayananCard(
                            icon: 'assets/images/pengeluaran.svg',
                            title: 'Pengeluaran',
                            onTap: () {},
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
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.45,
            minChildSize: 0.45,
            maxChildSize: 0.65,
            builder: (BuildContext context, ScrollController scrollController) {
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
                                        "Anda belum memiliki pengeluaran. Silahkan scan struk belanja Anda melalui tombol di bawah ini.",
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
                                      "Anda belum memiliki pengeluaran. Silahkan scan struk belanja Anda melalui tombol di bawah ini.",
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
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: SizedBox(
            height: 64,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconBottomBar(
                      text: "Beranda",
                      icon: Icons.home,
                      selected: true,
                      onPressed: () {}),
                  IconBottomBar(
                      text: "Scan Struk",
                      icon: Icons.fullscreen,
                      selected: false,
                      onPressed: () {
                        Navigator.pushNamed(context, ScanStruk.routeName);
                      }),
                  IconBottomBar(
                      text: "Riwayat",
                      icon: Icons.library_books_outlined,
                      selected: false,
                      onPressed: () {
                        Navigator.pushNamed(context, RiwayatScreen.routeName);
                      }),
                ],
              ),
            ),
          ),
        ));
  }
}
