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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 33.0, horizontal: 32.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconBack(
                    blueMode: true,
                    onTap: () {
                      Get.back();
                    },
                  ),
                  Text(
                    "Tambah Dompet",
                    style: kInter.copyWith(
                        fontSize: 16, fontWeight: bold, color: defaultBlack),
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
                        inputLabel: "Nama Dompet",
                        inputController: controller.nameTextController,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: InputField(
                        validator: ValidationBuilder(localeName: 'id').build(),
                        icon: const Icon(Icons.monetization_on_outlined),
                        inputLabel: "Saldo Awal",
                        inputController: controller.balanceTextController,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Align(
                alignment: Alignment.bottomCenter,
                child: ButtonCustom(
                  text: 'Simpan Dompet',
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
