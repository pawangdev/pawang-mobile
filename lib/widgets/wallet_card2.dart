import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/models/wallet_model.dart';
import 'package:pawang_mobile/modules/wallet/wallet.dart';
import 'package:pawang_mobile/utils/currency_format.dart';
import 'package:pawang_mobile/widgets/button_custom.dart';
import 'package:pawang_mobile/widgets/input_field.dart';

// ignore: must_be_immutable
class WalletCard2 extends StatelessWidget {
  final WalletDataModel wallet;
  final Function()? onTap;
  bool? isChoose = false;

  WalletCard2({Key? key, required this.wallet, this.onTap, this.isChoose})
      : super(key: key);

  final WalletController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        width: Get.width,
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: Get.width * 0.5,
              child: Text(
                wallet.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: kInter.copyWith(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? defaultWhite
                      : defaultPrimary,
                  fontWeight: semiBold,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.014,
            ),
            Text(
              CurrencyFormat.convertToIdr(wallet.balance, 2),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: kInter.copyWith(
                fontWeight: medium,
                fontSize: 15,
              ),
            ),
            isChoose == false
                ? const SizedBox(
                    height: 15,
                  )
                : const SizedBox(),
          ],
        ),
        decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.light
                ? defaultWhite
                : const Color(0XFF39434D),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            boxShadow: [
              BoxShadow(
                color: defaultBlack.withOpacity(0.07),
                spreadRadius: 2,
                blurRadius: 10,
              )
            ]),
      ),
    );
  }
}
