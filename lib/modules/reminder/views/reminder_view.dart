import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/modules/reminder/controllers/reminder_controller.dart';
import 'package:pawang_mobile/routes/routes.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';
import 'package:pawang_mobile/widgets/reminder_card.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';

class ReminderView extends StatelessWidget {
  final ReminderController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 15.h,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [defaultPrimary, defaultPurple])),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: Get.statusBarHeight * 0.9, left: 32, right: 32),
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
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(RoutesName.addreminder),
        child: const Icon(TablerIcons.plus),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
