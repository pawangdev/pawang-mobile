import 'package:flutter/material.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
              width: 7.2.w,
              height: 3.6.h,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                border: Border.all(color: kPrimary),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.arrow_back_ios_rounded,
                size: 12,
                color: kPrimary,
              ),
            ),
            onTap: onTap,
          )
        : InkWell(
            child: Container(
              width: 7.2.w,
              height: 3.6.h,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                border: Border.all(color: kWhite),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.arrow_back_ios_rounded,
                size: 12,
                color: kWhite,
              ),
            ),
            onTap: onTap,
          );
  }
}
