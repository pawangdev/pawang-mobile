import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ImageDialog extends StatelessWidget {
  final String imageUrl;
  const ImageDialog({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 80.h,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(imageUrl), fit: BoxFit.contain)),
      ),
    );
  }
}
