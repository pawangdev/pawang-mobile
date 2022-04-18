import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawang_mobile/config/theme_constants.dart';
import 'package:pawang_mobile/models/PengeluaranModel.dart';
import 'package:pawang_mobile/services/PengeluaranService.dart';
import 'package:pawang_mobile/views/DetailPengeluaran.dart';
import 'package:pawang_mobile/views/ScanStruk.dart';

class RiwayatScreen extends StatefulWidget {
  static const String routeName = '/riwayat';
  RiwayatScreen({Key? key}) : super(key: key);

  @override
  State<RiwayatScreen> createState() => _RiwayatScreenState();
}

class _RiwayatScreenState extends State<RiwayatScreen> {
  late Future<List<PengeluaranModel>> dataPengeluaran;

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
  // List<Map<String, dynamic>> history = [
  //   {
  //     "nama": "Gaji Bulan April",
  //     "nominal": 2000000,
  //     "kategory": "Gaji",
  //     "waktu": "Selasa, 12 April 2022 13.00",
  //     "tipe": true,
  //   },
  //   {
  //     "nama": "Makan Siang",
  //     "nominal": 20000,
  //     "kategory": "Makan",
  //     "waktu": "Selasa, 12 April 2022 18.30",
  //     "tipe": false,
  //   },
  //   {
  //     "nama": "Gaji Bulan April",
  //     "nominal": 2000000,
  //     "kategory": "Gaji",
  //     "waktu": "Selasa, 12 April 2022 13.00",
  //     "tipe": true,
  //   },
  //   {
  //     "nama": "Makan Siang",
  //     "nominal": 20000,
  //     "kategory": "Makan",
  //     "waktu": "Selasa, 12 April 2022 18.30",
  //     "tipe": false,
  //   },
  //   {
  //     "nama": "Gaji Bulan April",
  //     "nominal": 2000000,
  //     "kategory": "Gaji",
  //     "waktu": "Selasa, 12 April 2022 13.00",
  //     "tipe": true,
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
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
                SizedBox(
                  height: 31,
                ),
                Expanded(
                  child: FutureBuilder(
                    future: dataPengeluaran,
                    builder: (BuildContext context,
                        AsyncSnapshot<List<PengeluaranModel>> snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, DetailPengeluaran.routeName,
                                    arguments: snapshot.data!);
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: 18),
                                padding: EdgeInsets.symmetric(
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
                                            style: kOpenSans.copyWith(
                                                fontSize: 10),
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
                                            snapshot.data![index]
                                                .tanggal_pengeluaran,
                                            style: kOpenSans.copyWith(
                                                fontSize: 10),
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
                        return Center(
                            child: Text(
                          "Anda belum memiliki pengeluaran. Silahkan scan struk belanja Anda melalui tombol di bawah ini.",
                          style: kOpenSans.copyWith(
                              color: kGray, fontSize: 14, fontWeight: medium),
                        ));
                      }
                    },
                  ),
                )
              ],
            ),
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
