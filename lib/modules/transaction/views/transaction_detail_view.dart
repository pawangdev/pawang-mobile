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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: Get.height * 0.11,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [defaultPrimary, defaultPurple])),
              ),
              Container(
                padding:
                    EdgeInsets.only(top: Get.statusBarHeight * 0.6, left: 32),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 0,
                      child: IconBack(
                        blueMode: false,
                        onTap: () => Get.delete<TransactionController>()
                            .then((value) => Get.back()),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Detail Riwayat",
                          style: kOpenSans.copyWith(
                              fontSize: 16,
                              fontWeight: bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          Container(
            //margin: const EdgeInsets.(top: 20, bottom: 20),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      SvgPicture.network(
                        baseHOSTAPI + transaction.category.icon,
                        fit: BoxFit.cover,
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
                        CurrencyFormat.convertToIdr(transaction.amount, 2)
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.article,
                      size: 25,
                    ),
                    Text(
                      transaction.description! == ""
                          ? "-"
                          : transaction.description!,
                      style: kOpenSans.copyWith(
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.calendar_month,
                      size: 25,
                    ),
                    Text(
                      DateFormat("d MMMM yyyy - HH:mm")
                          .format(DateFormat("yyyy-mm-dd HH:mm")
                              .parse(transaction.date.toString()))
                          .toString(),
                      style: kOpenSans.copyWith(
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.credit_card,
                      size: 25,
                    ),
                    Text(
                      transaction.wallet.name,
                      style: kOpenSans.copyWith(
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              margin: const EdgeInsets.only(bottom: 24),
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
                                          padding: const EdgeInsets.symmetric(
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
                                        onPressed: () => controller
                                            .deleteTransaction(transaction.id)),
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
    );
  }
}
