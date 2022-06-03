import 'package:flutter/material.dart';
import 'package:pawang_mobile/config/theme_constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InputField extends StatelessWidget {
  const InputField(
      {Key? key,
      required this.inputLabel,
      required this.inputController,
      this.enable = true,
      this.readOnly = false,
      this.errorText,
      this.onTap,
      this.keyboardType})
      : super(key: key);
  final String inputLabel;
  final bool enable;
  final bool readOnly;
  final TextEditingController inputController;
  final String? errorText;
  final Function()? onTap;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        inputLabel,
        style: kOpenSans.copyWith(
            fontSize: 0.24.dp, fontWeight: bold, color: kBlack),
      ),
      SizedBox(
        height: 1.4.h,
      ),
      TextField(
        readOnly: readOnly,
        enabled: enable,
        keyboardType: keyboardType,
        onTap: onTap,
        controller: inputController,
        decoration: InputDecoration(
          errorText: errorText,
          fillColor: const Color(0xFFF5F5F5),
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(kDefaultBorderRadius),
              borderSide: BorderSide.none),
          focusColor: kPrimary,
        ),
      ),
    ]);
  }
}
