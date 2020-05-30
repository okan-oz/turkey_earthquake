import 'package:flutter/material.dart';
import 'package:turkey_earthquake/helper/utils.dart';
import 'package:turkey_earthquake/models/earthquake.dart';

class EqCard extends StatelessWidget {
  EqCard(this.eq, this.context, {this.onTap});

  final GestureTapCallback onTap;
  EarthQuake eq;
  BuildContext context;
  @override
  Widget build(BuildContext context) {
    return     Card(
        elevation: 3,
        child: Container(
          // decoration: BoxDecoration(
          //   border: Border.all(
          //     color: Colors.grey,//Utils.DecideListTileColor(eq.mag),
          //   ),
          //   borderRadius: BorderRadius.all(Radius.circular(10)),
          // ),
          height: 70,
          child: ListTile(
            leading: CircleAvatar(
              radius: 25.0,
              child: Text(
                eq.mag.toString(),
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              backgroundColor: Utils.DecideListTileColor(eq.mag),
            ),
            onTap: onTap,
            title: Text(eq.title.toString()),
            subtitle: Text(eq.date),
            trailing: Icon(
              Icons.view_headline,
              color: Colors.grey.shade600, //Utils.DecideListTileColor(eq.mag),
            ),
          ),
        ));
  }
}
