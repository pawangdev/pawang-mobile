import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pawang_mobile/constants/strings.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/utils/currency_format.dart';

class CardPengeluaran extends StatelessWidget {
  const CardPengeluaran({Key? key, required this.data}) : super(key: key);
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: Get.width * 0.072,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: baseHOSTAPI + data.category.icon,
                    fit: BoxFit.cover,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.3,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // NAMA PENGELUARAN
                        Text(
                          data.category.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: kInter.copyWith(
                            fontWeight: semiBold,
                          ),
                        ),
                        // TANGGAL
                        Text(
                          DateFormat("dd/MM/yyyy")
                              .format(data.date.toLocal())
                              .toString(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: kInter.copyWith(
                            fontSize: 12,
                            color: defaultGray.withOpacity(0.9),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Text(
                data.type == "income"
                    ? '+ ' +
                        CurrencyFormat.convertToIdr(data.amount, 2).toString()
                    : '- ' +
                        CurrencyFormat.convertToIdr(data.amount, 2).toString(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: kInter.copyWith(
                    color:
                        data.type == "income" ? defaultSuccess : defaultError,
                    fontWeight: semiBold,
                    overflow: TextOverflow.ellipsis)),
          ],
        ),
        SizedBox(
          height: Get.height * 0.0135,
        ),
        const Divider(
          thickness: 1,
        )
      ],
    );
  }
}
