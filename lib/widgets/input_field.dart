import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pawang_mobile/constants/theme.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.inputLabel,
    required this.inputController,
    this.enable = true,
    this.readOnly = false,
    this.isPassword = false,
    this.onTap,
    this.keyboardType,
    this.capitalization = TextCapitalization.sentences,
    this.validator,
    required this.icon,
    this.initialValue,
    this.inputFormatters,
    this.textInputAction = TextInputAction.next,
    this.onFieldSubmitted,
  }) : super(key: key);
  final String inputLabel;
  final Widget icon;
  final bool enable;
  final bool readOnly;
  final TextEditingController inputController;
  final Function()? onTap;
  final Function(String)? onFieldSubmitted;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization? capitalization;
  final String? Function(String?)? validator;
  final bool? isPassword;
  final String? initialValue;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onFieldSubmitted,
      textInputAction: textInputAction,
      validator: validator,
      readOnly: readOnly,
      enabled: enable,
      obscureText: isPassword!,
      keyboardType: keyboardType,
      textCapitalization: capitalization!,
      onTap: onTap,
      controller: inputController,
      initialValue: initialValue,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        hintText: inputLabel,
        icon: icon,
        fillColor: Colors.white,
      ),
    );
  }
}
