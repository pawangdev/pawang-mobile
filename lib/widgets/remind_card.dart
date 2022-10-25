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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            color: defaultWhite,
            boxShadow: [
              BoxShadow(
                color: defaultBlack.withOpacity(0.09),
                spreadRadius: 2,
                blurRadius: 10,
              )
            ],
            borderRadius: BorderRadius.circular(20)),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.wifi,
                size: 40,
                color: defaultPrimary,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Get.width * 0.3,
                    child: Text(
                      name,
                      maxLines: 1,
                      textAlign: TextAlign.end,
                      overflow: TextOverflow.ellipsis,
                      style: kOpenSans.copyWith(
                        color: defaultBlack,
                        fontWeight: semiBold,
                        fontSize: 12,
                        //0.253.dp,
                      ),
                    ),
                  ),
                  Text(
                    DateFormat("dd/MM/yyyy - HH:mm")
                        .format(DateTime.parse(data.date!).toLocal())
                        .toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: kOpenSans.copyWith(fontSize: 10),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}