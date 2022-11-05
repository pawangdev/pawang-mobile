import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/constants/theme.dart';

class WalletCard extends StatelessWidget {
  final String income;
  final String outcome;
  final String namaWallet;
  final String balance;
  //final color;

  const WalletCard({
    Key? key,
    required this.namaWallet,
    required this.balance,
    required this.income,
    required this.outcome,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          color: defaultPrimary,
          boxShadow: [
            BoxShadow(
                color: defaultBlack.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 2)
          ],
          gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [defaultPrimary, defaultPurple]),
          // LinearGradient(
          //     begin: Alignment.topLeft,
          //     end: Alignment.bottomRight,
          //     colors: [
          //       defaultWhite.withOpacity(0.5),
          //       defaultWhite.withOpacity(0.3),
          //       defaultWhite.withOpacity(0.5)
          //     ]),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width * 0.375,
                      child: Text(
                        namaWallet,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: kInter.copyWith(
                          color: defaultWhite.withOpacity(0.8),
                          fontWeight: medium,
                        ),
                      ),
                    ),
                    Text(
                      balance.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: kInter.copyWith(
                          color: defaultWhite.withOpacity(0.8),
                          fontWeight: bold,
                          fontSize: 18),
                    ),
                  ],
                ),
                Image.asset(
                  'assets/images/pawang_wallet.png',
                  width: Get.width * 0.07,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(50)),
                                color: defaultWhite.withOpacity(0.5)),
                            child: const Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Icon(
                                Icons.arrow_downward_rounded,
                                size: 15,
                                color: defaultWhite,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text('Pemasukan',
                              style: kInter.copyWith(
                                  fontWeight: semiBold,
                                  color: defaultWhite.withOpacity(0.8))),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: Get.width * 0.34,
                        child: Text(
                          income,
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          style: kInter.copyWith(
                              fontWeight: bold,
                              color: defaultWhite.withOpacity(0.8)),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50)),
                              color: defaultWhite.withOpacity(0.5)),
                          child: const Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Icon(
                              Icons.arrow_upward_rounded,
                              size: 15,
                              color: defaultWhite,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text('Pengeluaran',
                            style: kInter.copyWith(
                                fontWeight: semiBold,
                                color: defaultWhite.withOpacity(0.8))),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: Get.width * 0.34,
                      child: Text(
                        outcome,
                        maxLines: 1,
                        textAlign: TextAlign.end,
                        overflow: TextOverflow.ellipsis,
                        style: kInter.copyWith(
                            fontWeight: bold,
                            color: defaultWhite.withOpacity(0.8)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Text(namaWallet,
            //         maxLines: 1,
            //         overflow: TextOverflow.ellipsis,
            //         style: kInter.copyWith(
            //             color: defaultWhite.withOpacity(0.8),
            //             fontWeight: medium,
            //             fontSize: 14)),
            //   ],
            // ),
          ]),
    );
  }
}
