import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawang_mobile/config/theme_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawang_mobile/models/PengeluaranModel.dart';
import 'package:pawang_mobile/services/PengeluaranService.dart';
import 'package:pawang_mobile/views/dashboard_screen.dart';
import 'package:pawang_mobile/views/detail_pengeluaran_screen.dart';
import 'package:pawang_mobile/views/riwayat_screen.dart';

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
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 21),
      width: 296,
      height: 106,
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(1, 2), // changes position of shadow
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
                height: 30,
                width: 30,
                decoration: BoxDecoration(
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
                        widget.data.nama_pengeluaran,
                        style:
                            kOpenSans.copyWith(fontSize: 12, fontWeight: bold),
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
                            "- Rp. ${widget.data.nominal_pengeluaran.toString()}",
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
                            widget.data.kategori_pengeluaran,
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
                            widget.data.tanggal_pengeluaran,
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
        ],
      ),
    );
  }
}
