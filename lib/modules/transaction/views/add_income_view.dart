import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pawang_mobile/constants/strings.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/modules/dashboard/dashboard.dart';
import 'package:pawang_mobile/modules/transaction/transaction.dart';
import 'package:pawang_mobile/utils/currency_format.dart';
import 'package:pawang_mobile/widgets/numpad.dart';
import 'package:date_time_picker/date_time_picker.dart';

class AddIncomeView extends StatelessWidget {
  bool? isUpdate = Get.arguments == null ? false : Get.arguments['isUpdate'];
  final TransactionController controller = Get.find<TransactionController>();
  final DashboardController dashboardController =
      Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xF9F9F9F9),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(
                        TablerIcons.chevron_left,
                        size: 22,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Income",
                      style: kOpenSans.copyWith(
                          fontWeight: semiBold, fontSize: 18),
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()),
              ],
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 16),
                width: double.infinity,
                child: Center(
                  child: Obx(
                    () => Text(
                      CurrencyFormat.convertToIdr(
                          int.parse(controller.amountTextController.value), 0),
                      style: kOpenSans.copyWith(fontSize: 24, fontWeight: bold),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              Get.bottomSheet(
                                Container(
                                  height: 250,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18, vertical: 12),
                                  decoration: const BoxDecoration(
                                    color: defaultWhite,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(24),
                                      topRight: Radius.circular(24),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Center(
                                        child: Text(
                                          "Tanggal & Waktu",
                                          style: kOpenSans.copyWith(
                                              fontSize: 16,
                                              color: defaultGray.withOpacity(1),
                                              fontWeight: semiBold),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      DateTimePicker(
                                        type: DateTimePickerType.dateTime,
                                        initialDate: DateTime.now(),
                                        dateMask: 'd MMMM yyyy - HH:mm',
                                        initialValue:
                                            controller.dateTextController.text,
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2100),
                                        use24HourFormat: true,
                                        onChanged: (value) {
                                          controller.dateTextController.text =
                                              value;

                                          controller.displayDate.value =
                                              DateFormat("d MMMM yyyy - HH:mm")
                                                  .format(DateFormat(
                                                          "yyyy-mm-dd HH:mm")
                                                      .parse(value))
                                                  .toString();

                                          controller.dateRFC3399.value =
                                              DateFormat("d MMMM yyyy - HH:mm")
                                                  .parse(controller
                                                      .displayDate.value)
                                                  .toUtc()
                                                  .toString();
                                        },
                                        decoration: const InputDecoration(
                                          suffixIcon:
                                              Icon(TablerIcons.calendar_time),
                                          fillColor: Color(0xFFF5F5F5),
                                          filled: true,
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            child:
                                Obx(() => Text(controller.displayDate.value)),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.bottomSheet(
                                Container(
                                  height: 250,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18, vertical: 12),
                                  decoration: const BoxDecoration(
                                    color: defaultWhite,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(24),
                                      topRight: Radius.circular(24),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Center(
                                        child: Text(
                                          "Deskripsi",
                                          style: kOpenSans.copyWith(
                                              fontSize: 16,
                                              color: defaultGray.withOpacity(1),
                                              fontWeight: semiBold),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            TextField(
                                              controller: controller
                                                  .descriptionTextController,
                                              decoration: const InputDecoration(
                                                fillColor: Color(0xFFF5F5F5),
                                                filled: true,
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            child: const Text("Tambahkan Catatan"),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.symmetric(
                            vertical: BorderSide.none,
                            horizontal: BorderSide(
                                color: defaultGray.withOpacity(0.3), width: 1)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Get.bottomSheet(
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 18, vertical: 12),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "Wallets",
                                          style: kOpenSans.copyWith(
                                              fontSize: 16,
                                              color: defaultGray.withOpacity(1),
                                              fontWeight: semiBold),
                                        ),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        Expanded(
                                          child: ListView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: dashboardController
                                                .wallets.length,
                                            itemBuilder: (context, index) {
                                              var wallet = dashboardController
                                                  .wallets[index];
                                              return Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8,
                                                        vertical: 12),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1,
                                                      color: defaultGray
                                                          .withOpacity(0.3)),
                                                ),
                                                margin: const EdgeInsets.only(
                                                    bottom: 14),
                                                child: Center(
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      controller.walletId
                                                          .value = wallet.id;
                                                      controller
                                                          .displayWalletName
                                                          .value = wallet.name;
                                                      Get.back();
                                                    },
                                                    child: Text(
                                                      wallet.name,
                                                      style: kOpenSans.copyWith(
                                                          fontWeight: semiBold),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  backgroundColor: Colors.white,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(24),
                                      topRight: Radius.circular(24),
                                    ),
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Obx(() => Text(
                                        controller.displayWalletName.value != ""
                                            ? controller.displayWalletName.value
                                            : "Wallets",
                                        style: kOpenSans.copyWith(
                                            fontWeight: semiBold,
                                            overflow: TextOverflow.ellipsis),
                                      )),
                                ],
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Icon(TablerIcons.arrow_left, size: 22),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Get.bottomSheet(
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 18, vertical: 12),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "Income Category",
                                          style: kOpenSans.copyWith(
                                              fontSize: 16,
                                              color: defaultGray.withOpacity(1),
                                              fontWeight: semiBold),
                                        ),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        Expanded(
                                          child: GridView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: controller
                                                .categoriesIncome.length,
                                            itemBuilder: (context, index) {
                                              var category = controller
                                                  .categoriesIncome[index];
                                              return Container(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    controller.categoryId
                                                        .value = category.id;
                                                    controller
                                                        .displayCategoryName
                                                        .value = category.name;
                                                    Get.back();
                                                  },
                                                  child: Column(
                                                    children: [
                                                      // SvgPicture.network(
                                                      //     baseHOSTAPI +
                                                      //         category.icon,
                                                      //     fit: BoxFit.cover),
                                                      Icon(TablerIcons
                                                          .shopping_cart),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          category.name,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 4,
                                              crossAxisSpacing: 4,
                                              mainAxisSpacing: 4,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  backgroundColor: Colors.white,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(24),
                                      topRight: Radius.circular(24),
                                    ),
                                  ),
                                );
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Obx(() => Text(
                                          controller.displayCategoryName
                                                      .value !=
                                                  ""
                                              ? controller
                                                  .displayCategoryName.value
                                              : "Kategori",
                                          style: kOpenSans.copyWith(
                                              fontWeight: semiBold,
                                              color: defaultBlack,
                                              overflow: TextOverflow.ellipsis),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          isUpdate == true
                              ? ElevatedButton(
                                  onPressed: () => controller.updateTransaction(
                                      controller.transactionId!,
                                      controller.transactionType!),
                                  child: const Text("Simpan"),
                                  style: ButtonStyle(
                                      padding: MaterialStateProperty.all(
                                        const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 8),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              defaultBlack),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(24)))),
                                )
                              : ElevatedButton(
                                  onPressed: () =>
                                      controller.createTransaction("income"),
                                  child: const Text("Simpan"),
                                  style: ButtonStyle(
                                      padding: MaterialStateProperty.all(
                                        const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 8),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              defaultBlack),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(24)))),
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: NumpadWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
