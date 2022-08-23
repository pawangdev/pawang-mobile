import 'package:flutter/material.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LayananCard extends StatelessWidget {
  const LayananCard(
      {Key? key, required this.icon, required this.title, required this.onTap})
      : super(key: key);
  final String icon;
  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 17.w,
      child: Column(
        children: [
          GestureDetector(
            child: Center(
              child: Image.asset(icon),
            ),
            onTap: onTap,
          ),
          SizedBox(
            height: 1.4.h,
          ),
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: kOpenSans.copyWith(
                //0.18.dp
                fontSize: 10,
                fontWeight: bold,
                color: defaultWhite),
          ),
        ],
      ),
    );
  }
}
