import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class Logger {
  static void recordError(Exception e, StackTrace s,String customMessege) {
    Crashlytics.instance.recordError(e, s,
          context:customMessege);
  }
}
