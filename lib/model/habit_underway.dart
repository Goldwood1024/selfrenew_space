import 'package:selfrenew_space/model/notice.dart';
import 'package:selfrenew_space/model/sleek_count.dart';

class HabitUnderway {
  final String id;
  final String title;
  final String imagePath;
  final String repeat;

  final List<Notice> notices;
  final List<SleekCount> sleeks;

  HabitUnderway(
    this.id,
    this.title,
    this.imagePath,
    this.repeat,
    this.notices,
    this.sleeks,
  );
}
