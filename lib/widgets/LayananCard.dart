import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawang_mobile/config/theme_constants.dart';

class LayananCard extends StatelessWidget {
  const LayananCard({Key? key, required this.icon, required this.title})
      : super(key: key);
  final String icon;
  final String title;

  @override
  Widget build(BuildContext) {
    return Column(
      children: [
        InkWell(
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: kPurple.withOpacity(0.1),
                borderRadius: BorderRadius.all(Radius.circular(18))),
            child: Center(
              child: Wrap(
                children: [SvgPicture.asset(icon)],
              ),
            ),
          ),
          onTap: () {},
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: kOpenSans.copyWith(
              fontSize: 12, fontWeight: medium, color: kBlack),
        ),
      ],
    );
  }
}
