import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pawang_mobile/constants/strings.dart';
import 'package:pawang_mobile/views/new_add_transaction.dart';
import 'package:pawang_mobile/views/pin_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import 'routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();

  //Remove this method to stop OneSignal Debugging
  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

  OneSignal.shared.setAppId(oneSignalAPPID);

  OneSignal.shared.getDeviceState();

// The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
  OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
    print("Accepted permission: $accepted");
  });

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
        return GetMaterialApp(
          title: 'Pawang',
          theme: ThemeData(
            fontFamily: "OpenSans",
          ),
          home: PinView(),
          // initialRoute: AppPages.INITIAL,
          // getPages: AppPages.pages,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
