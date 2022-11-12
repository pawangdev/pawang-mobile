import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/constants/theme.dart';

class WalletCard3 extends StatelessWidget {
  const WalletCard3({
    Key? key,
    required this.nama,
    this.isSelected = false,
  }) : super(key: key);

  final String nama;
  final bool? isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  color: defaultBlack.withOpacity(0.07),
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
    );
  }
}
