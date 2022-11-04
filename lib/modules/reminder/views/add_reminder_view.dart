import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/modules/reminder/reminder.dart';
import 'package:pawang_mobile/widgets/button_custom.dart';
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
                    style: kInter.copyWith(
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
                        icon: const Icon(Icons.campaign_outlined),
                        inputLabel: 'Nama Pengingat',
                        inputController: controller.nameTextController,
                      ),
                      SizedBox(
                        height: Get.height * 0.034,
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
                        decoration: const InputDecoration(
                          icon: Icon(Icons.calendar_month),
                          hintText: 'Tanggal & Waktu',
                          fillColor: defaultWhite,
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
              ButtonCustom(
                elevatedMode: false,
                text: reminderUpdate == null
                    ? "Tambah Pengingat"
                    : "Edit Pengingat",
                onTap: () => reminderUpdate != null
                    ? controller.onSubmit(
                        isAdding: false, id: reminderUpdate['id'])
                    : controller.onSubmit(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
