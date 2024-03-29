import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/modules/transaction/transaction.dart';

// ignore: must_be_immutable
class NumberButton extends StatelessWidget {
  final String number;

  NumberButton({Key? key, required this.number}) : super(key: key);

  TransactionController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          if (controller.amountTextController.value == '0') {
            if (number == '0' || number == '000') {
              controller.amountTextController.value = "0";
            } else {
              controller.amountTextController.value = number;
            }
          } else {
            if (int.parse(controller.amountTextController.value) <=
                4294967296) {
              controller.amountTextController.value += number;
            } else {
              if (!Get.isSnackbarOpen) {
                Get.snackbar(
                  'Terdapat Kesalahan !',
                  'Melebihi Nilai Limit',
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                  snackPosition: SnackPosition.BOTTOM,
                  margin: const EdgeInsets.all(20),
                  icon: const Icon(
                    Icons.cancel,
                    color: Colors.white,
                  ),
                );
              }
            }
          }
        },
        child: Text(
          number.toString(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: kInter.copyWith(
              fontWeight: semiBold,
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.black
                  : defaultWhite,
              fontSize: 22),
        ),
      ),
    );
  }
}
