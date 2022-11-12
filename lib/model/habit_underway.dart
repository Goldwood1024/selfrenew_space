import 'package:selfrenew_space/model/notice.dart';
import 'package:selfrenew_space/model/repeat_day.dart';
import 'package:selfrenew_space/model/sleek_count.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';

class HabitUnderway {
  final String id;
  final String title;
  final IconModel icons;
  final TargetModel targetModel;
  final String repeat;

  final List<Notice> notices;
  final List<SleekCount> sleeks;

  HabitUnderway(
    this.id,
    this.title,
    this.icons,
    this.repeat,
    this.targetModel,
    this.notices,
    this.sleeks,
  );

  SleekCount getSleekCount(DateTime now) {
    for (SleekCount count in sleeks) {
      if (DatetimeUtil.isSameDay(count.dateTime, now)) {
        return count;
      }
    }

    return SleekCount(dateTime: now);
  }
}
