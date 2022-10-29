import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/constants/theme.dart';

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
        Container(
          width: Get.width * 0.22,
          height: Get.height * 0.115,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: defaultBlack.withOpacity(0.09),
                spreadRadius: 2,
                blurRadius: 10,
              )
            ],
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: defaultWhite,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              child: Column(
                children: [
                  Center(
                    child: Image.asset(icon, width: 35),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: kOpenSans.copyWith(
                        fontSize: 12,
                        fontWeight: semiBold,
                        color: defaultPrimary),
                  ),
                ],
              ),
              onTap: onTap,
            ),
          ),
        ),
      ],
    );
  }
}
