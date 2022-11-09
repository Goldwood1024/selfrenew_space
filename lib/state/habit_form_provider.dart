import 'package:selfrenew_space/dao/habit/repository.dart';
import 'package:selfrenew_space/model/remind_model.dart';
import 'package:selfrenew_space/model/repeat_day.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';

class HabitFormProvider extends ChangeNotifier {
  static final HabitRepository habitRepository = HabitRepository();

  late String title;
  late String icons;
  late String target;
  late String remind;
  late String hearten;
  late DateTime startDate = DateTime.parse('2022-11-11');

  // 重复
  late RepeatModel repeatModel = RepeatModel();
  late RemindModel remindModel = RemindModel();

  DateTime getStartDateTime() {
    return startDate;
  }

  void updateStartDateTime(DateTime _) {
    startDate = _;

    notifyListeners();
  }

  List<DateTime> getRemindDates() {
    return remindModel.list;
  }

  void removeRemindDate(DateTime dateTime) {
    remindModel.list.removeWhere((element) => element == dateTime);

    notifyListeners();
  }

  void removeAddRemindDate(DateTime old, DateTime n) {
    remindModel.list.removeWhere((element) => element == old);
    updateRemindDates(n);
  }

  void updateRemindDates(DateTime value) {
    if (remindModel.list.contains(value)) {
      return;
    }

    remindModel.list.add(value);

    notifyListeners();
  }

  List<DateTime> getSelectedDates() {
    return repeatModel.selectedDates;
  }

  void updateSelectedDates(DateTime value) {
    if (repeatModel.selectedDates.contains(value)) {
      repeatModel.selectedDates.removeWhere((element) => value == element);
    } else {
      repeatModel.selectedDates.add(value);
    }

    notifyListeners();
  }

  List<RepeatDay> getRepeatDays() {
    if (repeatModel.type == 0) {
      return repeatModel.repeatDays;
    }

    return repeatModel.repeatDays;
  }

  int getRepeatType() {
    return repeatModel.type;
  }

  void query() {
    repeatModel = RepeatModel();
    repeatModel.type = 0;
    repeatModel.repeatDays.add(RepeatDay(day: '周一', value: '1'));
    repeatModel.repeatDays.add(RepeatDay(day: '周二', value: '2'));

    remindModel = RemindModel();

    notifyListeners();
  }

  void updateRepeatDay(int index, bool selected) {
    repeatModel.repeatDays[index].selected = selected;
    notifyListeners();
  }

  void updateRepeatType(int index) {
    repeatModel.type = index;

    print(repeatModel.type);
    notifyListeners();
  }
}
