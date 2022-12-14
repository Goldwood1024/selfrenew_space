import 'package:selfrenew_space/selfrenew_flutter.dart';

class DatetimeUtil {
  static String now() {
    return DateUtil.getNowDateStr();
  }

  static String nowDateYMD() {
    return getDateYMD(DateTime.now());
  }

  static String nowMS() {
    return now();
  }

  static String getTime(Duration duration) {
    return '${(duration.inMinutes).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  static String getHorTime(DateTime dateTime) {
    return '${(dateTime.hour).toString().padLeft(2, '0')}:${(dateTime.minute % 60).toString().padLeft(2, '0')}';
  }

  static String getDateYMD(DateTime dateTime) {
    return DateUtil.formatDate(dateTime, format: 'yyyy-MM-dd');
  }

  static bool isSameDay(DateTime? a, DateTime? b) {
    if (a == null || b == null) {
      return false;
    }

    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  static bool isSameDayWithoutYear(DateTime? a, DateTime? b) {
    if (a == null || b == null) {
      return false;
    }

    return a.month == b.month && a.day == b.day;
  }

  static bool isSameDayOnlyDay(DateTime? a, DateTime? b) {
    if (a == null || b == null) {
      return false;
    }

    return a.day == b.day;
  }

  static int between(TimeOfDay start, TimeOfDay end) {
    int hour = end.hour - start.hour;
    int minute = end.minute - start.minute;
    return hour * 60 + minute.abs();
  }

  static String weekdayStr(BuildContext context) {
    return DateUtil.getWeekday(DateTime.now(), languageCode: 'zh');
  }

  static int weekday() {
    return DateTime.now().weekday;
  }

  static DateTime addDate(DateTime dateTime, int day) {
    return dateTime.add(Duration(days: day));
  }
}
