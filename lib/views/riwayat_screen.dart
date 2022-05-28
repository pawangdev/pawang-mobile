import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawang_mobile/config/theme_constants.dart';
import 'package:pawang_mobile/models/PengeluaranModel.dart';
import 'package:pawang_mobile/services/PengeluaranService.dart';
import 'package:pawang_mobile/views/dashboard_screen.dart';
import 'package:pawang_mobile/views/detail_pengeluaran_screen.dart';
import 'package:pawang_mobile/views/landing_screen.dart';
import 'package:pawang_mobile/views/scan_struk_screen.dart';
import 'package:pawang_mobile/views/tambah_pemasukan.dart';
import 'package:pawang_mobile/views/tambah_pengeluaran.dart';
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
                Center(
                  child: Text(
                    "Riwayat",
                    style: kOpenSans.copyWith(
                        fontSize: 16, fontWeight: bold, color: kBlack),
                  ),
                ),
                const SizedBox(
                  height: 31,
                ),
                Row(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, TambahPemasukanScreen.routeName);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.add_rounded,
                              size: 20,
                            ),
                            Text(
                              "Tambah Pemasukan",
                              style: kOpenSans.copyWith(
                                  fontSize: 11, fontWeight: bold),
                            ),
                          ],
                        ),
                        style: ButtonStyle(
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(10)),
                          backgroundColor: MaterialStateProperty.all(kPrimary),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, TambahPengeluaranScreen.routeName);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.add_rounded,
                              size: 20,
                            ),
                            Text(
                              "Tambah Pengeluaran",
                              style: kOpenSans.copyWith(
                                  fontSize: 11, fontWeight: bold),
                            ),
                          ],
                        ),
                        style: ButtonStyle(
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(10)),
                          backgroundColor: MaterialStateProperty.all(kPrimary),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
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
                            "Anda belum memiliki pengeluaran",
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
                          "Anda belum memiliki pengeluaran",
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
              padding: const EdgeInsets.symmetric(horizontal: 42),
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
