import 'package:flutter/material.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WalletCard extends StatelessWidget {
  final String name;
  final String balance;
  final color;

  const WalletCard(
      {Key? key, required this.name, required this.balance, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(25.0),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          name,
          style: kOpenSans.copyWith(
            color: kBlack,
            fontWeight: medium,
            fontSize: 0.253.dp,
          ),
        ),
        Text(
          'Rp. ' + balance.toString(),
          style: kOpenSans.copyWith(
            color: kBlack,
            fontWeight: bold,
            fontSize: 0.26.dp,
          ),
        ),
      ]),
    );
  }
}
