import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/constants/theme.dart';

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
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: kOpenSans.copyWith(fontWeight: regular, color: defaultBlack),
      ),
      SizedBox(
        height: Get.height * 0.01,
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
          contentPadding: const EdgeInsets.all(15),
          fillColor: const Color(0xFFF5F5F5),
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(defaultBorderRadius),
              borderSide: BorderSide.none),
          focusColor: defaultPrimary,
        ),
      ),
    ]);
  }
}
