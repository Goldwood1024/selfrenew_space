import 'dart:convert';

import 'package:selfrenew_space/selfrenew_flutter.dart';

class HabitFormProvider extends ChangeNotifier {
  static final HabitRepository habitRepository = HabitRepository();

  late String target;
  TextEditingController titleController = TextEditingController();
  TextEditingController heartenController = TextEditingController();

  late DateTime startDate;

  // 重复
  late RepeatModel repeatModel = RepeatModel();
  late RemindModel remindModel;
  late IconModel iconModel;
  late TargetModel targetModel;

  TargetModel getTargetModel() {
    return targetModel;
  }

  void updateTargetModel(TargetModel model) {
    targetModel = model;
    notifyListeners();
  }

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

  List<int> getRepeatDays() {
    if (repeatModel.type == 0) {
      return repeatModel.repeatDays;
    }

    return repeatModel.repeatDays;
  }

  int getRepeatType() {
    return repeatModel.type;
  }

  void newHabit(String value) {
    /// 新的习惯
    if (ObjectUtil.isEmpty(value)) {
      titleController.text = '';
      // 图标
      iconModel = IconModel.defaultIconModel();
      repeatModel = RepeatModel.defaultRepeatModel();
      remindModel = RemindModel.defaultDateTime();
      targetModel = TargetModel.defaultTargetModel();
      startDate = DateTime.now();
      heartenController.text = Global.randomHearten();
    } else {
      /// 模板创建
      List<HabitLibModel> list = Global.getHabit(true);
      for (HabitLibModel model in list) {
        if (model.key == value) {
          titleController.text = model.title;
          iconModel = IconModel(
            color: model.iconModel.color,
            icon: model.iconModel.icon,
          );

          targetModel = TargetModel.defaultTargetModel();
          repeatModel = RepeatModel.defaultRepeatModel();
          remindModel = RemindModel.defaultDateTime();
          startDate = DateTime.now();
          heartenController.text = model.hearten;

          break;
        }
      }
    }

    notifyListeners();
  }

  Future<void> query(String id) async {
    Map<String, Object?> mm = await habitRepository.selectById(id);
    print(mm);

    titleController.text = mm['title'].toString();
    repeatModel = RepeatModel.toBean(jsonDecode(mm['repeat'].toString()));
    remindModel = RemindModel.toBean(jsonDecode(mm['remind'].toString()));
    iconModel = IconModel.toBean(jsonDecode(mm['icons'].toString()));

    targetModel = TargetModel.toBean(jsonDecode(mm['target'].toString()));
    heartenController.text = mm['hearten'].toString();
    startDate = DateTime.fromMillisecondsSinceEpoch(
        int.parse(mm['startDate'].toString()));

    notifyListeners();
  }

  void updateRepeatDay(int index) {
    if (repeatModel.repeatDays.contains(index)) {
      repeatModel.repeatDays.removeWhere((element) => element == index);
    } else {
      repeatModel.repeatDays.add(index);
    }
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
