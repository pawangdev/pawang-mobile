import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/constants/theme.dart';

class ButtonCustom extends StatelessWidget {
  const ButtonCustom(
      {Key? key,
      this.elevatedMode = true,
      this.onTap,
      required this.text,
      this.blueMode = true})
      : super(key: key);

  final String text;
  final bool? elevatedMode;
  final Function()? onTap;
  final bool? blueMode;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: elevatedMode!
          ? Container(
              height: Get.height * 0.07,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(defaultBorderRadius),
                  gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [defaultPrimary, defaultPurple])),
              child: TextButton(
                onPressed: onTap,
                child: Text(
                  text,
                  style: kInter.copyWith(
                      color: defaultWhite, fontSize: 16, fontWeight: semiBold),
                ),
              ),
            )
          : SizedBox(
              height: Get.height * 0.07,
              child: OutlinedButton(
                child: Text(
                  text,
                  style: kInter.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                      color: blueMode! ? defaultPrimary : defaultError),
                ),
                onPressed: onTap,
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  side: BorderSide(
                      color: blueMode! ? defaultPrimary : defaultError),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(defaultBorderRadius),
                  ),
                ),
              ),
            ),
    );
  }
}
