import 'package:selfrenew_space/export/selfrenew_flutter.dart';

class DatetimeUtil {
  static String now() {
    return DateUtil.getNowDateStr();
  }

  static String nowMS() {
    return now();
  }

  static String getTime(Duration duration) {
    return '${(duration.inMinutes).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  static bool isSameDay(DateTime? a, DateTime? b) {
    if (a == null || b == null) {
      return false;
    }

    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  static int between(TimeOfDay start, TimeOfDay end) {
    int hour = end.hour - start.hour;
    int minute = end.minute - start.minute;
    return hour * 60 + minute.abs();
  }
}
