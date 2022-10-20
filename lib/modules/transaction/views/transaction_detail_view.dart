import 'dart:convert';

import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pawang_mobile/constants/strings.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/models/transaction_model.dart';
import 'package:pawang_mobile/modules/transaction/transaction.dart';
import 'package:pawang_mobile/utils/currency_format.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TransactionDetailView extends StatelessWidget {
  final TransactionController controller = Get.find();
  final TransactionDataModel transaction = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 32, right: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconBack(
                    blueMode: true,
                    onTap: () {
                      Get.back();
                    },
                  ),
                  const Text(
                    "Tambah Transaksi",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16
                        //0.27.dp
                        ),
                  ),
                  SizedBox(
                    width: 32,
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                //margin: const EdgeInsets.(top: 20, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          SvgPicture.network(
                            baseHOSTAPI + transaction.category.icon,
                            fit: BoxFit.cover,
                            width: 80,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            transaction.category.name,
                            style: kOpenSans.copyWith(
                                fontSize: 20, fontWeight: semiBold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            transaction.type == "income"
                                ? '+ ' +
                                    CurrencyFormat.convertToIdr(
                                            transaction.amount, 2)
                                        .toString()
                                : '- ' +
                                    CurrencyFormat.convertToIdr(
                                            transaction.amount, 2)
                                        .toString(),
                            style: kOpenSans.copyWith(
                                fontSize: 18,
                                color: transaction.type == "income"
                                    ? defaultSuccess
                                    : defaultError),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Keterangan',
                            style: kOpenSans.copyWith(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            transaction.description! == ""
                                ? "-"
                                : transaction.description!,
                            style: kOpenSans.copyWith(
                                fontSize: 16, color: defaultPrimary),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 0.4,
                      color: defaultGray,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Tanggal Transaksi',
                            style: kOpenSans.copyWith(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            DateFormat("d MMMM yyyy")
                                .format(DateFormat("yyyy-mm-dd")
                                    .parse(transaction.date.toString()))
                                .toString(),
                            style: kOpenSans.copyWith(
                                fontSize: 16, color: defaultPrimary),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 0.4,
                      color: defaultGray,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 4),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Kategori',
                                style: kOpenSans.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                transaction.category.name,
                                style: kOpenSans.copyWith(
                                    fontSize: 16, color: defaultPrimary),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sub Kategori',
                                style: kOpenSans.copyWith(
                                  color: defaultGray,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                transaction.subcategory?.name == null
                                    ? "-"
                                    : transaction.subcategory.name,
                                style: kOpenSans.copyWith(
                                    fontSize: 12,
                                    color: defaultPrimary.withOpacity(0.6)),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 0.4,
                      color: defaultGray,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Dompet',
                            style: kOpenSans.copyWith(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            transaction.wallet.name,
                            style: kOpenSans.copyWith(
                                fontSize: 16, color: defaultPrimary),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 0.4,
                      color: defaultGray,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Jenis',
                            style: kOpenSans.copyWith(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            transaction.type == "income"
                                ? 'Pemasukan'
                                : 'Pengeluaran',
                            style: kOpenSans.copyWith(
                                fontSize: 16, color: defaultPrimary),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 0.4,
                      color: defaultGray,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(defaultBorderRadius),
                              gradient: const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [defaultPrimary, defaultPurple])),
                          child: TextButton(
                            onPressed: () =>
                                controller.formEditTransaction(transaction),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.edit,
                                  color: defaultWhite,
                                  size: 20,
                                ),
                                SizedBox(width: 3.w),
                                Text(
                                  'Ubah Data',
                                  style: kOpenSans.copyWith(
                                      fontSize: 16,
                                      fontWeight: medium,
                                      color: defaultWhite),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            showDialog<void>(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) => AlertDialog(
                                title: Text(
                                  'Hapus Pengeluaran',
                                  style: kOpenSans.copyWith(
                                      fontSize: 18, fontWeight: bold),
                                  textAlign: TextAlign.center,
                                ),
                                content: Text(
                                  'Apakah kamu yakin akan menghapus pengeluaran ini?',
                                  style: kOpenSans.copyWith(
                                      fontSize: 16, fontWeight: light),
                                  textAlign: TextAlign.center,
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                actions: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: OutlinedButton(
                                          child: Text(
                                            "Kembali",
                                            style: kOpenSans.copyWith(
                                                fontSize: 16,
                                                fontWeight: medium,
                                                color: defaultPrimary),
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context, 'Kembali');
                                          },
                                          style: OutlinedButton.styleFrom(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 4),
                                            side: const BorderSide(
                                                color: defaultPrimary),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 1.w),
                                      Expanded(
                                        child: OutlinedButton(
                                            style: OutlinedButton.styleFrom(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 4),
                                              side: const BorderSide(
                                                  color: defaultError),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                            ),
                                            child: Text(
                                              'Hapus',
                                              style: kOpenSans.copyWith(
                                                  color: defaultError,
                                                  fontWeight: medium,
                                                  fontSize: 16),
                                            ),
                                            onPressed: () =>
                                                controller.deleteTransaction(
                                                    transaction.id)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.delete_rounded,
                                color: defaultError,
                                size: 20,
                              ),
                              SizedBox(width: 3.w),
                              Text(
                                "Hapus Data",
                                style: kOpenSans.copyWith(
                                    color: defaultError,
                                    fontSize: 16,
                                    fontWeight: medium),
                              ),
                            ],
                          ),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.all(13),
                            side: const BorderSide(color: defaultError),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(defaultBorderRadius),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
