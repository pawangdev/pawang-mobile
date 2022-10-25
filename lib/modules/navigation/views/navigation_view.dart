import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/modules/dashboard/dashboard.dart';
import 'package:pawang_mobile/modules/navigation/controllers/navigation_controller.dart';
import 'package:pawang_mobile/modules/reminder/reminder.dart';
import 'package:pawang_mobile/modules/scan_receipe/scan_receipe.dart';
import 'package:pawang_mobile/modules/settings/settings.dart';
import 'package:pawang_mobile/modules/transaction/transaction.dart';
import 'package:pawang_mobile/widgets/icon_bottom.dart';

class NavigationView extends StatelessWidget {
  final NavigationController controller = Get.find<NavigationController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<NavigationController>(
        init: NavigationController(),
        builder: (c) {
          return IndexedStack(
            index: controller.tabIndex,
            children: [
              DashboardView(),
              TransactionHistoryView(),
              ScanReceipeView(),
              ReminderView(),
              SettingsView()
            ],
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 3,
        color: Colors.white,
        child: SizedBox(
          height: Get.height * 0.08,
          width: Get.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: GetBuilder<NavigationController>(
              init: NavigationController(),
              builder: (controller) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconBottomBar(
                          text: "Beranda",
                          iconEnable: "assets/images/home1.png",
                          iconDisable: "assets/images/home2.png",
                          selected: controller.tabIndex == 0 ? true : false,
                          onPressed: () {
                            controller.changeTabIndex(0);
                          },
                        ),
                        IconBottomBar(
                          text: "Transaksi",
                          iconEnable: "assets/images/transaksi1.png",
                          iconDisable: "assets/images/transaksi2.png",
                          selected: controller.tabIndex == 1 ? true : false,
                          onPressed: () {
                            controller.changeTabIndex(1);
                          },
                        ),
                      ],
                    ),
                    SizedBox(),
                    Row(
                      children: [
                        IconBottomBar(
                          text: "Pengingat",
                          iconEnable: "assets/images/remin1.png",
                          iconDisable: "assets/images/remin2.png",
                          selected: controller.tabIndex == 3 ? true : false,
                          onPressed: () {
                            controller.changeTabIndex(3);
                          },
                        ),
                        IconBottomBar(
                          text: "Pengaturan",
                          iconEnable: "assets/images/setting1.png",
                          iconDisable: "assets/images/setting2.png",
                          selected: controller.tabIndex == 4 ? true : false,
                          onPressed: () {
                            controller.changeTabIndex(4);
                          },
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
      floatingActionButton: GetBuilder<NavigationController>(
        init: NavigationController(),
        builder: (controller) {
          return FloatingActionButton(
            child: Container(
              height: 60,
              width: 60,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  'assets/images/scan3.png',
                ),
              ),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: defaultPurple.withOpacity(0.4),
                      spreadRadius: 2,
                      blurRadius: 10,
                    )
                  ],
                  gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [defaultPrimary, defaultPurple])),
            ),
            onPressed: () {
              controller.changeTabIndex(2);
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
