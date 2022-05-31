import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pawang_mobile/views/add_category.dart';
import 'package:pawang_mobile/views/add_wallet.dart';
import 'package:pawang_mobile/views/connection_screen.dart';
import 'package:pawang_mobile/views/dashboard_screen.dart';
import 'package:pawang_mobile/views/detail_image_struk_screen.dart';
import 'package:pawang_mobile/views/kategori_screen.dart';
import 'package:pawang_mobile/views/landing_screen.dart';
import 'package:pawang_mobile/views/login_screen.dart';
import 'package:pawang_mobile/views/detail_pengeluaran_screen.dart';
import 'package:pawang_mobile/views/register_screen.dart';
import 'package:pawang_mobile/views/riwayat_screen.dart';
import 'package:pawang_mobile/views/scan_struk_screen.dart';
import 'package:pawang_mobile/views/setting_screen.dart';
import 'package:pawang_mobile/views/splash_screen.dart';
import 'package:pawang_mobile/views/tambah_pemasukan.dart';
import 'package:pawang_mobile/views/tambah_pengeluaran.dart';
import 'package:pawang_mobile/views/validasi_scan_screen.dart';
import 'package:pawang_mobile/views/wallet_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'Pawang',
      theme: ThemeData(
        fontFamily: "OpenSans",
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/landing': (context) => const LandingScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/dashboard': (context) => DashboardScreen(),
        '/settings': (context) => SettingsScreen(),
        '/riwayat': (context) => RiwayatScreen(),
        '/kategori': (context) => KategoriScreen(),
        '/dompet': (context) => WalletScreen(),
        '/tambah-kategori': (context) => AddCategoryScreen(),
        '/tambah-dompet': (context) => AddWalletScreen(),
        '/tambah-pemasukan': (context) => TambahPemasukanScreen(),
        '/tambah-pengeluaran': (context) => TambahPengeluaranScreen(),
        '/scan-struk': (context) => const ScanStruk(),
        '/validasi-scan': (context) => const ValidasiScanScreen(),
        '/detail': (context) => const DetailPengeluaran(),
        '/lihat-struk': (context) => const DetailImageStrukScreen(),
        '/connection-check': ((context) => ConnectionScreen())
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
