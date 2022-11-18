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
    return GestureDetector(
      onTap: onTap,
      child: FittedBox(
        fit: BoxFit.fitHeight,
        child: Container(
          width: Get.width * 0.2,
          height: Get.height * 0.097,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: defaultBlack.withOpacity(0.09),
                spreadRadius: 2,
                blurRadius: 10,
              )
            ],
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: Theme.of(context).brightness == Brightness.light
                ? defaultWhite
                : const Color(0XFF39434D),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    icon,
                    width: 30,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? defaultWhite
                        : null,
                  ),
                ),
                SizedBox(height: Get.height * 0.01),
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Center(
                    child: Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: kInter.copyWith(fontSize: 12, fontWeight: medium),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
