import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawang_mobile/config/theme_constants.dart';

class RiwayatScreen extends StatelessWidget {
  static const String routName = '/riwayat';
  RiwayatScreen({Key? key}) : super(key: key);

  List<Map<String, dynamic>> history = [
    {
      "nama": "Gaji Bulan April",
      "nominal": 2000000,
      "kategory": "Gaji",
      "waktu": "Selasa, 12 April 2022 13.00",
      "tipe": true,
    },
    {
      "nama": "Makan Siang",
      "nominal": 20000,
      "kategory": "Makan",
      "waktu": "Selasa, 12 April 2022 18.30",
      "tipe": false,
    },
    {
      "nama": "Gaji Bulan April",
      "nominal": 2000000,
      "kategory": "Gaji",
      "waktu": "Selasa, 12 April 2022 13.00",
      "tipe": true,
    },
    {
      "nama": "Makan Siang",
      "nominal": 20000,
      "kategory": "Makan",
      "waktu": "Selasa, 12 April 2022 18.30",
      "tipe": false,
    },
    {
      "nama": "Gaji Bulan April",
      "nominal": 2000000,
      "kategory": "Gaji",
      "waktu": "Selasa, 12 April 2022 13.00",
      "tipe": true,
    },
  ];

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
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 18),
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 21),
                        width: 296,
                        height: 106,
                        decoration: BoxDecoration(
                            color: kWhite,
                            borderRadius: BorderRadius.circular(6)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                history[index]['nama'],
                                style: kOpenSans.copyWith(
                                    fontSize: 12, fontWeight: bold),
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Text(
                                    "Nominal : ",
                                    style: kOpenSans.copyWith(
                                        fontSize: 12, fontWeight: semibold),
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  history[index]['tipe']
                                      ? Text(
                                          "+ Rp. ${history[index]['nominal'].toString()}",
                                          style: kOpenSans.copyWith(
                                              fontSize: 10,
                                              fontWeight: semibold,
                                              color: kSuccess),
                                        )
                                      : Text(
                                          "- Rp. ${history[index]['nominal']}",
                                          style: kOpenSans.copyWith(
                                              fontSize: 10,
                                              fontWeight: semibold,
                                              color: kWarning),
                                        ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Text(
                                    "Kategori : ",
                                    style: kOpenSans.copyWith(
                                        fontSize: 12, fontWeight: semibold),
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    history[index]['kategory'],
                                    style: kOpenSans.copyWith(fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Text(
                                    "Waktu : ",
                                    style: kOpenSans.copyWith(
                                        fontSize: 12, fontWeight: semibold),
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    history[index]['waktu'],
                                    style: kOpenSans.copyWith(fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: history.length,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.pushNamed(context, DetailPengeluaran.routeName)
        },
        child: SvgPicture.asset('assets/images/scan_btn.svg'),
        backgroundColor: kPurple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
