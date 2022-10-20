import 'package:flutter/material.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:get/get.dart';

class TransactionHistoryView extends StatelessWidget {
  const TransactionHistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: def,
      body: ListView(children: [
        Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 200,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [defaultPrimary, defaultPurple])),
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Transaksi',
                          style: kOpenSans.copyWith(
                              fontSize: 14,
                              fontWeight: bold,
                              color: defaultWhite),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Sisa Uang Kamu',
                                  style: kOpenSans.copyWith(
                                      fontSize: 10,
                                      fontWeight: medium,
                                      color: defaultWhite),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Rp. 1.500.000',
                                  style: kOpenSans.copyWith(
                                      fontSize: 24,
                                      fontWeight: bold,
                                      color: defaultWhite),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  color: defaultWhite,
                ),
              ],
            ),
            Positioned(
              top: 169,
              left: 50,
              child: Container(
                height: 60,
                width: 290,
                decoration: BoxDecoration(
                  color: defaultWhite,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: defaultBlack.withOpacity(0.12),
                      spreadRadius: 2,
                      blurRadius: 10,
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_downward_rounded,
                              size: 13,
                              color: defaultSuccess,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text('Pemasukan',
                                style: kOpenSans.copyWith(
                                    fontSize: 10,
                                    fontWeight: semiBold,
                                    color: defaultBlack)),
                          ],
                        ),
                        Text('Rp. 2.000.000',
                            style: kOpenSans.copyWith(
                                fontSize: 12,
                                fontWeight: bold,
                                color: defaultSuccess))
                      ],
                    ),
                    Container(
                      width: 1,
                      height: 30,
                      color: defaultGray,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_upward_rounded,
                              size: 13,
                              color: defaultError,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text('Pengeluaran',
                                style: kOpenSans.copyWith(
                                    fontSize: 10,
                                    fontWeight: semiBold,
                                    color: defaultBlack)),
                          ],
                        ),
                        Text('Rp. 500.000',
                            style: kOpenSans.copyWith(
                                fontSize: 12,
                                fontWeight: bold,
                                color: defaultError))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text('Riwayat Transaksi',
                style: kOpenSans.copyWith(
                    fontSize: 14, fontWeight: bold, color: defaultGray))
          ],
        )
      ]),
    );
  }
}
