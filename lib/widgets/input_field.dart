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
      this.validator,
      required this.icon})
      : super(key: key);
  final String inputLabel;
  final Widget icon;
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
    return TextFormField(
      textInputAction: TextInputAction.next,
      validator: validator,
      readOnly: readOnly,
      enabled: enable,
      obscureText: isPassword!,
      keyboardType: keyboardType,
      textCapitalization: capitalization!,
      onTap: onTap,
      controller: inputController,
      decoration: InputDecoration(
        hintText: inputLabel,
        icon: icon,
        fillColor: Colors.white,
      ),
    );
  }
}
