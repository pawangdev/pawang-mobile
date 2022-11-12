// ignore_for_file: unrelated_type_equality_checks

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/modules/reminder/reminder.dart';
import 'package:pawang_mobile/widgets/button_custom.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';
import 'package:pawang_mobile/widgets/input_field.dart';
import 'package:pawang_mobile/widgets/reminder_loop.dart';

class AddReminderView extends StatelessWidget {
  AddReminderView({Key? key}) : super(key: key);
  final ReminderController controller = Get.find();
  final reminderUpdate = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconBack(
                    blueMode: true,
                    onTap: () {
                      Get.back();
                      if (reminderUpdate != null) {
                        controller.resetAllInput();
                      }
                    }),
                Text(
                  reminderUpdate == null
                      ? "Tambah Pengingat".tr
                      : "Edit Pengingat".tr,
                  style: kInter.copyWith(fontSize: 16, fontWeight: bold),
                ),
                SizedBox(
                  width: Get.width * 0.072,
                )
              ],
            ),
            SizedBox(
              height: Get.height * 0.044,
            ),
            Expanded(
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputField(
                      icon: const Icon(Icons.campaign_outlined),
                      inputLabel: 'Nama Pengingat'.tr,
                      inputController: controller.nameTextController,
                    ),
                    SizedBox(
                      height: Get.height * 0.034,
                    ),
                    DateTimePicker(
                      cancelText: 'Batal'.tr,
                      use24HourFormat: true,
                      calendarTitle: 'Pilih Tanggal'.tr,
                      timePickerEntryModeInput: true,
                      type: DateTimePickerType.dateTime,
                      initialDate: DateTime.now().toLocal(),
                      dateMask: 'd MMMM yyyy - HH:mm',
                      initialValue: reminderUpdate == null
                          ? controller.dateTextController.text
                          : DateTime.parse(controller.dateTextController.text)
                              .toLocal()
                              .toString(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                      onChanged: (value) {
                        controller.dateTextController.text = value;
                      },
                      decoration: InputDecoration(
                        icon: const Icon(Icons.calendar_month),
                        hintText: 'Tanggal & Waktu'.tr,
                        fillColor: defaultWhite,
                        focusColor: defaultPrimary,
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.034,
                    ),
                    InputField(
                      icon: const Icon(Icons.event_repeat_rounded),
                      keyboardType: TextInputType.none,
                      inputLabel: 'Perulangan'.tr,
                      inputController: controller.typeRepeateTextController,
                      readOnly: true,
                      onTap: () {
                        showDialog<void>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Text(
                              'Ulangi Pengingat'.tr,
                              textAlign: TextAlign.center,
                              style: kInter.copyWith(
                                  fontSize: 16, fontWeight: bold),
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: Get.height * 0.67,
                                  width: Get.width * 0.8,
                                  child: ListView.builder(
                                    itemBuilder: (context, index) {
                                      final typeRepeate =
                                          controller.typeData[index].tr;
                                      return Padding(
                                        padding: const EdgeInsets.all(2),
                                        child: GestureDetector(
                                          onTap: () {
                                            controller.typeRepeateTextController
                                                .text = typeRepeate.tr;

                                            controller.typeRepeate.value =
                                                typeRepeate.tr;

                                            Get.back();
                                          },
                                          child: Obx(
                                            () => ReminderLoop(
                                              nama: typeRepeate.tr,
                                              isSelected: typeRepeate ==
                                                      controller
                                                          .typeRepeate.value.tr
                                                  ? true
                                                  : false,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    itemCount: controller.typeData.length,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            ButtonCustom(
              elevatedMode: false,
              text: reminderUpdate == null
                  ? "Tambah Pengingat".tr
                  : "Edit Pengingat".tr,
              onTap: () => reminderUpdate != null
                  ? controller.onSubmit(
                      isAdding: false, id: reminderUpdate['id'])
                  : controller.onSubmit(),
            ),
          ],
        ),
      ),
    );
  }
}
