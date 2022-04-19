import 'package:flutter/material.dart';
import 'package:pawang_mobile/config/theme_constants.dart';
import 'package:pawang_mobile/views/detail_image_struk_screen.dart';
import 'package:pawang_mobile/views/landing_screen.dart';
import 'package:pawang_mobile/views/detail_pengeluaran_screen.dart';
import 'package:pawang_mobile/views/riwayat_screen.dart';
import 'package:pawang_mobile/views/scan_struk_screen.dart';
import 'package:pawang_mobile/views/validasi_scan_screen.dart';

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
        fontFamily: "OpenSans",
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingScreen(),
        '/riwayat': (context) => RiwayatScreen(),
        '/scan-struk': (context) => const ScanStruk(),
        '/validasi-scan': (context) => const ValidasiScanScreen(),
        '/detail': (context) => const DetailPengeluaran(),
        '/lihat-struk': (context) => const DetailImageStrukScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
