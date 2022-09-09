import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/views/reminder_controller.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';
import 'package:pawang_mobile/widgets/reminder_card.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';

class ReminderView extends StatelessWidget {
  ReminderController controller = Get.put(ReminderController());
  // final ReminderController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Stack(
        children: [
          Container(
            height: 15.h,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [defaultPrimary, defaultPurple])),
          ),
          Container(
            padding: const EdgeInsets.only(top: 28, left: 32, right: 32),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconBack(
                  blueMode: false,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Column(
                  children: [
                    SvgPicture.asset(
                      'assets/images/reminder.svg',
                      color: defaultWhite,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      'Pengingat',
                      style: kOpenSans.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                          color: defaultWhite),
                    ),
                  ],
                ),
                Container(
                  width: 7.2.w,
                ),
              ],
            ),
          ),
        ],
      ),
      SizedBox(
        height: 2.h,
      ),
      ReminderCard(),
      // Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 30),
      //   child: Container(
      //     padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      //     decoration: BoxDecoration(
      //         color: Colors.white,
      //         borderRadius: BorderRadius.circular(8),
      //         boxShadow: [
      //           BoxShadow(
      //             color: defaultBlack.withOpacity(0.07),
      //             spreadRadius: 2,
      //             blurRadius: 10,
      //           )
      //         ]),
      //     child: Row(
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         SizedBox(
      //           width: 40.w,
      //           child: Padding(
      //             padding: const EdgeInsets.only(left: 8.0),
      //             child: Row(
      //               // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 Icon(Icons.wifi),
      //                 SizedBox(width: 5.w),
      //                 Column(
      //                   children: [
      //                     Text('Bayar Wifi'),
      //                     Text('24 Agustus'),
      //                   ],
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //         Expanded(
      //             child: Align(
      //                 alignment: Alignment.centerRight,
      //                 child: Switch(value: true, onChanged: (bool value) {}))),
      //       ],
      //     ),
      //   ),
      // )
    ]));
  }
}
