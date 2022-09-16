import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/modules/dashboard/dashboard.dart';
import 'package:pawang_mobile/modules/navigation/controllers/navigation_controller.dart';
import 'package:pawang_mobile/modules/scan_receipe/scan_receipe.dart';
import 'package:pawang_mobile/modules/settings/settings.dart';
import 'package:pawang_mobile/widgets/icon_bottom.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
            children: [DashboardView(), ScanReceipeView(), SettingsView()],
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: SizedBox(
          height: 8.h,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 42),
            child: GetBuilder<NavigationController>(
              init: NavigationController(),
              builder: (controller) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconBottomBar(
                        text: "Beranda",
                        iconEnable: "assets/images/home1.png",
                        iconDisable: "assets/images/home2.png",
                        selected: controller.tabIndex == 0 ? true : false,
                        onPressed: () {
                          controller.changeTabIndex(0);
                        }),
                    IconBottomBar(
                        text: "Scan Struk",
                        iconEnable: "assets/images/scan1.png",
                        iconDisable: "assets/images/scan2.png",
                        selected: controller.tabIndex == 1 ? true : false,
                        onPressed: () {
                          controller.changeTabIndex(1);
                        }),
                    IconBottomBar(
                      text: "Pengaturan",
                      iconEnable: "assets/images/setting1.png",
                      iconDisable: "assets/images/setting2.png",
                      selected: controller.tabIndex == 2 ? true : false,
                      onPressed: () {
                        controller.changeTabIndex(2);
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
