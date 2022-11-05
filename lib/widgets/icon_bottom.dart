import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/constants/theme.dart';

class IconBottomBar extends StatelessWidget {
  const IconBottomBar(
      {Key? key,
      required this.text,
      required this.selected,
      required this.onPressed,
      required this.iconEnable,
      required this.iconDisable})
      : super(key: key);
  final String text;
  final String iconEnable;
  final String iconDisable;
  final bool selected;
  final Function() onPressed;

  final primaryColor = defaultPrimary;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      width: Get.width * 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: onPressed,
            child: selected
                ? Image.asset(
                    iconEnable,
                    width: 26,
                    height: 26,
                  )
                : Image.asset(
                    iconDisable,
                    width: 24,
                    height: 24,
                  ),
          ),
          selected
              ? Text(
                  text,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: kInter.copyWith(
                      fontWeight: semiBold, color: primaryColor),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
