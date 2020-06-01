import 'dart:async';
import 'package:flutter/material.dart';
import 'package:turkey_earthquake/screens/mainscreen.dart';


class CustomSplash extends StatefulWidget {
  @override
  _CustomSplashState createState() => _CustomSplashState();
}

class _CustomSplashState extends State<CustomSplash>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 4), () async {
      Navigator.push(context,
          new MaterialPageRoute(builder: (context) => new MainSreen()));
    });
  }

  @override
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new InkWell(
      
        child:new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new Container(
               decoration: new BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/depremAppBar.jpg",
                    ),
                    fit: BoxFit.fill),
                gradient:LinearGradient(colors: [Colors.red, Colors.red], begin: Alignment.topLeft, end: Alignment.bottomRight),
                color: Colors.red,
             ),
            ),
             Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Expanded(
                  flex: 2,
                  child: new Container(
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new CircleAvatar(
                            backgroundColor: Colors.transparent,
                            // child: new Container(
                            //     child: Image.asset("assets/depremAppBar.jpg"),
                            // ),
                            radius: 12.1,
                          ),
                          new Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                          ),
                          Text("Türkiye Depremleri",style: TextStyle(color: Colors.white , fontSize: 32, fontWeight: FontWeight.bold),)
                        ],
                      )),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                      ),
                    Text("Yükleniyor..",style: TextStyle(color: Colors.white , fontSize: 15, fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
 