import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/modules/wallet/wallet.dart';
import 'package:pawang_mobile/widgets/button_custom.dart';
import 'package:pawang_mobile/widgets/input_field.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';
import 'package:get/get.dart';

// ignore: use_key_in_widget_constructors
class AddWalletView extends StatelessWidget {
  final WalletController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                'Apakah anda ingin membuang perubahan ini?'.tr,
                style: kInter.copyWith(fontSize: 16, fontWeight: semiBold),
                textAlign: TextAlign.center,
              ),
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                Row(
                  children: [
                    Expanded(
                      child: ButtonCustom(
                        elevatedMode: false,
                        onTap: () {
                          Navigator.pop(context, false);
                        },
                        text: 'Tidak'.tr,
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.01,
                    ),
                    Expanded(
                      child: ButtonCustom(
                        elevatedMode: false,
                        onTap: () {
                          Navigator.pop(context, true);
                          controller.resetAllInput();
                          Get.back();
                        },
                        text: 'Ya'.tr,
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        );
        return shouldPop!;
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconBack(
                    blueMode: true,
                    onTap: () {
                      showDialog<bool>(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              'Apakah anda ingin membuang perubahan ini?'.tr,
                              style: kInter.copyWith(
                                  fontSize: 16, fontWeight: semiBold),
                              textAlign: TextAlign.center,
                            ),
                            actionsAlignment: MainAxisAlignment.center,
                            actions: [
                              Row(
                                children: [
                                  Expanded(
                                    child: ButtonCustom(
                                      elevatedMode: false,
                                      onTap: () {
                                        Navigator.pop(context, false);
                                      },
                                      text: 'Tidak'.tr,
                                    ),
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.01,
                                  ),
                                  Expanded(
                                    child: ButtonCustom(
                                      elevatedMode: false,
                                      onTap: () {
                                        Navigator.pop(context, true);
                                        controller.resetAllInput();
                                        Get.back();
                                      },
                                      text: 'Ya'.tr,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                  Text(
                    "Tambah Dompet".tr,
                    style: kInter.copyWith(fontSize: 16, fontWeight: bold),
                  ),
                  Container(
                    width: Get.width * 0.072,
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.034,
              ),
              Form(
                key: const Key('add-wallet'),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: InputField(
                        validator: ValidationBuilder(localeName: 'id').build(),
                        icon: const Icon(Icons.payment_rounded),
                        inputLabel: "Nama Dompet".tr,
                        inputController: controller.nameTextController,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: InputField(
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (_) {
                          controller.createWallet();
                        },
                        validator: ValidationBuilder(localeName: 'id').build(),
                        icon: const Icon(Icons.monetization_on_outlined),
                        inputLabel: "Saldo Awal".tr,
                        inputController: controller.balanceTextController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          CurrencyTextInputFormatter(
                              locale: 'id', decimalDigits: 0, symbol: '')
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Align(
                alignment: Alignment.bottomCenter,
                child: ButtonCustom(
                  text: 'Simpan Dompet'.tr,
                  onTap: () => controller.createWallet(),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
