import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawang_mobile/constants/theme.dart';

class DropdownField extends StatelessWidget {
  const DropdownField({
    Key? key,
    required this.inputLabel,
    required this.data,
    required this.onChange,
    this.hint = "",
    this.value,
  }) : super(key: key);
  final String inputLabel;
  final String? hint;
  final Object? value;
  final List data;
  final Function(Object?)? onChange;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        inputLabel,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: kInter.copyWith(fontWeight: bold, color: defaultBlack),
      ),
      SizedBox(
        height: Get.height * 0.014,
      ),
      DecoratedBox(
        decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(defaultBorderRadius)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: DropdownButton(
              value: value,
              hint: Text(hint.toString()),
              underline: Container(),
              isExpanded: true,
              dropdownColor: const Color(0xFFF5F5F5),
              items: data
                  .map((e) => DropdownMenuItem(
                        child: Text(e['name']),
                        value: e['id'],
                      ))
                  .toList(),
              onChanged: onChange),
        ),
      ),
    ]);
  }
}
