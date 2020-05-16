import 'package:flutter/material.dart';
import 'package:turkey_earthquake/screens/mainscreen.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'dart:async';
void main() //=> runApp(MyApp());
{
Crashlytics.instance.enableInDevMode = true;
FlutterError.onError = Crashlytics.instance.recordFlutterError;

runZoned(() {
    runApp(MyApp());
  }, onError: Crashlytics.instance.recordError);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      title: 'Türkiye Depremleri',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainSreen( ),
    );
  }
}

