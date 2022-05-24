import 'package:flutter/material.dart';
import 'package:pawang_mobile/config/theme_constants.dart';

class SaldoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Saldo',
              style: kOpenSans.copyWith(
                color: kBlack,
                fontWeight: medium,
                fontSize: 16,
              ),
            ),
            Text(
              'Rp. XXXXXXXX',
              style: kOpenSans.copyWith(
                color: kBlack,
                fontWeight: bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 0.5,
              blurRadius: 0.5,
              offset: const Offset(1, 3), // changes position of shadow
            ),
          ],
        ),
      ),
    );
  }
}
