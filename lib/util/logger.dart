import 'package:selfrenew_space/selfrenew_flutter.dart';


class Log {
  static final _logger = Logger(
      printer: PrettyPrinter(
    methodCount: 2,
  ));

  static const String _info = "info";
  static const String _warn = "warn";
  static const String _error = "error";

  static info(String message) {
    _logger.i(_fmt(_info, message));
  }

  static warn(String message) {
    _logger.w(_fmt(_warn, message));
  }

  static error(String message) {
    _logger.e(_fmt(_error, message));
  }

  static String _fmt(String type, String message) {
    return "${DatetimeUtil.nowMS()} $type - $message";
  }
}
