import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/modules/transaction/controllers/transaction_controller.dart';
import 'package:pawang_mobile/widgets/number_button.dart';

class NumpadWidget extends StatelessWidget {
  TransactionController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            NumberButton(number: "1"),
            NumberButton(number: "2"),
            NumberButton(number: "3"),
          ],
        ),
        Row(
          children: [
            NumberButton(number: "4"),
            NumberButton(number: "5"),
            NumberButton(number: "6"),
          ],
        ),
        Row(
          children: [
            NumberButton(number: "7"),
            NumberButton(number: "8"),
            NumberButton(number: "9"),
          ],
        ),
        Row(
          children: [
            NumberButton(number: "000"),
            NumberButton(number: "00"),
            Expanded(
              child: IconButton(
                  onPressed: () {
                    controller.amountTextController.value =
                        controller.amountTextController.value.substring(0,
                            controller.amountTextController.value.length - 1);

                    // ignore: prefer_is_empty
                    if (controller.amountTextController.value.length == 0) {
                      controller.amountTextController.value = "0";
                    }
                  },
                  icon: const Icon(TablerIcons.backspace)),
            )
          ],
        ),
      ],
    );
  }
}
