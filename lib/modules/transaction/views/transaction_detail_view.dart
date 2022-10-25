import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pawang_mobile/constants/strings.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/models/transaction_model.dart';
import 'package:pawang_mobile/modules/transaction/transaction.dart';
import 'package:pawang_mobile/utils/currency_format.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';

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
              Container(
                //margin: const EdgeInsets.(top: 20, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          CachedNetworkImage(
                            imageUrl: baseHOSTAPI + transaction.category.icon,
                            fit: BoxFit.cover,
                            width: 80,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircularProgressIndicator(
                                  value: downloadProgress.progress),
                            ),
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
                            style: kOpenSans.copyWith(
                                fontSize: 20, fontWeight: semiBold),
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
                          SizedBox(
                            width: Get.width * 0.35,
                            child: Text(
                              transaction.description ?? "-",
                              textAlign: TextAlign.end,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: kOpenSans.copyWith(
                                  fontSize: 16, color: defaultPrimary),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Divider(
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
                              style: kOpenSans.copyWith(
                                  fontSize: 16, color: defaultPrimary),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Divider(
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
                              SizedBox(
                                width: Get.width * 0.35,
                                child: Text(
                                  transaction.category.name,
                                  textAlign: TextAlign.end,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: kOpenSans.copyWith(
                                      fontSize: 16, color: defaultPrimary),
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
                                style: kOpenSans.copyWith(
                                  color: defaultGray,
                                  fontSize: 12,
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
                                  style: kOpenSans.copyWith(
                                      fontSize: 12,
                                      color: defaultPrimary.withOpacity(0.6)),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(
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
                          SizedBox(
                            width: Get.width * 0.35,
                            child: Text(
                              transaction.wallet.name,
                              textAlign: TextAlign.end,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: kOpenSans.copyWith(
                                  fontSize: 16, color: defaultPrimary),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Divider(
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
                          SizedBox(
                            width: Get.width * 0.35,
                            child: Text(
                              transaction.type == "income"
                                  ? 'Pemasukan'
                                  : 'Pengeluaran',
                              textAlign: TextAlign.end,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: kOpenSans.copyWith(
                                  fontSize: 16, color: defaultPrimary),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 0.4,
                      color: defaultGray,
                    ),
                  ],
                ),
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
                                SizedBox(width: Get.width * 0.03),
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
                        width: Get.width * 0.01,
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
                                      SizedBox(width: Get.width * 0.01),
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
                              SizedBox(width: Get.width * 0.03),
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
