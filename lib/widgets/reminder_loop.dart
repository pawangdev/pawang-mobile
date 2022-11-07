import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/constants/theme.dart';

class ReminderLoop extends StatelessWidget {
  const ReminderLoop({Key? key, required this.nama, this.isSelected = false})
      : super(key: key);

  final String nama;
  final bool? isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height * 0.1,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: defaultWhite,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          isSelected == false
              ? BoxShadow(
                  color: defaultBlack.withOpacity(0.07),
                  spreadRadius: 2,
                  blurRadius: 10,
                )
              : BoxShadow(
                  color: defaultPrimary.withOpacity(0.4),
                  spreadRadius: 1,
                  blurRadius: 10,
                )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
            child: Text(
          nama,
          style: kInter.copyWith(fontWeight: medium),
        )),
      ),
    );
    ;
  }
}
