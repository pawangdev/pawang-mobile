import 'package:flutter/material.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WalletCard extends StatelessWidget {
  final String name;
  final String balance;
  //final color;

  const WalletCard({Key? key, required this.name, required this.balance})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(25.0),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                kWhite.withOpacity(0.5),
                kWhite.withOpacity(0.3),
                kWhite.withOpacity(0.5)
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
                Text(
                  "Mua'dz Fathulloh",
                  style: kOpenSans.copyWith(
                    color: kWhite.withOpacity(0.65),
                    fontWeight: medium,
                    fontSize: 12,
                    //0.253.dp,
                  ),
                ),
                Image.asset(
                  'assets/images/pawang_wallet.png',
                  width: 6.w,
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: kOpenSans.copyWith(
                        color: kWhite.withOpacity(0.75),
                        fontWeight: semibold,
                        fontSize: 14)),
                Text(
                  'Rp. ' + balance.toString() + ',-',
                  style: kOpenSans.copyWith(
                      color: kWhite.withOpacity(0.9),
                      fontWeight: bold,
                      fontSize: 16 //0.26.dp,
                      ),
                ),
              ],
            ),
          ]),
    );
  }
}
