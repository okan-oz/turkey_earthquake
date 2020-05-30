import 'package:flutter/material.dart';
import 'package:super_alertbox/super_snackbar.dart';
import 'package:intl/intl.dart';

DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

class Utils {

  static DateFormat dateFormat = DateFormat("dd-MM-yyyy HH:mm:ss");
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
      return Colors.blue.shade100;
    } else if (1 < mg && mg <= 3) {
      return Colors.blue.shade600;
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

  static void ShowAlert(BuildContext context, String title, String message) {
    SuperSnackBar.showFlushbar(title, message, context);
  }

  static void ShowUpdateEqInfo(BuildContext context) {
    Utils.ShowAlert(context, "Güncellendi", "Deprem verileri yeniden alındı..");
  }

  static void ShowClearEqFilterInfo(BuildContext context) {
    Utils.ShowAlert(context, "Filtreler temizlendi",
        "Deprem verileri filtre olmadan yeniden alındı..");
  }

  static String formatDate(DateTime value) {
    return dateFormat.format(value);
  }

  static String formatTextDate(String value) {
    DateTime dt=convertDate(value);
    return dateFormat.format(dt);
  }

  static DateTime convertDate(String value) {
    value=value.replaceAll(".", "-");
    DateTime returnValue = DateTime.parse(value);
    return returnValue;
  }


}
