import 'package:selfrenew_space/dao/habit/repository.dart';
import 'package:selfrenew_space/model/habit_underway.dart';
import 'package:selfrenew_space/model/notice.dart';
import 'package:selfrenew_space/model/sleek_count.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';

class HabitProvider extends ChangeNotifier {
  static final HabitRepository habitRepository = HabitRepository();

  bool hasUnderway() {
    return true;
  }

  List<HabitUnderway> getHabitUnderway() {
    List<HabitUnderway> list = [];

    list.add(HabitUnderway(
      '33',
      '222',
      'assets/icons/浴盆.svg',
      '每天',
      [
        Notice('1', '08:90'),
        Notice('2', '19:90'),
      ],
      [
        SleekCount(1, 5, 2, false, 1),
        SleekCount(1, 2, 2, false, 2),
        SleekCount(1, 2, 2, false, 3),
        SleekCount(1, 6, 5, false, 4),
        SleekCount(1, 7, 2, false, 5),
        SleekCount(1, 7, 2, false, 6),
        SleekCount(1, 7, 2, false, 7),
      ],
    ));

    list.add(HabitUnderway(
      '332',
      '测四',
      'assets/icons/浴盆.svg',
      '每天3',
      [
        Notice('2', '19:90'),
      ],
      [],
    ));
    return list;
  }
}
