import 'dart:io';

import 'package:coder_push_interview/routes/app_pages.dart';
import 'package:coder_push_interview/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/user_response_model.dart';

//
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await Hive.initFlutter();
  Hive.registerAdapter(UserBasicInfoAdapter());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    var logger = Logger();
    logger.i("didChangeAppLifecycleState");
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        logger.i("app in resumed");
        break;
      case AppLifecycleState.inactive:
        logger.i("app in inactive");
        break;
      case AppLifecycleState.paused:
        logger.i("app in paused");
        break;
      case AppLifecycleState.detached:
        logger.i("app in detached");
        break;
    }
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance!.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      theme: ThemeData(
          primarySwatch: Colors.pink,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            elevation: 8,
            primary: Colors.white,
            shape: const CircleBorder(),
            minimumSize: const Size.square(60),
          ))),
      navigatorKey: Get.key,
      initialRoute: Routes.HOME_SCREEN,
      getPages: AppPages.routes,
    );
  }
}
