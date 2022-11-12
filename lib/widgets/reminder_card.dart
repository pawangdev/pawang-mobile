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
  final Function(bool)? onToogle;
  const ReminderCard(
      {Key? key,
      required this.item,
      required this.index,
      required this.onDelete,
      required this.onUpdate,
      this.onToogle})
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
                color: Theme.of(context).brightness == Brightness.light
                    ? defaultWhite
                    : Color(0XFF1B2430),
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
                Row(
                  children: [
                    Image.asset(
                      'assets/images/bell.png',
                      width: Get.width * 0.06,
                    ),
                    SizedBox(width: Get.width * 0.04),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            item.name!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: kInter.copyWith(
                                fontWeight: semiBold, fontSize: 16),
                          ),
                        ),
                        SizedBox(width: Get.width * 0.05),
                        Text(
                          DateFormat("dd MMMM yyyy - HH:mm")
                              .format(DateTime.parse(item.date!).toLocal())
                              .toString(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: kInter.copyWith(color: defaultGray),
                        ),
                      ],
                    ),
                  ],
                ),
                Switch(
                  value: item.isActive!,
                  onChanged: onToogle,
                  activeColor: defaultPrimary,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
