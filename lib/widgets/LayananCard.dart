import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawang_mobile/constants/theme.dart';

class LayananCard extends StatelessWidget {
  const LayananCard(
      {Key? key, required this.icon, required this.title, required this.onTap})
      : super(key: key);
  final String icon;
  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext) {
    return Column(
      children: [
        InkWell(
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.all(Radius.circular(18)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 0.5,
                  blurRadius: 0.5,
                  offset: Offset(1, 3), // changes position of shadow
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
          height: 10,
        ),
        Text(
          title,
          style: kOpenSans.copyWith(
              fontSize: 12, fontWeight: medium, color: kWhite),
        ),
      ],
    );
  }
}
