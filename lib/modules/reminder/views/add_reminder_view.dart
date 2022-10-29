import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/modules/reminder/reminder.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';
import 'package:pawang_mobile/widgets/input_field.dart';

class AddReminderView extends StatelessWidget {
  AddReminderView({Key? key}) : super(key: key);
  final ReminderController controller = Get.find();
  final reminderUpdate = Get.arguments;

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
                        Get.back();
                        if (reminderUpdate != null) {
                          controller.nameTextController.text = "";
                          controller.dateTextController.text = "";
                        }
                      }),
                  Text(
                    reminderUpdate == null
                        ? "Tambah Pengingat"
                        : "Edit Pengingat",
                    style: kOpenSans.copyWith(
                        fontSize: 16, fontWeight: bold, color: defaultBlack),
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
                        inputLabel: 'Nama Pengingat',
                        inputController: controller.nameTextController,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Tanggal & Waktu",
                        style: kOpenSans.copyWith(
                            fontSize: 12,
                            fontWeight: bold,
                            color: defaultBlack),
                      ),
                      SizedBox(
                        height: Get.height * 0.014,
                      ),
                      DateTimePicker(
                        cancelText: 'Batal',
                        use24HourFormat: false,
                        calendarTitle: 'Pilih Tanggal',
                        timePickerEntryModeInput: true,
                        type: DateTimePickerType.dateTime,
                        initialDate: DateTime.now().toLocal(),
                        dateMask: 'd MMMM yyyy - HH:mm',
                        initialValue: reminderUpdate == null
                            ? controller.dateTextController.text
                            : DateTime.parse(controller.dateTextController.text)
                                .toLocal()
                                .toString(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        onChanged: (value) {
                          controller.dateTextController.text = value;
                        },
                        decoration: InputDecoration(
                          fillColor: const Color(0xFFF5F5F5),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(defaultBorderRadius),
                            borderSide: BorderSide.none,
                          ),
                          focusColor: defaultPrimary,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  child: Text(
                    reminderUpdate == null
                        ? "Tambah Pengingat"
                        : "Edit Pengingat",
                    style: kOpenSans.copyWith(
                        fontSize: 14,
                        fontWeight: semiBold,
                        color: defaultPrimary),
                  ),
                  onPressed: () => reminderUpdate != null
                      ? controller.onSubmit(
                          isAdding: false, id: reminderUpdate['id'])
                      : controller.onSubmit(),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    side: const BorderSide(color: defaultPrimary),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
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
