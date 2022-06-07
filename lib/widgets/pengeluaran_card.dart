import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawang_mobile/constants/strings.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/models/transaction_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CardPengeluaran extends StatefulWidget {
  const CardPengeluaran({Key? key, required this.data}) : super(key: key);
  final TransactionModel data;

  @override
  State<CardPengeluaran> createState() => _CardPengeluaranState();
}

class _CardPengeluaranState extends State<CardPengeluaran> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 32, right: 32),
      child: Container(
        margin: EdgeInsets.only(top: 8),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: kBlack.withOpacity(0.07),
                spreadRadius: 2,
                blurRadius: 10,
              )
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 3.4.h,
                  width: 7.6.w,
                  decoration: const BoxDecoration(
                      color: kSecondary,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Image.network(
                    baseURLAPI + widget.data.category.iconUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // NAMA PENGELUARAN
                      Text(
                        widget.data.category.name,
                        style: kOpenSans.copyWith(
                            //0.22.dp
                            fontSize: 16,
                            fontWeight: bold),
                      ),
                      // TANGGAL/WAKTU
                      Row(
                        children: [
                          Text(
                            widget.data.date.toLocal().toString(),
                            style: kOpenSans.copyWith(
                                fontSize: 14, color: kGray.withOpacity(0.9)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              child: Text("${widget.data.amount.toString()} IDR",
                  style: kOpenSans.copyWith(fontSize: 16, fontWeight: bold)),
            ),
          ],
        ),
      ),
    );
  }
}
