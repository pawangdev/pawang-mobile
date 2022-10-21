import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/modules/dashboard/dashboard.dart';
import 'package:pawang_mobile/modules/transaction/controllers/transaction_controller.dart';
import 'package:pawang_mobile/modules/transaction/views/add_outcome_view.dart';
import 'package:pawang_mobile/modules/transaction/views/add_transaction.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';

import 'add_income_view.dart';

class TabBarScreen extends StatelessWidget {
  final TransactionController controller = Get.find<TransactionController>();

  final DashboardController dashboardController =
      Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 32, right: 32),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconBack(
                        blueMode: true,
                        onTap: () {
                          Get.back();
                        },
                      ),
                      const Text(
                        "Tambah Transaksi",
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 14
                                //0.27.dp
                                ),
                      ),
                      SizedBox(
                        width: 32,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 60,
                      width: 250,
                      decoration: BoxDecoration(
                          color: defaultPrimary,
                          borderRadius: BorderRadius.circular(15)),
                      child: Expanded(
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: GetBuilder<TransactionController>(
                                init: TransactionController(),
                                builder: (_) {
                                  return TabBar(
                                      labelStyle: kOpenSans.copyWith(
                                        fontSize: 12,
                                        fontWeight: semiBold,
                                      ),
                                      unselectedLabelStyle: kOpenSans.copyWith(
                                        fontSize: 12,
                                        fontWeight: semiBold,
                                      ),
                                      unselectedLabelColor: Colors.white,
                                      labelColor: Colors.black,
                                      indicatorColor:
                                          Colors.white.withOpacity(1.0),
                                      indicatorWeight: 1,
                                      indicator: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      controller: controller.tabController,
                                      tabs: controller.myTabs);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: controller.tabController,
                  children: [
                    AddTransaction(),
                    AddTransaction(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
