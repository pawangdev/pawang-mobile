import 'package:flutter/material.dart';
import 'package:pawang_mobile/config/theme_constants.dart';

class WalletCard extends StatelessWidget {
  final String name;
  final double balance;
  final color;

  const WalletCard(
      {Key? key, required this.name, required this.balance, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: EdgeInsets.all(25.0),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          name,
          style: kOpenSans.copyWith(
            color: kBlack,
            fontWeight: medium,
            fontSize: 16,
          ),
        ),
        Text(
          'Rp. ' + balance.toString(),
          style: kOpenSans.copyWith(
            color: kBlack,
            fontWeight: bold,
            fontSize: 18,
          ),
        ),
      ]),
    );
  }
}
