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
    return Container(
      width: Get.width * 0.23,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: defaultBlack.withOpacity(0.12),
            spreadRadius: 2,
            blurRadius: 10,
          )
        ],
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: defaultWhite,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            GestureDetector(
              child: Center(
                child: Image.asset(icon),
              ),
              onTap: onTap,
            ),
            SizedBox(
              height: Get.height * 0.014,
            ),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: kOpenSans.copyWith(
                  //0.18.dp
                  fontSize: 10,
                  fontWeight: bold,
                  color: defaultBlack),
            ),
          ],
        ),
      ),
    );
  }
}
