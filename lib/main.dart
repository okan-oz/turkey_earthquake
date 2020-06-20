import 'package:flutter/material.dart';
import 'package:turkey_earthquake/logger.dart';
import 'package:turkey_earthquake/mainbody_ui/splash_screen.dart';
import 'package:turkey_earthquake/models/filter.dart';
import 'package:turkey_earthquake/screens/mainscreen.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'dart:async';
import 'package:provider/provider.dart';
import 'helper/text_const.dart';
import 'package:super_logging/super_logging.dart' as logger;
void main() {
  // Crashlytics.instance.enableInDevMode = true;
  // FlutterError.onError = Crashlytics.instance.recordFlutterError;

 logger.initializeWithUser("123456","ooz","okan.oz@outlook.com");
  runZoned(() {
    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Filters(),
        ),
      ],
      child: MyApp(),
    ));
  }, onError: logger.recordError);
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ConstText.myAppTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CustomSplash(),//MainSreen(),
    );
  }
}
