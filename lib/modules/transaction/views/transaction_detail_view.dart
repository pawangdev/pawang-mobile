// ignore_for_file: use_key_in_widget_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pawang_mobile/constants/strings.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/modules/transaction/transaction.dart';
import 'package:pawang_mobile/utils/currency_format.dart';
import 'package:pawang_mobile/widgets/button_custom.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';

class TransactionDetailView extends StatelessWidget {
  final TransactionController controller = Get.find();
  final dynamic transaction = Get.arguments;

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
                    "Detail Transaksi",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(
                    width: 32,
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.05,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: FittedBox(
                      fit: BoxFit.fitHeight,
                      child: Column(
                        children: [
                          CachedNetworkImage(
                            imageUrl: baseHOSTAPI + transaction.category.icon,
                            fit: BoxFit.cover,
                            width: 60,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                    CircularProgressIndicator(
                                        value: downloadProgress.progress),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                          SizedBox(
                            height: Get.height * 0.012,
                          ),
                          Text(
                            transaction.category.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: kInter.copyWith(
                                fontSize: 18, fontWeight: semiBold),
                          ),
                          SizedBox(
                            height: Get.height * 0.012,
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
                            style: kInter.copyWith(
                                fontSize: 16,
                                color: transaction.type == "income"
                                    ? defaultSuccess
                                    : defaultError),
                          ),
                        ],
                      ),
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
                          style: kInter.copyWith(
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.35,
                          child: Text(
                            transaction.description ?? "-",
                            textAlign: TextAlign.end,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: kInter.copyWith(
                                fontSize: 14, color: defaultPrimary),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 0.9,
                    color: defaultGray,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tanggal Transaksi',
                          style: kInter.copyWith(
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.35,
                          child: Text(
                            DateFormat("d MMMM yyyy")
                                .format(DateFormat("yyyy-mm-dd")
                                    .parse(transaction.date.toString()))
                                .toString(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            textAlign: TextAlign.end,
                            style: kInter.copyWith(
                                fontSize: 14, color: defaultPrimary),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 0.9,
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
                              style: kInter.copyWith(
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.35,
                              child: Text(
                                transaction.category.name,
                                textAlign: TextAlign.end,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: kInter.copyWith(
                                    fontSize: 14, color: defaultPrimary),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Sub Kategori',
                              style: kInter.copyWith(
                                color: defaultGray,
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.35,
                              child: Text(
                                transaction.subcategory == null
                                    ? "-"
                                    : transaction.subcategory!.name,
                                maxLines: 1,
                                textAlign: TextAlign.end,
                                overflow: TextOverflow.ellipsis,
                                style: kInter.copyWith(
                                    color: defaultPrimary.withOpacity(0.6)),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 0.9,
                    color: defaultGray,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Dompet',
                          style: kInter.copyWith(
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.35,
                          child: Text(
                            transaction.wallet.name,
                            textAlign: TextAlign.end,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: kInter.copyWith(
                                fontSize: 14, color: defaultPrimary),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 0.9,
                    color: defaultGray,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Jenis',
                          style: kInter.copyWith(
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.35,
                          child: Text(
                            transaction.type == "income"
                                ? 'Pemasukan'
                                : 'Pengeluaran',
                            textAlign: TextAlign.end,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: kInter.copyWith(
                                fontSize: 14, color: defaultPrimary),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 0.9,
                    color: defaultGray,
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.04,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ButtonCustom(
                          text: 'Edit Data',
                          onTap: () =>
                              controller.formEditTransaction(transaction),
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.01,
                      ),
                      Expanded(
                        child: ButtonCustom(
                          text: 'Hapus Data',
                          elevatedMode: false,
                          blueMode: false,
                          onTap: () {
                            showDialog<void>(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) => AlertDialog(
                                title: Text(
                                  'Hapus Pengeluaran',
                                  style: kInter.copyWith(
                                      fontSize: 18, fontWeight: bold),
                                  textAlign: TextAlign.center,
                                ),
                                content: Text(
                                  'Apakah kamu yakin akan menghapus pengeluaran ini?',
                                  style: kInter.copyWith(
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
                                        child: ButtonCustom(
                                          text: 'Kembali',
                                          elevatedMode: false,
                                          onTap: () {
                                            Navigator.pop(context, 'Kembali');
                                          },
                                        ),
                                      ),
                                      SizedBox(width: Get.width * 0.01),
                                      Expanded(
                                        child: ButtonCustom(
                                          text: 'Hapus',
                                          elevatedMode: false,
                                          blueMode: false,
                                          onTap: () =>
                                              controller.deleteTransaction(
                                                  transaction.id),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
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
