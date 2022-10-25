import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/models/reminder_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ReminderCard extends StatelessWidget {
  final ReminderDataModel item;
  final int index;
  final Function(BuildContext)? onDelete;
  final Function(BuildContext)? onUpdate;
  const ReminderCard(
      {Key? key,
      required this.item,
      required this.index,
      required this.onDelete,
      required this.onUpdate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Slidable(
          key: ValueKey(index),
          startActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: onDelete,
                backgroundColor: defaultError,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Hapus',
              ),
              SlidableAction(
                onPressed: onUpdate,
                backgroundColor: defaultWarning,
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'Edit',
              ),
            ],
          ),
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
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.wifi),
                      SizedBox(width: Get.width * 0.05),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name!,
                            style: kOpenSans.copyWith(
                                fontWeight: semiBold, fontSize: 16),
                          ),
                          SizedBox(width: Get.width * 0.05),
                          Text(
                            DateFormat("dd/MM/yyyy - HH:mm")
                                .format(DateTime.parse(item.date!).toLocal())
                                .toString(),
                            style: kOpenSans.copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
