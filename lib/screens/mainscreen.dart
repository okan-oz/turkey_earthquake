import 'package:flutter/material.dart';
import 'package:turkey_earthquake/mainbody_ui/custom_appbar.dart';
import 'package:turkey_earthquake/mainbody_ui/earthquakelist.dart';

class MainSreen extends StatefulWidget {
  @override
  _MainSreenState createState() => _MainSreenState();
}

class _MainSreenState extends State<MainSreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: RefreshIndicator(
          onRefresh: () async {
            return await Future.delayed(Duration(seconds: 1));
          },
          child: EarthQuakeList(),
          semanticsLabel: "Güncelleniyor..",
        ));
  }
}
