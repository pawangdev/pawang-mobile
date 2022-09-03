import 'package:flutter/material.dart';
import 'package:pawang_mobile/constants/theme.dart';

class NumberButton extends StatelessWidget {
  final String number;
  final TextEditingController controller;

  const NumberButton({Key? key, required this.number, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (controller.text == '0') {
          if (number == '0' || number == '000') {
            controller.text = "0";
          } else {
            controller.text = number.toString();
          }
        } else {
          controller.text += number.toString();
        }
      },
      child: Text(
        number.toString(),
        style: TextStyle(fontSize: 20, fontWeight: bold, color: Colors.black),
      ),
    );
  }
}
