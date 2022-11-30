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
    return Scaffold(
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
                      Get.back();
                    }),
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
    );
  }
}
