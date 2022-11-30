import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:pawang_mobile/constants/strings.dart';
import 'package:pawang_mobile/constants/theme.dart';
import 'package:pawang_mobile/utils/storage.dart';
import 'package:pawang_mobile/utils/translation.dart';

import 'routes/routes.dart';

void main() async {
  await GetStorage.init();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();

  OneSignal.shared.setAppId(oneSignalAPPID);
  OneSignal.shared.getDeviceState();
  OneSignal.shared.promptUserForPushNotificationPermission();
  configLoading();
  runApp(const MyApp());
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 40.0
    ..radius = defaultBorderRadius
    ..maskType = EasyLoadingMaskType.black
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = false
    ..dismissOnTap = false;
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

    return GetMaterialApp(
      title: 'Pawang',
      theme: ThemeData(
        fontFamily: "Inter",
        errorColor: defaultError,
      ),
      themeMode: Storage.getValue('themeMode') == "dark"
          ? ThemeMode.dark
          : ThemeMode.light,
      darkTheme: ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.dark,
          primary: defaultPrimary,
          onPrimary: defaultBlack,
          secondary: defaultPurple,
          onSecondary: defaultGray,
          primaryContainer: Colors.transparent,
          onPrimaryContainer: defaultBlack,
          error: Colors.black,
          onError: Colors.white,
          background: defaultBlack,
          onBackground: Colors.black,
          surface: defaultBlack,
          onSurface: defaultGray,
        ),
        fontFamily: "Inter",
        errorColor: defaultError,
      ),
      translations: Translation(),
      locale: Storage.getValue('locale') == "en"
          ? const Locale('en')
          : const Locale('id'),
      builder: EasyLoading.init(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.pages,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fade,
    );
  }
}
