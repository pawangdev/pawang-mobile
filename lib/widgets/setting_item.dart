import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/constants/theme.dart';

class SettingItem extends StatelessWidget {
  const SettingItem(
      {Key? key,
      this.onTap,
      required this.color,
      required this.text,
      required this.icon})
      : super(key: key);

  final String text;
  final Color color;
  final IconData icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: onTap,
          child: SizedBox(
            width: Get.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        height: Get.height * 0.039,
                        width: Get.width * 0.083,
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          icon,
                          color: defaultWhite,
                          size: 20,
                        ),
                      ),
                    ),
                    Text(text,
                        style:
                            kInter.copyWith(fontSize: 14, fontWeight: semiBold))
                  ],
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                )
              ],
            ),
          ),
        ),
        Divider(
          color: defaultGray,
          height: Get.height * 0.05,
        ),
      ],
    );
  }
}
