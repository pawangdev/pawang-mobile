import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawang_mobile/config/theme_constants.dart';
import 'package:pawang_mobile/models/PengeluaranModel.dart';
import 'package:pawang_mobile/services/PengeluaranService.dart';
import 'package:pawang_mobile/views/dashboard_screen.dart';
import 'package:pawang_mobile/views/detail_pengeluaran_screen.dart';
import 'package:pawang_mobile/views/landing_screen.dart';
import 'package:pawang_mobile/views/scan_struk_screen.dart';
import 'package:pawang_mobile/widgets/CardPengeluaran.dart';
import 'package:pawang_mobile/widgets/IconBottom.dart';

class RiwayatScreen extends StatefulWidget {
  static const String routeName = '/riwayat';
  RiwayatScreen({Key? key}) : super(key: key);

  @override
  State<RiwayatScreen> createState() => _RiwayatScreenState();
}

class _RiwayatScreenState extends State<RiwayatScreen> {
  late Future dataPengeluaran;

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
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, left: 32, right: 32),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: Container(
                        width: 32,
                        height: 32,
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          border: Border.all(color: kPurple),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: SvgPicture.asset(
                          'assets/images/back_btn.svg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      "Riwayat",
                      style: kOpenSans.copyWith(
                          fontSize: 16, fontWeight: bold, color: kBlack),
                    ),
                    Container(
                      width: 22,
                      height: 32,
                      padding: EdgeInsets.all(6),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 31,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 170,
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.add_rounded,
                            color: kWhite,
                            size: 14,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 6),
                            child: Text(
                              'Tambah Pemasukan',
                              style: kOpenSans.copyWith(
                                color: kWhite,
                                fontWeight: semibold,
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: kPurple,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 0.5,
                            blurRadius: 0.5,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 170,
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.add_rounded,
                            color: kWhite,
                            size: 14,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 6),
                            child: Text(
                              'Tambah Pengeluaran',
                              style: kOpenSans.copyWith(
                                color: kWhite,
                                fontWeight: semibold,
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: kPurple,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 0.5,
                            blurRadius: 0.5,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                FutureBuilder(
                  future: dataPengeluaran,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data?.length != 0) {
                        return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onTap: () {
                                Navigator.pushNamed(
                                    context, DetailPengeluaran.routeName,
                                    arguments: snapshot.data[index]);
                              },
                              child:
                                  CardPengeluaran(data: snapshot.data[index]),
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
                                color: kGray, fontSize: 14, fontWeight: medium),
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
                              color: kGray, fontSize: 14, fontWeight: medium),
                          textAlign: TextAlign.center,
                        )),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
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
                      selected: false,
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
                      text: "Riwayat",
                      icon: Icons.library_books_outlined,
                      selected: true,
                      onPressed: () {}),
                ],
              ),
            ),
          ),
        ));
  }
}
