import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/modules/transaction/transaction.dart';
import 'package:pawang_mobile/utils/currency_format.dart';
import 'package:pawang_mobile/widgets/numpad.dart';

class NumpadTransactionView extends StatelessWidget {
  final TransactionController controller = Get.find<TransactionController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xF9F9F9F9),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Center(
                  child: Text(
                "Masukkan Nominal",
                style: textMuted.copyWith(fontSize: 18, fontWeight: semiBold),
              )),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 8),
                width: double.infinity,
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
            ),
            const Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: NumpadWidget(),
            ),
            SizedBox(
              width: Get.width,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
                child: OutlinedButton(
                    onPressed: () {
                      controller.displayAmount.text =
                          CurrencyFormat.convertToIdr(
                              int.parse(controller.amountTextController.value),
                              2);

                      Get.back();
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(defaultBorderRadius),
                        ),
                      ),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 12.0),
                      ),
                    ),
                    child: Text('Simpan', style: kInter)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
