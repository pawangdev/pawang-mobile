import 'package:flutter/material.dart';
import 'package:pawang_mobile/views/riwayat_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contacts',
      theme: ThemeData(fontFamily: 'OpenSans'),
      home: RiwayatScreen(),
    );
  }
}
