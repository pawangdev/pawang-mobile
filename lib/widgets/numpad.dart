import 'package:flutter/material.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/widgets/number_button.dart';

class NumpadWidget extends StatelessWidget {
  final TextEditingController controller;

  const NumpadWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                NumberButton(number: "1", controller: controller),
                NumberButton(number: "2", controller: controller),
                NumberButton(number: "3", controller: controller),
              ],
            ),
            Row(
              children: [
                NumberButton(number: "4", controller: controller),
                NumberButton(number: "5", controller: controller),
                NumberButton(number: "6", controller: controller),
              ],
            ),
            Row(
              children: [
                NumberButton(number: "7", controller: controller),
                NumberButton(number: "8", controller: controller),
                NumberButton(number: "9", controller: controller),
              ],
            ),
            Row(
              children: [
                NumberButton(number: "000", controller: controller),
                NumberButton(number: "0", controller: controller),
                Expanded(
                  child: IconButton(
                    onPressed: () {
                      print(controller.text);
                      if (controller.text != '0') {
                        controller.text = controller.text
                            .substring(0, controller.text.length - 1);
                      }
                      // ignore: prefer_is_empty
                      if (controller.text.length == 0) {
                        controller.text = "0";
                      }
                    },
                    icon: const Icon(
                      Icons.backspace_rounded,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
        Column(
          children: [ElevatedButton(onPressed: () {}, child: Text("OK"))],
        )
      ],
    );
  }
}
