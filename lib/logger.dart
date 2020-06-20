import 'package:super_logging/super_logging.dart' as logger;

class Logger {
  static void recordError(dynamic e, StackTrace s, String customMessege) {
    logger.recordError(e, s, context: customMessege);
  }
}
