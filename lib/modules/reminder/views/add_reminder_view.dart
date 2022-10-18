import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/modules/reminder/reminder.dart';
import 'package:pawang_mobile/widgets/dropdown_field.dart';
import 'package:pawang_mobile/widgets/icon_back.dart';
import 'package:pawang_mobile/widgets/input_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddReminderView extends StatelessWidget {
  AddReminderView({Key? key}) : super(key: key);
  final ReminderController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                          Navigator.pop(context);
                        }),
                    Text(
                      "Tambah Reminder",
                      style: kOpenSans.copyWith(
                          fontSize: 16, fontWeight: bold, color: defaultBlack),
                    ),
                    SizedBox(
                      width: 7.2.w,
                    )
                  ],
                ),
                SizedBox(
                  height: 4.4.h,
                ),
                Form(
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
                        "Tanggal",
                        style: kOpenSans.copyWith(
                            fontSize: 12,
                            //0.21.dp,
                            fontWeight: bold,
                            color: defaultBlack),
                      ),
                      SizedBox(
                        height: 1.4.h,
                      ),
                      DateTimePicker(
                        type: DateTimePickerType.dateTime,
                        initialDate: DateTime.now(),
                        dateMask: 'd MMMM yyyy - HH:mm',
                        initialValue: controller.dateTextController.text,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        use24HourFormat: true,
                        onChanged: (value) {
                          controller.dateTextController.text = value;
                        },
                        decoration: InputDecoration(
                          fillColor: const Color(0xFFF5F5F5),
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(defaultBorderRadius),
                              borderSide: BorderSide.none),
                          focusColor: defaultPrimary,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      DropdownField(
                        value: controller.type.value,
                        inputLabel: "Tipe Perulangan",
                        data: controller.typeData,
                        onChange: (value) {
                          controller.type.value = value.toString();
                        },
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
