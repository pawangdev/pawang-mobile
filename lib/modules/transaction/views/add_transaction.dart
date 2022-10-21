import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:pawang_mobile/modules/transaction/controllers/transaction_controller.dart';
import 'package:pawang_mobile/widgets/dropdown_field.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';
import 'package:pawang_mobile/widgets/input_field.dart';

class AddTransaction extends StatelessWidget {
  bool? isUpdate = Get.arguments == null ? false : Get.arguments['isUpdate'];
  final TransactionController controller = Get.find<TransactionController>();
  final DashboardController dashboardController =
      Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: Get.height * 0.02,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Tentukan Nominal Anda',
                    labelText: 'Nominal',
                  ),
                  onSaved: (String? value) {},
                ),
                SizedBox(
                  height: Get.height * 0.025,
                ),
                // DropdownField(
                //     inputLabel: 'Kategori',
                //     data: dashboardController.wallets,
                //     onChange: (value) {
                //       controller.walletId.value = dashboardController.wallets;
                //       controller.displayWalletName.value =
                //           dashboardController.wallets[value].name;
                // }),

                // TextFormField(
                //   decoration: const InputDecoration(
                //     hintText: 'Tentukan Kategori Anda',
                //     labelText: 'Kategori',
                //   ),
                //   onSaved: (String? value) {},
                // ),
                // SizedBox(
                //   height: Get.height * 0.025,
                // ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Tentukan Dompet Anda',
                    labelText: 'Dompet',
                  ),
                  onSaved: (String? value) {},
                ),
                SizedBox(
                  height: Get.height * 0.025,
                ),
                TextFormField(
                  controller: controller.dateTextController,
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: 'Tanggal',
                  ),
                  onTap: () {},
                ),
                SizedBox(
                  height: Get.height * 0.025,
                ),
                TextFormField(
                  controller: controller.descriptionTextController,
                  decoration: const InputDecoration(
                    hintText: 'Tentukan Keterangan Anda',
                    labelText: 'Keterangan',
                  ),
                  onSaved: (String? value) {},
                ),
                SizedBox(
                  height: Get.height * 0.035,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(defaultBorderRadius),
                            gradient: const LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [defaultPrimary, defaultPurple])),
                        child: TextButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset(
                                'assets/images/scan3.png',
                                width: 25,
                              ),
                              Text(
                                'Scan Struk',
                                style: kOpenSans.copyWith(
                                    fontSize: 16,
                                    fontWeight: medium,
                                    color: defaultWhite),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.01,
                    ),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          "Simpan",
                          style: kOpenSans.copyWith(
                              color: defaultPrimary,
                              fontSize: 16,
                              fontWeight: medium),
                        ),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.all(13),
                          side: const BorderSide(color: defaultPrimary),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(defaultBorderRadius),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.034,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
