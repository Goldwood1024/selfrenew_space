import 'package:selfrenew_space/model/notice.dart';
import 'package:selfrenew_space/model/sleek_count.dart';

class FocusUnderwayModel {
  final String id;
  final String title;
  final String imagePath;
  final String repeat;

  final List<Notice> notices;
  final List<SleekCount> sleeks;

  FocusUnderwayModel(
    this.id,
    this.title,
    this.imagePath,
    this.repeat,
    this.notices,
    this.sleeks,
  );
}
