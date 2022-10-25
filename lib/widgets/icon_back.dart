import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/constants/theme.dart';

class IconBack extends StatelessWidget {
  const IconBack({Key? key, required this.blueMode, required this.onTap})
      : super(key: key);

  final bool blueMode;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return blueMode
        ? InkWell(
            child: Container(
              width: Get.width * 0.072,
              height: Get.height * 0.036,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                border: Border.all(color: defaultPrimary),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.arrow_back_ios_rounded,
                size: 12,
                color: defaultPrimary,
              ),
            ),
            onTap: onTap,
          )
        : InkWell(
            child: Container(
              width: Get.width * 0.072,
              height: Get.height * 0.036,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                border: Border.all(color: defaultWhite),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.arrow_back_ios_rounded,
                size: 12,
                color: defaultWhite,
              ),
            ),
            onTap: onTap,
          );
  }
}
