import 'package:flutter/material.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:form_validator/form_validator.dart';

class InputField extends StatelessWidget {
  const InputField(
      {Key? key,
      required this.inputLabel,
      required this.inputController,
      this.enable = true,
      this.readOnly = false,
      this.isPassword = false,
      this.onTap,
      this.keyboardType,
      this.capitalization = TextCapitalization.sentences,
      this.validator})
      : super(key: key);
  final String inputLabel;
  final bool enable;
  final bool readOnly;
  final TextEditingController inputController;
  final Function()? onTap;
  final TextInputType? keyboardType;
  final TextCapitalization? capitalization;
  final String? Function(String?)? validator;
  final bool? isPassword;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        inputLabel,
        style: kOpenSans.copyWith(
            fontSize: 12,
            //0.21.dp,
            fontWeight: bold,
            color: kBlack),
      ),
      SizedBox(
        height: 1.4.h,
      ),
      TextFormField(
        validator: validator,
        readOnly: readOnly,
        enabled: enable,
        obscureText: isPassword!,
        keyboardType: keyboardType,
        textCapitalization: capitalization!,
        onTap: onTap,
        controller: inputController,
        decoration: InputDecoration(
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
