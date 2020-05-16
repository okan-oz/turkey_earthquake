import 'package:flutter/material.dart';


class Utils
{
  static double CheckDouble(dynamic value){
    if (value is String  ) {
      return double.parse(value);
    } 
    else if (value is int)
    {
      return double.parse(value.toString());
    }
    else {
      return value;
    }
  }

 static Color DecideListTileColor(double mg) {
    if (mg <3) {
      return Colors.blueGrey;
    } else if (1 < mg && mg <= 3) {
      return Colors.blue;
    } else if (3 < mg && mg <= 4) {
      return Colors.yellow.shade900;
    } else if (4 < mg && 5 >= mg) {
      return Colors.orange.shade900;
    } else if (5 < mg && mg <= 6) {
      return Colors.red.shade500;
    } else if (6 < mg && mg <= 7) {
      return Colors.red;
    } else if (7 < mg) {
      return Colors.red.shade900;
    }
    return Colors.white;
  }
    

}