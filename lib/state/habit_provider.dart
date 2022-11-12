import 'dart:convert';

import 'package:calendar_view/calendar_view.dart';
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

      TargetModel targetModel =
          TargetModel.toBean(jsonDecode(map['target'].toString()));

      List<SleekCount> sleek = sleeks(targetModel);

      for (SleekCount count in sleek) {
        Map<String, Object?> mm = await habitRepository.selectClickById(
            DatetimeUtil.getDateYMD(count.dateTime), map['id'].toString());
        count.value = 0;
        if (mm.isNotEmpty) {
          count.value = double.parse(mm['value'].toString());
        }
      }

      list.add(
        HabitUnderway(
          map['id'].toString(),
          map['title'].toString(),
          o,
          '每天',
          targetModel,
          notice,
          sleek,
        ),
      );
    }

    notifyListeners();
  }

  List<SleekCount> sleeks(TargetModel targetModel) {
    List<SleekCount> counts = [];
    DateTime dateTime = DateTime.now().firstDayOfWeek();
    for (int day = 0; day < 7; day++) {
      counts.add(
        SleekCount(
          max: targetModel.max,
          dateTime: DatetimeUtil.addDate(dateTime, day),
        ),
      );
    }

    return counts;
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
