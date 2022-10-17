import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/modules/dashboard/dashboard.dart';
import 'package:pawang_mobile/modules/wallet/wallet.dart';
import 'package:pawang_mobile/routes/routes.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';
import 'package:pawang_mobile/widgets/wallet_card2.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';

class WalletView extends StatelessWidget {
  final WalletController controller = Get.find();
  final DashboardController dashboardController = Get.find();

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
                padding: EdgeInsets.only(
                    top: Get.statusBarHeight * 0.6, left: 32, right: 32),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconBack(
                      blueMode: false,
                      onTap: () {
                        Get.toNamed(RoutesName.navigation);
                      },
                    ),
                    Column(
                      children: [
                        SvgPicture.asset(
                          'assets/images/wallet.svg',
                          color: defaultWhite,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          'Dompet',
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
            height: 0.5.h,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Obx(
                () => ListView.builder(
                  itemCount: dashboardController.wallets.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    var wallet = dashboardController.wallets[index];
                    return WalletCard2(
                      wallet: wallet,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(RoutesName.addwallet);
        },
        tooltip: 'Tambah Dompet',
        splashColor: defaultPrimary,
        child: Container(
          height: 60,
          width: 60,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [defaultPrimary, defaultPurple])),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
