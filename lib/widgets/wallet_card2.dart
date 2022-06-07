import 'package:flutter/material.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WalletCard2 extends StatelessWidget {
  final String name;
  final String balance;

  const WalletCard2({Key? key, required this.name, required this.balance})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            //snapshot.data!.data[index].name,
            style: kOpenSans.copyWith(
              color: kPrimary,
              fontWeight: semibold,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 1.4.h,
          ),
          Text(
            'Rp. ' + balance.toString(),
            //${snapshot.data!.data[index].balance}',
            style: kOpenSans.copyWith(
              color: kBlack,
              fontWeight: medium,
              fontSize: 15,
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: kWhite,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: kBlack.withOpacity(0.07),
              spreadRadius: 2,
              blurRadius: 10,
            )
          ]),
    );
  }
}
