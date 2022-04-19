import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawang_mobile/config/theme_constants.dart';
import 'package:pawang_mobile/models/PengeluaranModel.dart';
import 'package:pawang_mobile/services/PengeluaranService.dart';
import 'package:pawang_mobile/views/detail_pengeluaran_screen.dart';
import 'package:pawang_mobile/views/scan_struk_screen.dart';

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
                      color: kBlack, fontWeight: bold, fontSize: 16),
                ),
              ),
              FutureBuilder(
                future: dataPengeluaran,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data?.length != 0) {
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, DetailPengeluaran.routeName,
                                  arguments: snapshot.data[index]);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 18),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 21),
                              width: 296,
                              height: 106,
                              decoration: BoxDecoration(
                                  color: kWhite,
                                  borderRadius: BorderRadius.circular(6)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // NAMA PENGELUARAN
                                  Expanded(
                                    child: Text(
                                      snapshot.data![index].nama_pengeluaran,
                                      style: kOpenSans.copyWith(
                                          fontSize: 12, fontWeight: bold),
                                    ),
                                  ),
                                  // NOMINAL
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Text(
                                          "Nominal : ",
                                          style: kOpenSans.copyWith(
                                              fontSize: 12,
                                              fontWeight: semibold),
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          "+ Rp. ${snapshot.data![index].nominal_pengeluaran.toString()}",
                                          style: kOpenSans.copyWith(
                                              fontSize: 10,
                                              fontWeight: semibold,
                                              color: kWarning),
                                        )
                                      ],
                                    ),
                                  ),
                                  // KATEGORI
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Text(
                                          "Kategori : ",
                                          style: kOpenSans.copyWith(
                                              fontSize: 12,
                                              fontWeight: semibold),
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          snapshot.data![index]
                                              .kategori_pengeluaran,
                                          style:
                                              kOpenSans.copyWith(fontSize: 10),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // TANGGAL/WAKTU
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Text(
                                          "Waktu : ",
                                          style: kOpenSans.copyWith(
                                              fontSize: 12,
                                              fontWeight: semibold),
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          snapshot
                                              .data![index].tanggal_pengeluaran,
                                          style:
                                              kOpenSans.copyWith(fontSize: 10),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, ScanStruk.routeName);
        },
        child: SvgPicture.asset('assets/images/scan_btn.svg'),
        backgroundColor: kPurple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
