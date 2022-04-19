import 'package:flutter/material.dart';
import 'package:pawang_mobile/config/theme_constants.dart';

class InputField extends StatelessWidget {
  const InputField(
      {Key? key,
      required this.inputLabel,
      required this.inputController,
      this.enable = true})
      : super(key: key);
  final String inputLabel;
  final bool enable;
  final TextEditingController inputController;

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
          controller: inputController,
          decoration: InputDecoration(
            fillColor: Color(0xFFF5F5F5),
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(kDefaultBorderRadius),
                borderSide: BorderSide.none),
          ),
        ),
      ]),
    );
  }
}
