import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:pawang_mobile/constants/strings.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/models/transaction_model.dart';
import 'package:pawang_mobile/widgets/currency_format.dart';
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
      padding: const EdgeInsets.only(bottom: 8, left: 32, right: 32),
      child: Container(
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
                  width: 7.2.w,
                  decoration: const BoxDecoration(
                      color: kSecondary,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Image.network(
                    baseURLAPI + widget.data.category.iconUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 30.w,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // NAMA PENGELUARAN
                        Text(
                          widget.data.category.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: kOpenSans.copyWith(
                            //0.22.dp
                            fontSize: 16,
                            fontWeight: semibold,
                          ),
                        ),
                        // TANGGAL
                        Text(
                          DateFormat("dd/MM/yyyy")
                              .format(widget.data.date.toLocal())
                              .toString(),
                          overflow: TextOverflow.ellipsis,
                          style: kOpenSans.copyWith(
                            fontSize: 14,
                            color: kGray.withOpacity(0.9),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Text(CurrencyFormat.convertToIdr(widget.data.amount, 2).toString(),
                style: kOpenSans.copyWith(
                    fontSize: 16,
                    fontWeight: bold,
                    overflow: TextOverflow.ellipsis)),
          ],
        ),
      ),
    );
  }
}
