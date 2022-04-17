import 'package:flutter/material.dart';
import 'package:pawang_mobile/views/LandingScreen.dart';
import 'views/LandingScreen.dart';
import 'package:pawang_mobile/views/DetailPengeluaran.dart';
import 'package:pawang_mobile/views/riwayat_screen.dart';
import 'package:pawang_mobile/views/ScanStruk.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pawang',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "OpenSans",
      ),
      home: const DetailPengeluaran(),
    );
  }
}
