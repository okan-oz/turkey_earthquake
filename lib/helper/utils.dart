import 'package:flutter/material.dart';
import 'package:super_alertbox/super_snackbar.dart';

class Utils {
  static double CheckDouble(dynamic value) {
    if (value is String) {
      return double.parse(value);
    } else if (value is int) {
      return double.parse(value.toString());
    } else {
      return value;
    }
  }

  static Color DecideListTileColor(double mg) {
    if (mg <= 1) {
      return Colors.blue.shade300;
    } else if (1 < mg && mg <= 3) {
      return Colors.yellow.shade600;
    } else if (3 < mg && mg <= 4) {
      return Colors.orange.shade600;
    } else if (4 < mg && 5 >= mg) {
      return Colors.orange.shade900;
    } else if (5 < mg && mg <= 6) {
      return Colors.red.shade500;
    } else if (6 < mg && mg <= 7) {
      return Colors.red.shade700;
    } else if (7 < mg) {
      return Colors.red.shade900;
    }
    return Colors.white;
  }

  static void ShowAlert(BuildContext context,String title,String message) {
     SuperSnackBar.showFlushbar(title,message, context);
  }

  static void ShowUpdateEqInfo(BuildContext context){
      Utils.ShowAlert(context, "Güncellendi","Deprem verileri yeniden alındı..");
  }

    static void ShowClearEqFilterInfo(BuildContext context){
      Utils.ShowAlert(context, "Filtreler temizlendi","Deprem verileri filtre olmadan yeniden alındı..");
  }
}
