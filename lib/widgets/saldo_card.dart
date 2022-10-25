import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/constants/theme.dart';

class WalletCard extends StatelessWidget {
  final String name;
  final String namaWallet;
  final String balance;
  //final color;

  const WalletCard(
      {Key? key,
      required this.namaWallet,
      required this.balance,
      required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(25.0),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: defaultBlack.withOpacity(0.05),
              spreadRadius: 2,
              blurRadius: 10,
            )
          ],
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                defaultWhite.withOpacity(0.5),
                defaultWhite.withOpacity(0.3),
                defaultWhite.withOpacity(0.5)
              ]),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: Get.width * 0.5,
                  child: Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: kOpenSans.copyWith(
                      color: defaultWhite.withOpacity(0.8),
                      fontWeight: medium,
                      fontSize: 12,
                      //0.253.dp,
                    ),
                  ),
                ),
                Image.asset(
                  'assets/images/pawang_wallet.png',
                  width: Get.width * 0.06,
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(namaWallet,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: kOpenSans.copyWith(
                        color: defaultWhite.withOpacity(0.8),
                        fontWeight: semiBold,
                        fontSize: 14)),
                Text(
                  balance.toString(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: kOpenSans.copyWith(
                      color: defaultWhite.withOpacity(0.9),
                      fontWeight: bold,
                      fontSize: 19 //0.26.dp,
                      ),
                ),
              ],
            ),
          ]),
    );
  }
}
