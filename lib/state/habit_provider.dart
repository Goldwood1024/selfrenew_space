import 'package:selfrenew_space/dao/habit/repository.dart';
import 'package:selfrenew_space/model/habit_underway.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';

class HabitProvider extends ChangeNotifier {
  static final HabitRepository habitRepository = HabitRepository();
  List<HabitUnderway> list = [];

  Future<void> reloadHabitUnderway() async {
    list.clear();

    List<Map<String, Object?>> data = await habitRepository.query();

    for (Map<String, Object?> map in data) {
      list.add(
        HabitUnderway(
          map['id'].toString(),
          map['title'].toString(),
          map['imagePath'].toString(),
          map['repeat'].toString(),
          [],
          [],
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
}
