import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/models/pengeluaran_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

enum Menu { itemOne, itemTwo }

class CardPengeluaran extends StatefulWidget {
  const CardPengeluaran({Key? key, required this.data}) : super(key: key);
  final PengeluaranModel data;

  @override
  State<CardPengeluaran> createState() => _CardPengeluaranState();
}

class _CardPengeluaranState extends State<CardPengeluaran> {
  String _selectedMenu = '';

  @override
  Widget build(BuildContext context) {
    // PengeluaranModel data =
    //     ModalRoute.of(context)!.settings.arguments as PengeluaranModel;
    // final int? _id = data.id;
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 32, right: 32),
      child: Container(
        margin: const EdgeInsets.only(bottom: 18),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 21),
        height: 11.5.h,
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(1, 2), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              // ICON
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 3.4.h,
                  width: 7.6.w,
                  decoration: const BoxDecoration(
                      color: kSecondary,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: SvgPicture.asset(
                    'assets/images/makan_kategori.svg',
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // NAMA PENGELUARAN
                      Expanded(
                        child: Text(
                          widget.data.namaPengeluaran,
                          style: kOpenSans.copyWith(
                              //0.22.dp
                              fontSize: 12,
                              fontWeight: bold),
                        ),
                      ),
                      // NOMINAL
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              "Nominal  : ",
                              style: kOpenSans.copyWith(
                                  //0.20.dp
                                  fontSize: 10,
                                  fontWeight: semibold),
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            Text(
                              "- Rp. ${widget.data.nominalPengeluaran.toString()}",
                              style: kOpenSans.copyWith(
                                  fontSize: 10,
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
                              "Kategori  : ",
                              style: kOpenSans.copyWith(
                                  fontSize: 10, fontWeight: semibold),
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            Text(
                              widget.data.kategoriPengeluaran,
                              style: kOpenSans.copyWith(fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                      // TANGGAL/WAKTU
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              "Waktu      : ",
                              style: kOpenSans.copyWith(
                                  fontSize: 10, fontWeight: semibold),
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            Text(
                              widget.data.tanggalPengeluaran,
                              style: kOpenSans.copyWith(fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
