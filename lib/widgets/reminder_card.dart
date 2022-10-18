import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ReminderCard extends StatelessWidget {
  const ReminderCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: defaultBlack.withOpacity(0.07),
                spreadRadius: 2,
                blurRadius: 10,
              )
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 40.w,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.wifi),
                    SizedBox(width: 5.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bayar Wifi',
                          style: kOpenSans.copyWith(
                              fontWeight: semiBold, fontSize: 16),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '24 Agustus',
                          style: kOpenSans.copyWith(fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Switch(value: true, onChanged: (bool value) {}))),
          ],
        ),
      ),
    );
  }
}
