// ignore_for_file: use_key_in_widget_constructors

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/modules/dashboard/dashboard.dart';
import 'package:pawang_mobile/modules/transaction/controllers/transaction_controller.dart';
import 'package:pawang_mobile/routes/routes.dart';
import 'package:pawang_mobile/widgets/button_custom.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';
import 'package:pawang_mobile/widgets/input_field.dart';

class AddTransactionView extends StatelessWidget {
  final args = Get.arguments;
  final TransactionController controller = Get.find<TransactionController>();
  final DashboardController dashboardController =
      Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 32),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconBack(
                    blueMode: true,
                    onTap: () {
                      controller.clearInput();
                      Get.back();
                    },
                  ),
                  Text(
                    args == null ? "Tambah Transaksi".tr : "Edit Transaksi".tr,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(
                    width: 32,
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.04,
              ),
              Center(
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      InputField(
                        validator: ValidationBuilder(localeName: 'id')
                            .required()
                            .build(),
                        icon: const Icon(Icons.monetization_on_outlined),
                        inputLabel: 'Nominal',
                        inputController: controller.displayAmount,
                        onTap: (() =>
                            Get.toNamed(RoutesName.transactionnumpad)),
                        keyboardType: TextInputType.none,
                        readOnly: true,
                      ),

                      SizedBox(
                        height: Get.height * 0.025,
                      ),
                      TextFormField(
                        validator: ValidationBuilder(localeName: 'id')
                            .required()
                            .build(),
                        controller: controller.displayCategoryName,
                        onTap: (() => Get.toNamed(RoutesName.category,
                            arguments: {'is_choose': true})),
                        keyboardType: TextInputType.none,
                        textInputAction: TextInputAction.next,
                        readOnly: true,
                        enableInteractiveSelection: false,
                        decoration: InputDecoration(
                          icon: const Icon(Icons.grid_view),
                          hintText: 'Kategori'.tr,
                          suffixIcon: Container(
                            padding: const EdgeInsets.all(10),
                            child: SvgPicture.asset(
                              'assets/images/chevron_down.svg',
                              color: defaultGray,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.025,
                      ),
                      TextFormField(
                        validator: ValidationBuilder(localeName: 'id')
                            .required()
                            .build(),
                        controller: controller.displayWalletName,
                        onTap: (() => Get.toNamed(RoutesName.wallet,
                            arguments: {'is_choose': true})),
                        keyboardType: TextInputType.none,
                        readOnly: true,
                        textInputAction: TextInputAction.next,
                        enableInteractiveSelection: false,
                        decoration: InputDecoration(
                          hintText: 'Dompet'.tr,
                          icon: const Icon(Icons.payment_rounded),
                          suffixIcon: Container(
                            padding: const EdgeInsets.all(10),
                            child: SvgPicture.asset(
                              'assets/images/chevron_down.svg',
                              color: defaultGray,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.025,
                      ),

                      DateTimePicker(
                        validator: ValidationBuilder(localeName: 'id')
                            .required()
                            .build(),
                        controller: controller.dateTextController,
                        textInputAction: TextInputAction.next,
                        type: DateTimePickerType.dateTime,
                        initialDate: DateTime.now().toLocal(),
                        dateMask: 'd MMMM yyyy - HH:mm',
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        onChanged: (value) {
                          controller.dateTextController.text = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Tanggal'.tr,
                          icon: const Icon(Icons.calendar_month),
                          suffixIcon: Container(
                            padding: EdgeInsets.all(10),
                            child: SvgPicture.asset(
                              'assets/images/chevron_down.svg',
                              color: defaultGray,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.025,
                      ),
                      InputField(
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (_) async {
                          controller.formValdidate();
                          if (args == null) {
                            await controller.createTransaction();
                          } else {
                            await controller.updateTransaction();
                          }
                        },
                        icon: const Icon(Icons.format_quote_rounded),
                        inputLabel: 'Keterangan'.tr,
                        inputController: controller.descriptionTextController,
                      ),
                      // TextFormField(
                      //   controller: controller.descriptionTextController,
                      //   decoration: const InputDecoration(
                      //     hintText: 'Isi Deskripsi Singkat',
                      //   ),
                      //   onSaved: (String? value) {},
                      // ),
                      SizedBox(
                        height: Get.height * 0.035,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ButtonCustom(
                    elevatedMode: false,
                    text: 'Simpan Transaksi'.tr,
                    onTap: () async {
                      controller.formValdidate();
                      if (args == null) {
                        await controller.createTransaction();
                      } else {
                        await controller.updateTransaction();
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
