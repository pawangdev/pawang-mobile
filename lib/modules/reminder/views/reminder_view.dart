import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/modules/dashboard/dashboard.dart';
import 'package:pawang_mobile/modules/reminder/controllers/reminder_controller.dart';
import 'package:pawang_mobile/routes/routes.dart';
import 'package:pawang_mobile/widgets/reminder_card.dart';
import 'package:get/get.dart';

class ReminderView extends StatelessWidget {
  final ReminderController controller = Get.find();
  final DashboardController dashboardController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset('assets/images/background.png'),
              // Container(
              //   height: Get.height * 0.18,
              //   decoration: const BoxDecoration(
              //       gradient: LinearGradient(
              //           begin: Alignment.centerLeft,
              //           end: Alignment.centerRight,
              //           colors: [defaultPrimary, defaultPurple])),
              // ),
              Container(
                padding: EdgeInsets.only(
                    top: Get.height * 0.07, left: 32, right: 32),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: Get.width * 0.025,
                    ),
                    Column(
                      children: [
                        SvgPicture.asset(
                          'assets/images/reminder.svg',
                          color: defaultWhite,
                        ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        Text(
                          'Pengingat',
                          style: kInter.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                              color: defaultWhite),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(RoutesName.addreminder);
                      },
                      child: const Icon(
                        Icons.add_rounded,
                        color: defaultWhite,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Obx(
              () => dashboardController.reminders.isEmpty
                  ? Center(
                      child: Text(
                        "Pengingat Masih Kosong",
                        style: textMuted.copyWith(
                            fontSize: 18, fontWeight: semiBold),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final reminder = dashboardController.reminders[index];
                        return ReminderCard(
                          item: reminder,
                          index: index,
                          onDelete: (context) =>
                              controller.deleteReminder(reminder.id),
                          onUpdate: (context) {
                            controller.nameTextController.text = reminder.name!;
                            controller.dateTextController.text = reminder.date!;
                            Get.toNamed(RoutesName.addreminder, arguments: {
                              "is_adding": true,
                              "id": reminder.id
                            });
                          },
                        );
                      },
                      itemCount: dashboardController.reminders.length,
                    ),
            ),
          )
        ],
      ),
    );
  }
}
