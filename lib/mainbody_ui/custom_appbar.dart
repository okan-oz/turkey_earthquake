import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size(double.infinity, 200);
  var _opacity = 1.0;
  var _xOffset = 0.7;
  var _yOffset = 0.5;
  var _blurRadius = 100.0;
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: Size(double.infinity, 200),
        child: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black12, spreadRadius: 0, blurRadius: 0),
              ],
              image: DecorationImage(
                  image: AssetImage(
                    "assets/depremAppBar.jpg",
                  ),
                  fit: BoxFit.fitWidth)),
          width: MediaQuery.of(context).size.width,
          height: 150,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.red,

                //backgroundBlendMode: BlendMode.color,
                image: DecorationImage(
                    image: AssetImage(
                      "assets/depremAppBar.jpg",
                    ),
                    fit: BoxFit.fitWidth)),
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Türkiye Son Depremler",
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(_opacity),
                          offset: Offset(_xOffset, _yOffset),
                          blurRadius: _blurRadius,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
