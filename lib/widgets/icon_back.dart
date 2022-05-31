import 'package:flutter/material.dart';
import 'package:pawang_mobile/constants/theme.dart';

class IconBack extends StatelessWidget {
  const IconBack({
    Key? key,
    required this.PurpleMode,
  }) : super(key: key);

  final bool PurpleMode;

  @override
  Widget build(BuildContext context) {
    return PurpleMode
        ? InkWell(
            child: Container(
              width: 32,
              height: 32,
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                border: Border.all(color: kPrimary),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.arrow_back_ios_rounded,
                size: 12,
                color: kPrimary,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          )
        : InkWell(
            child: Container(
              width: 32,
              height: 32,
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                border: Border.all(color: kWhite),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.arrow_back_ios_rounded,
                size: 12,
                color: kWhite,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          );
  }
}
