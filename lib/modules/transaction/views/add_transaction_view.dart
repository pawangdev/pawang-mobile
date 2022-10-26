import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/modules/dashboard/dashboard.dart';
import 'package:pawang_mobile/modules/transaction/controllers/transaction_controller.dart';
import 'package:pawang_mobile/routes/routes.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';

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
          padding: const EdgeInsets.only(top: 30, left: 32, right: 32),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
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
                        args == null ? "Tambah Transaksi" : "Edit Transaksi",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(
                        width: 32,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Center(
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          Text(
                            "Nominal",
                            style: textMuted.copyWith(
                                fontWeight: semiBold, color: defaultBlack),
                          ),
                          TextFormField(
                            validator: ValidationBuilder(localeName: 'id')
                                .required()
                                .build(),
                            controller: controller.displayAmount,
                            onTap: (() =>
                                Get.toNamed(RoutesName.transactionnumpad)),
                            keyboardType: TextInputType.none,
                            readOnly: true,
                            enableInteractiveSelection: false,
                            decoration: const InputDecoration(
                              hintText: 'Tentukan Nominal Anda',
                            ),
                            onSaved: (String? value) {},
                          ),
                          SizedBox(
                            height: Get.height * 0.025,
                          ),
                          Text(
                            "Kategori",
                            style: textMuted.copyWith(
                                fontWeight: semiBold, color: defaultBlack),
                          ),
                          TextFormField(
                            validator: ValidationBuilder(localeName: 'id')
                                .required()
                                .build(),
                            controller: controller.displayCategoryName,
                            onTap: (() => Get.toNamed(RoutesName.category,
                                arguments: {'is_choose': true})),
                            keyboardType: TextInputType.none,
                            readOnly: true,
                            enableInteractiveSelection: false,
                            decoration: InputDecoration(
                              hintText: 'Tentukan Kategori Anda',
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
                          Text(
                            "Dompet",
                            style: textMuted.copyWith(
                                fontWeight: semiBold, color: defaultBlack),
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
                            enableInteractiveSelection: false,
                            decoration: InputDecoration(
                              hintText: 'Tentukan Dompet Anda',
                              suffixIcon: Container(
                                padding: const EdgeInsets.all(10),
                                child: SvgPicture.asset(
                                  'assets/images/chevron_down.svg',
                                  color: defaultGray,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Text(
                            "Tanggal",
                            style: textMuted.copyWith(
                                fontWeight: semiBold, color: defaultBlack),
                          ),
                          DateTimePicker(
                            validator: ValidationBuilder(localeName: 'id')
                                .required()
                                .build(),
                            controller: controller.dateTextController,
                            type: DateTimePickerType.dateTime,
                            initialDate: DateTime.now().toLocal(),
                            dateMask: 'd MMMM yyyy - HH:mm',
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                            onChanged: (value) {
                              controller.dateTextController.text = value;
                            },
                            decoration: const InputDecoration(
                                hintText: 'Tentukan Dompet Anda',
                                suffixIcon: Icon(Icons.calendar_month)),
                          ),
                          SizedBox(
                            height: Get.height * 0.025,
                          ),
                          Text(
                            "Keterangan",
                            style: textMuted.copyWith(
                                fontWeight: semiBold, color: defaultBlack),
                          ),
                          TextFormField(
                            controller: controller.descriptionTextController,
                            decoration: const InputDecoration(
                              hintText: 'Isi Deskripsi Singkat',
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
                                child: OutlinedButton(
                                  onPressed: () async {
                                    controller.formValdidate();
                                    if (args == null) {
                                      await controller.createTransaction();
                                    } else {
                                      await controller.updateTransaction();
                                    }
                                  },
                                  child: Text(
                                    "Simpan",
                                    style: kOpenSans.copyWith(
                                        color: defaultPrimary,
                                        fontSize: 16,
                                        fontWeight: semiBold),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.all(13),
                                    side:
                                        const BorderSide(color: defaultPrimary),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          defaultBorderRadius),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
