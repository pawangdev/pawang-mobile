import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/constants/theme.dart';

class CardPengeluaran2 extends StatelessWidget {
  const CardPengeluaran2({Key? key, required this.data}) : super(key: key);
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 32, right: 32, bottom: 16),
      height: Get.height * 0.084,
      decoration: BoxDecoration(
        color: defaultWhite,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1.5,
            blurRadius: 0.5,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: Get.height * 0.064,
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
                  data.kategoriPengeluaran,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: kInter.copyWith(fontSize: 12, fontWeight: semiBold),
                ),
              ),
              //NOMINAL

              Expanded(
                child: Text(
                  "- Rp. ${data.nominalPengeluaran.toString()}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: kInter.copyWith(
                      fontSize: 12,
                      fontWeight: semiBold,
                      color: defaultSecondary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
