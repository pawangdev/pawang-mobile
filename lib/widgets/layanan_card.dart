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
                    color: kBlack.withOpacity(0.22),
                    spreadRadius: 2,
                    blurRadius: 10,
                  )
                ]),
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
              //0.18.dp
              fontSize: 10,
              fontWeight: medium,
              color: kWhite),
        ),
      ],
    );
  }
}
