import 'package:flutter/material.dart';
import 'package:turkey_earthquake/helper/text_const.dart';
import 'package:turkey_earthquake/mainbody_ui/custom_drawer.dart';
import 'package:turkey_earthquake/mainbody_ui/earthquakelist.dart';

class MainSreen extends StatefulWidget {
  @override
  _MainSreenState createState() => _MainSreenState();
}

class _MainSreenState extends State<MainSreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              ConstText.myAppTitle,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 26),
            ),
            backgroundColor: Colors.red.shade800), // CustomAppBar(),
        drawer: CustomDrawer(),
        body: RefreshIndicator(
          onRefresh: () async {
            return await Future.delayed(Duration(seconds: 1));
          },
          child: EarthQuakeList(),
          semanticsLabel: "Güncelleniyor..",
        ));
  }
}
