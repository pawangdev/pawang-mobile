import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/constants/theme.dart';

class SelectButton extends StatelessWidget {
  const SelectButton({
    Key? key,
    required this.nama,
    this.isSelected = false,
    this.onTap,
  }) : super(key: key);

  final String nama;
  final bool? isSelected;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: Get.width,
        height: Get.height * 0.1,
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.light
              ? defaultWhite
              : Color(0XFF1B2430),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            isSelected == false
                ? BoxShadow(
                    color: defaultBlack.withOpacity(0.14),
                    spreadRadius: 2,
                    blurRadius: 10,
                  )
                : BoxShadow(
                    color: defaultPrimary.withOpacity(0.4),
                    spreadRadius: 1,
                    blurRadius: 10,
                  )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
              child: Text(
            nama,
            style: kInter.copyWith(fontWeight: medium),
          )),
        ),
      ),
    );
  }
}
