import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    return Column(
      children: [
        InkWell(
          child: Container(
            height: 6.7.h,
            width: 14.2.w,
            decoration: BoxDecoration(
              color: kWhite,
              borderRadius: const BorderRadius.all(Radius.circular(18)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 0.5,
                  blurRadius: 0.5,
                  offset: const Offset(1, 3), // changes position of shadow
                ),
              ],
            ),
            child: Center(
              child: Wrap(
                children: [SvgPicture.asset(icon)],
              ),
            ),
          ),
          onTap: onTap,
        ),
        SizedBox(
          height: 1.4.h,
        ),
        Text(
          title,
          style: kOpenSans.copyWith(
              fontSize: 0.18.dp, fontWeight: medium, color: kWhite),
        ),
      ],
    );
  }
}
