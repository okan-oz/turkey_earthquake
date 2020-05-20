import 'package:flutter/material.dart';
import 'package:turkey_earthquake/helper/utils.dart';
import 'package:turkey_earthquake/logger.dart';
import 'package:turkey_earthquake/mainbody_ui/map.dart';
import 'package:turkey_earthquake/models/earthquake.dart';

class DetailScreen extends StatelessWidget {
  EarthQuake eq;
  DetailScreen(this.eq);

  TextStyle _getAppBarDetailTextStyle() {
    return TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
  }

  @override
  Widget build(BuildContext context) {
    try {
   
      throw ("error_example");
    } catch (e, s) {
      // "context" will append the word "thrown" in the
      // Crashlytics console.
      Logger.recordError(
          e,
          s,
          "Crashlytics error from IOS .Exception occured at " +
              DateTime.now().toString());
    }

    return Scaffold(
        body: Container(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            stretch: true,
            onStretchTrigger: () {
              // Function callback for stretch
              return;
            },
            expandedHeight: 130.0,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: <StretchMode>[
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
                StretchMode.fadeTitle,
              ],
              centerTitle: false,
              titlePadding:
                  EdgeInsetsDirectional.only(start: 10, bottom: 16, top: 10),
              title: ListTile(
                leading: CircleAvatar(
                  radius: 20,
                  backgroundColor: Utils.DecideListTileColor(eq.mag),
                  child: Text(eq.mag.toString(),
                      style: _getAppBarDetailTextStyle()),
                ),
                title: Text(
                  eq.title,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  eq.date,
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    "assets/depremAppBar.jpg",
                    fit: BoxFit.cover,
                    colorBlendMode: BlendMode.modulate,
                    color: Color.fromRGBO(255, 255, 255, 0.9),
                  ),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.0, 0.5),
                        end: Alignment(0.0, 0.0),
                        colors: <Color>[
                          Color(0x60000000),
                          Color(0x00000000),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              ListTile(
                leading: Icon(
                  Icons.dialpad,
                  color: Colors.brown,
                ),
                title: Text("Derinlik"),
                subtitle: Text(eq.depth.toString()),
              ),
              ListTile(
                leading: Icon(
                  Icons.timer,
                  color: Colors.green,
                ),
                title: Text("Tarih"),
                subtitle: Text(eq.date.toString()),
              ),
              ListTile(
                leading: Icon(
                  Icons.location_on,
                  color: Colors.red,
                ),
                title: Text("Lokasyon"),
                subtitle: Text(eq.lokasyon),
              ),
              // ListTiles++
            ]),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(10),
              height: 350,
              width: 50,
              child: MapSample(eq),
            ),
          ),
        ],
      ),
    ));
  }
}
