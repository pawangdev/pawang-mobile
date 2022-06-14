import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pawang_mobile/views/add_category.dart';
import 'package:pawang_mobile/views/add_wallet.dart';
import 'package:pawang_mobile/views/change_password_screen.dart';
import 'package:pawang_mobile/views/connection_screen.dart';
import 'package:pawang_mobile/views/dashboard_screen.dart';
import 'package:pawang_mobile/views/detail_image_struk_screen.dart';
import 'package:pawang_mobile/views/edit_profile.dart';
import 'package:pawang_mobile/views/kategori_screen.dart';
import 'package:pawang_mobile/views/landing_screen.dart';
import 'package:pawang_mobile/views/login_screen.dart';
import 'package:pawang_mobile/views/detail_pengeluaran_screen.dart';
import 'package:pawang_mobile/views/navigation_screen.dart';
import 'package:pawang_mobile/views/register_screen.dart';
import 'package:pawang_mobile/views/scan_struk_screen.dart';
import 'package:pawang_mobile/views/setting_screen.dart';
import 'package:pawang_mobile/views/splash_screen.dart';
import 'package:pawang_mobile/views/tambah_pemasukan.dart';
import 'package:pawang_mobile/views/tambah_pengeluaran.dart';
import 'package:pawang_mobile/views/validasi_scan_screen.dart';
import 'package:pawang_mobile/views/wallet_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(const MyApp());
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

    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          title: 'Pawang',
          theme: ThemeData(
            fontFamily: "OpenSans",
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => const SplashScreen(),
            '/navigation-screen': (context) => const NavigationScreen(),
            '/landing': (context) => const LandingScreen(),
            '/login': (context) => const LoginScreen(),
            '/register': (context) => const RegisterScreen(),
            '/dashboard': (context) => const DashboardScreen(),
            '/settings': (context) => const SettingsScreen(),
            '/edit-profile': (context) => const EditProfileScreen(),
            '/kategori': (context) => const KategoriScreen(),
            '/dompet': (context) => const WalletScreen(),
            '/tambah-kategori': (context) => const AddCategoryScreen(),
            '/tambah-dompet': (context) => const AddWalletScreen(),
            '/tambah-pemasukan': (context) => const TambahPemasukanScreen(),
            '/tambah-pengeluaran': (context) => const TambahPengeluaranScreen(),
            '/scan-struk': (context) => const ScanStruk(),
            '/validasi-scan': (context) => const ValidasiScanScreen(),
            '/detail': (context) => const DetailPengeluaran(),
            '/lihat-struk': (context) => const DetailImageStrukScreen(),
            '/connection-check': ((context) => const ConnectionScreen()),
            '/change-password': ((context) => const ChangePasswordScreen()),
          },
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
