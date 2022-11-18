import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/models/reminder_model.dart';

class RemindCard extends StatelessWidget {
  final ReminderDataModel data;
  final String name;
  final String icon;
  //final color;

  const RemindCard(
      {Key? key, required this.name, required this.data, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.4,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.light
              ? defaultWhite
              : const Color(0XFF39434D),
          boxShadow: [
            BoxShadow(
              color: defaultBlack.withOpacity(0.06),
              spreadRadius: 2,
              blurRadius: 10,
            )
          ],
          borderRadius: BorderRadius.circular(20)),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              icon,
              width: Get.width * 0.07,
              color: Theme.of(context).brightness == Brightness.dark
                  ? defaultWhite
                  : null,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: Get.width * 0.25,
                  child: Text(
                    name,
                    maxLines: 1,
                    textAlign: TextAlign.end,
                    overflow: TextOverflow.ellipsis,
                    style: kInter.copyWith(
                      fontWeight: semiBold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Text(
                  DateFormat("dd MMMM")
                      .format(DateTime.parse(data.date!).toLocal())
                      .toString(),
                  maxLines: 1,
                  textAlign: TextAlign.end,
                  overflow: TextOverflow.ellipsis,
                  style: kInter.copyWith(color: defaultGray),
                ),
              ],
            ),
          ]),
    );
  }
}
