import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawang_mobile/models/PengeluaranModel.dart';

class CardPengeluaran2 extends StatelessWidget {
  const CardPengeluaran2({Key? key, required this.data}) : super(key: key);
  final PengeluaranModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 32, right: 32, bottom: 16),
      height: 80,
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1.5,
            blurRadius: 0.5,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 60,
          child: Row(
            children: [
              // ICON
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(
                  'assets/images/makan_kategori.svg',
                  fit: BoxFit.cover,
                ),
              ),
              //KATEGORI
              Expanded(
                child: Text(
                  data.kategori_pengeluaran,
                  style: kOpenSans.copyWith(fontSize: 14, fontWeight: semibold),
                ),
              ),
              //NOMINAL

              Expanded(
                child: Text(
                  "- Rp. ${data.nominal_pengeluaran.toString()}",
                  style: kOpenSans.copyWith(
                      fontSize: 14, fontWeight: semibold, color: kSecondary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
