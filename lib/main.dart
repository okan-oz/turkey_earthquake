import 'package:flutter/material.dart';
import 'package:turkey_earthquake/models/filter.dart';
import 'package:turkey_earthquake/screens/mainscreen.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'dart:async';
import 'package:provider/provider.dart';
import 'helper/text_const.dart';

void main() {
  Crashlytics.instance.enableInDevMode = true;
  FlutterError.onError = Crashlytics.instance.recordFlutterError;

  runZoned(() {
    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Filters(),
        ),
      ],
      child: MyApp(),
    ));
  }, onError: Crashlytics.instance.recordError);
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
      home: MainSreen(),
  
    );
  }
}
