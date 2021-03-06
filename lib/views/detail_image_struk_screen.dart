import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pawang_mobile/config/theme_constants.dart';

class DetailImageStrukScreen extends StatelessWidget {
  static const String routeName = "/lihat-struk";
  const DetailImageStrukScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: Text("Lihat Struk"), backgroundColor: kPurple),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: FileImage(
                File(args),
              ),
              fit: BoxFit.contain),
        ),
      ),
    );
  }
}
