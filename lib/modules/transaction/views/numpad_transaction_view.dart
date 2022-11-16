import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/modules/transaction/transaction.dart';
import 'package:pawang_mobile/utils/currency_format.dart';
import 'package:pawang_mobile/widgets/button_custom.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';
import 'package:pawang_mobile/widgets/numpad.dart';

class NumpadTransactionView extends StatelessWidget {
  final TransactionController controller = Get.find<TransactionController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                'Apakah anda ingin membuang perubahan ini?'.tr,
                style: kInter.copyWith(fontSize: 16, fontWeight: semiBold),
                textAlign: TextAlign.center,
              ),
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                Row(
                  children: [
                    Expanded(
                      child: ButtonCustom(
                        elevatedMode: false,
                        onTap: () {
                          Navigator.pop(context, false);
                        },
                        text: 'Tidak'.tr,
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.01,
                    ),
                    Expanded(
                      child: ButtonCustom(
                        elevatedMode: false,
                        onTap: () {
                          Navigator.pop(context, true);
                          controller.clearInput();
                          Get.back();
                        },
                        text: 'Ya'.tr,
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        );
        return shouldPop!;
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconBack(
                    blueMode: true,
                    onTap: () {
                      showDialog<bool>(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              'Apakah anda ingin membuang perubahan ini?'.tr,
                              style: kInter.copyWith(
                                  fontSize: 16, fontWeight: semiBold),
                              textAlign: TextAlign.center,
                            ),
                            actionsAlignment: MainAxisAlignment.center,
                            actions: [
                              Row(
                                children: [
                                  Expanded(
                                    child: ButtonCustom(
                                      elevatedMode: false,
                                      onTap: () {
                                        Navigator.pop(context, false);
                                      },
                                      text: 'Tidak'.tr,
                                    ),
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.01,
                                  ),
                                  Expanded(
                                    child: ButtonCustom(
                                      elevatedMode: false,
                                      onTap: () {
                                        Navigator.pop(context, true);
                                        controller.clearInput();
                                        Get.back();
                                      },
                                      text: 'Ya'.tr,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                  Text(
                    "Masukkan Nominal".tr,
                    style: kInter.copyWith(fontSize: 16, fontWeight: semiBold),
                  ),
                  const SizedBox(
                    width: 32,
                  ),
                ],
              ),
              Expanded(
                child: Center(
                  child: Obx(
                    () => Text(
                      CurrencyFormat.convertToIdr(
                          int.parse(controller.amountTextController.value), 2),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: kInter.copyWith(fontSize: 24, fontWeight: bold),
                    ),
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
              NumpadWidget(),
              SizedBox(
                height: Get.height * 0.05,
              ),
              ButtonCustom(
                text: 'Simpan'.tr,
                elevatedMode: false,
                onTap: () {
                  controller.displayAmount.text = CurrencyFormat.convertToIdr(
                      int.parse(controller.amountTextController.value), 2);

                  Get.back();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
