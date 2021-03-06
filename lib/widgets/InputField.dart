import 'package:flutter/material.dart';
import 'package:pawang_mobile/config/theme_constants.dart';

class InputField extends StatelessWidget {
  const InputField(
      {Key? key,
      required this.inputLabel,
      required this.inputController,
      this.enable = true,
      this.errorText,
      this.onTap,
      this.keyboardType})
      : super(key: key);
  final String inputLabel;
  final bool enable;
  final TextEditingController inputController;
  final String? errorText;
  final Function()? onTap;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          inputLabel,
          style: kOpenSans.copyWith(fontWeight: bold, color: kBlack),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          enabled: enable,
          keyboardType: keyboardType,
          onTap: onTap,
          controller: inputController,
          decoration: InputDecoration(
            errorText: errorText,
            fillColor: Color(0xFFF5F5F5),
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(kDefaultBorderRadius),
                borderSide: BorderSide.none),
            focusColor: kPurple,
          ),
        ),
      ]),
    );
  }
}
