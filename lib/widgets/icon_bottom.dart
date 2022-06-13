import 'package:flutter/material.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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

  final primaryColor = kPrimary;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: onPressed,
              child: selected
                  ? Image.asset(
                      iconEnable,
                      width: 28,
                      height: 28,
                    )
                  : Image.asset(
                      iconDisable,
                      width: 25,
                      height: 25,
                    ),
            ),
            selected
                ? Text(
                    text,
                    style:
                        TextStyle(fontSize: 8, height: 1, color: primaryColor),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
