import 'package:flutter/material.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/services/pengeluaran_service.dart';
import 'package:pawang_mobile/views/dashboard_screen.dart';
import 'package:pawang_mobile/views/detail_pengeluaran_screen.dart';
import 'package:pawang_mobile/views/scan_struk_screen.dart';
import 'package:pawang_mobile/views/tambah_pemasukan.dart';
import 'package:pawang_mobile/views/tambah_pengeluaran.dart';
import 'package:pawang_mobile/widgets/pengeluaran_card.dart';
import 'package:pawang_mobile/widgets/icon_bottom.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RiwayatScreen extends StatefulWidget {
  static const String routeName = '/riwayat';
  const RiwayatScreen({Key? key}) : super(key: key);

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
                        fontSize: 0.253.dp, fontWeight: bold, color: kBlack),
                  ),
                ),
                SizedBox(
                  height: 3.5.h,
                ),
                Row(
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
                            const Icon(
                              Icons.add_rounded,
                              size: 20,
                            ),
                            Text(
                              "Tambah Pemasukan",
                              style: kOpenSans.copyWith(
                                  fontSize: 0.21.dp, fontWeight: bold),
                            ),
                          ],
                        ),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(10)),
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
                      width: 1.w,
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
                            const Icon(
                              Icons.add_rounded,
                              size: 20,
                            ),
                            Text(
                              "Tambah Pengeluaran",
                              style: kOpenSans.copyWith(
                                  fontSize: 0.21.dp, fontWeight: bold),
                            ),
                          ],
                        ),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(10)),
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
                  height: 3.4.h,
                ),
                FutureBuilder(
                  future: dataPengeluaran,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data?.length != 0) {
                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
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
                                color: kGray,
                                fontSize: 0.245.dp,
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
                              fontSize: 0.245.dp,
                              fontWeight: medium),
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
            height: 6.8.h,
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
