import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';

class TransactionDetailView extends StatelessWidget {
  const TransactionDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 0,
                      child: IconBack(
                        blueMode: true,
                        onTap: () => Get.back(),
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: Column(
                        children: [
                          Text(
                            "Detail Transaction",
                            style: kOpenSans.copyWith(fontWeight: semiBold),
                          ),
                          Text(
                            "Des 15, 2000 01:32",
                            style: kOpenSans.copyWith(fontWeight: light),
                          ),
                        ],
                      ),
                    ),
                    const Expanded(child: const SizedBox()),
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                Container(
                  height: Get.mediaQuery.size.height * 0.55,
                  width: Get.width,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Positioned(
                        top: 25,
                        child: Container(
                          height: Get.mediaQuery.size.height * 0.5,
                          width: Get.width,
                          padding: const EdgeInsets.symmetric(
                              vertical: 30, horizontal: 32),
                          decoration: BoxDecoration(
                            color: defaultWhite,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(defaultBorderRadius),
                                topRight: Radius.circular(defaultBorderRadius),
                                bottomLeft:
                                    Radius.circular(defaultBorderRadius),
                                bottomRight:
                                    Radius.circular(defaultBorderRadius)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: const Offset(
                                    0, 0), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("- 12.000 IDR",
                                      style: kOpenSans.copyWith(
                                          fontSize: 24, fontWeight: semiBold),
                                      textAlign: TextAlign.center),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Paket Data",
                                    style:
                                        kOpenSans.copyWith(fontWeight: light),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.yellow.shade400,
                            borderRadius: BorderRadius.circular(100)),
                        child: const Icon(TablerIcons.access_point),
                      ),
                    ],
                  ),
                ),
                const Text("OK")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
