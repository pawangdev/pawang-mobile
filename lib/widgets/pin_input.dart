import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PinInput extends StatelessWidget {
  final int selectedIndex;
  final int index;

  const PinInput({Key? key, required this.selectedIndex, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.07,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFF2685D9)),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: index == selectedIndex
                  ? Colors.lightBlue
                  : Colors.transparent,
              offset: const Offset(0, 0),
              spreadRadius: 1.5,
              blurRadius: 2,
            )
          ]),
      child: Container(),
      // filledIndex
      // ? Container(
      //     width: 15,
      //     height: 15,
      //     decoration: BoxDecoration(
      //       color: Colors.black.withBlue(40),
      //       shape: BoxShape.circle,
      //     ),
      //   )
      // : Container(),
    );
  }
}
