import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawang_mobile/config/theme_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawang_mobile/models/PengeluaranModel.dart';

class CardPengeluaran extends StatelessWidget {
  const CardPengeluaran({Key? key, required this.data}) : super(key: key);
  final PengeluaranModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 21),
      width: 296,
      height: 106,
      decoration:
          BoxDecoration(color: kWhite, borderRadius: BorderRadius.circular(6)),
      child: Row(
        // ICON
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            'assets/images/scan_btn.svg',
            color: kSecondary,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // NAMA PENGELUARAN
                Expanded(
                  child: Text(
                    data.nama_pengeluaran,
                    style: kOpenSans.copyWith(fontSize: 12, fontWeight: bold),
                  ),
                ),
                // NOMINAL
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        "Nominal : ",
                        style: kOpenSans.copyWith(
                            fontSize: 11, fontWeight: semibold),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        "- Rp. ${data.nominal_pengeluaran.toString()}",
                        style: kOpenSans.copyWith(
                            fontSize: 11,
                            fontWeight: semibold,
                            color: kSecondary),
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
                            fontSize: 11, fontWeight: semibold),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        data.kategori_pengeluaran,
                        style: kOpenSans.copyWith(fontSize: 11),
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
                            fontSize: 11, fontWeight: semibold),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        data.tanggal_pengeluaran,
                        style: kOpenSans.copyWith(fontSize: 11),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
