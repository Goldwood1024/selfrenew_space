import 'dart:convert';

import 'package:selfrenew_space/dao/habit/repository.dart';
import 'package:selfrenew_space/model/habit_underway.dart';
import 'package:selfrenew_space/model/notice.dart';
import 'package:selfrenew_space/model/sleek_count.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';

class HabitProvider extends ChangeNotifier {
  static final HabitRepository habitRepository = HabitRepository();
  List<HabitUnderway> list = [];

  Future<void> reloadHabitUnderway() async {
    list.clear();

    List<Map<String, Object?>> data = await habitRepository.query();

    for (Map<String, Object?> map in data) {
      IconModel o = IconModel.toBean(jsonDecode(map['icons'].toString()));
      // repeatModel = RepeatModel.toBean(jsonDecode(map['repeat'].toString()));
      RemindModel remindModel =
          RemindModel.toBean(jsonDecode(map['remind'].toString()));

      List<Notice> notice = [];
      for (DateTime dateTime in remindModel.list) {
        notice.add(Notice(text: DatetimeUtil.getHorTime(dateTime)));
      }

      list.add(
        HabitUnderway(
          map['id'].toString(),
          map['title'].toString(),
          o,
          '每天',
          notice,
          [
            SleekCount(day: 11, max: 10),
            SleekCount(day: 12, max: 4),
            SleekCount(day: 13, max: 3),
            SleekCount(day: 14),
            SleekCount(day: 15),
            SleekCount(day: 16),
            SleekCount(day: 17),
          ],
        ),
      );
    }

    notifyListeners();
  }

  bool hasUnderway() {
    return list.isNotEmpty;
  }

  List<HabitUnderway> getHabitUnderway() {
    return list;
  }

  void delete(String id) {
    // 删除数据库
    SqliteProxy.habitRepository.update('isDeleted', '1', id);
    list.removeWhere((element) => element.id == id);

    notifyListeners();
  }
}
