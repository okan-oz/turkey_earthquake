import 'package:flutter/material.dart';
import 'package:turkey_earthquake/helper/utils.dart';
import 'package:turkey_earthquake/models/filter.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  TextStyle _textStyle = TextStyle(fontSize: 13, color: Colors.grey.shade900);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white70,
          items: [
            BottomNavigationBarItem(
              title: Text(
                "Filtreleri Kaldır",
                style: _textStyle,
              ),

              icon: IconButton(
                highlightColor: Colors.red,
                icon: Icon(
                  Icons.delete_forever,
                  color: Colors.grey.shade800,
                  size: 30,
                ),
                onPressed: () {
                  context.read<Filters>().Update(new Filters());
                  Utils.ShowClearEqFilterInfo(context);
                },
              ),
            ),
            BottomNavigationBarItem(
              title: Text(
                "Güncelle",
                style: _textStyle,
              ),
  
              icon: IconButton(
                highlightColor: Colors.red,
                icon: Icon(
                  Icons.refresh,
                  color: Colors.green,
                  size: 30,
                ),
                onPressed: () {
                  context.read<Filters>().Refresh();
                  Utils.ShowUpdateEqInfo(context);
                },
              ),
            )
          ]),
    );
  }
}
