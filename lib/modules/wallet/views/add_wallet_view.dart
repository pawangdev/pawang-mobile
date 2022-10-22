import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/modules/wallet/wallet.dart';
import 'package:pawang_mobile/widgets/input_field.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart';

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
                    style: kOpenSans.copyWith(
                        fontSize: 16, fontWeight: bold, color: defaultBlack),
                  ),
                  Container(
                    width: 7.2.w,
                  ),
                ],
              ),
              SizedBox(
                height: 3.4.h,
              ),
              Form(
                key: const Key('add-wallet'),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: InputField(
                        validator: ValidationBuilder(localeName: 'id').build(),
                        inputLabel: "Nama Dompet",
                        inputController: controller.nameTextController,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: InputField(
                        validator: ValidationBuilder(localeName: 'id').build(),
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
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(defaultBorderRadius),
                          gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [defaultPrimary, defaultPurple])),
                      child: TextButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(vertical: 15),
                            ),
                          ),
                          onPressed: () => controller.createWallet(),
                          child: Text(
                            "Simpan Dompet",
                            style: kOpenSans.copyWith(
                              color: defaultWhite,
                              fontSize: 16,
                              fontWeight: bold,
                            ),
                          )),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
