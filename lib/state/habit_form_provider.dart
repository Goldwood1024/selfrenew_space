import 'dart:convert';

import 'package:selfrenew_space/selfrenew_flutter.dart';

class HabitFormProvider extends ChangeNotifier {
  static final HabitRepository habitRepository = HabitRepository();

  late String target;
  TextEditingController titleController = TextEditingController();
  TextEditingController heartenController = TextEditingController();

  late DateTime startDate = DateTime.parse('2022-11-11');

  // 重复
  late RepeatModel repeatModel = RepeatModel();
  late RemindModel remindModel;
  late IconModel iconModel;

  IconModel getIconModel() {
    return iconModel;
  }

  void updateIconModel(String icon, String color) {
    iconModel.icon = icon;
    iconModel.color = color;

    notifyListeners();
  }

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

  void newHabit(String value) {
    if (ObjectUtil.isEmpty(value)) {
      titleController.text = '';
      repeatModel = RepeatModel();
      repeatModel.type = 0;
      repeatModel.repeatDays.add(
        RepeatDay(day: '周一', value: '1', selected: false),
      );
      repeatModel.repeatDays.add(RepeatDay(day: '周二', value: '2'));
      repeatModel.repeatDays.add(RepeatDay(day: '周三', value: '3'));
      repeatModel.repeatDays.add(RepeatDay(day: '周四', value: '4'));
      repeatModel.repeatDays.add(RepeatDay(day: '周五', value: '5'));
      repeatModel.repeatDays.add(RepeatDay(day: '周六', value: '6'));
      repeatModel.repeatDays.add(RepeatDay(day: '周日', value: '7'));

      remindModel = RemindModel();
      remindModel.list.add(DateTime.now());

      iconModel = IconModel(color: '#990909', icon: 'assets/icons/绘画.svg');

      heartenController.text = Global.randomHearten();
    } else {
      List<HabitLibModel> list = Global.getHabit(true);
      for (HabitLibModel model in list) {
        if (model.key == value) {
          titleController.text = model.title;
          repeatModel = RepeatModel();
          repeatModel.type = 0;
          repeatModel.repeatDays.add(
            RepeatDay(day: '周一', value: '1', selected: false),
          );
          repeatModel.repeatDays.add(RepeatDay(day: '周二', value: '2'));
          repeatModel.repeatDays.add(RepeatDay(day: '周三', value: '3'));
          repeatModel.repeatDays.add(RepeatDay(day: '周四', value: '4'));
          repeatModel.repeatDays.add(RepeatDay(day: '周五', value: '5'));
          repeatModel.repeatDays.add(RepeatDay(day: '周六', value: '6'));
          repeatModel.repeatDays.add(RepeatDay(day: '周日', value: '7'));

          remindModel = RemindModel();
          remindModel.list.add(DateTime.now());

          iconModel = IconModel(
            color: model.iconModel.color,
            icon: model.iconModel.icon,
          );
          heartenController.text = model.hearten;

          break;
        }
      }
    }

    notifyListeners();
  }

  Future<void> query(String id) async {
    Map<String, Object?> mm = await habitRepository.selectById(id);
    titleController.text = mm['title'].toString();
    repeatModel = RepeatModel();
    repeatModel.type = 0;
    repeatModel.repeatDays.add(RepeatDay(day: '周一', value: '1'));
    repeatModel.repeatDays.add(RepeatDay(day: '周二', value: '2'));

    remindModel = RemindModel();

    iconModel = IconModel.toBean(jsonDecode(mm['icons'].toString()));
    heartenController.text = mm['hearten'].toString();
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

  void updateHearten() {
    heartenController.text = Global.randomHearten();
    notifyListeners();
  }
}
