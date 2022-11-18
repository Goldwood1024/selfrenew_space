import 'dart:convert';

import 'package:selfrenew_space/selfrenew_flutter.dart';

class FocusFormProvider extends ChangeNotifier {
  static final FocusRepository focusRepository = FocusRepository();

  late int targetTime;
  late int shortRelaxTime;
  late int longRelaxTime;
  late int longRelaxInterval;
  late int autoRelax;
  late String type;
  late IconModel iconModel;

  TextEditingController titleEditingController = TextEditingController();

  // 重复
  late RepeatModel repeatModel = RepeatModel();
  late FocusRemindModel remindModel;

  FocusRemindModel getFocusRemindModel() {
    return remindModel;
  }

  void updateType(String value) {
    type = value;

    print(value);
    notifyListeners();
  }

  IconModel getIconModel() {
    return iconModel;
  }

  List<DateTime> getSelectedDates() {
    return repeatModel.selectedDates;
  }

  void updateSelectedDates(List<DateTime> values) {
    repeatModel.selectedDates = values;
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

  void updateIconModel(String icon, String color) {
    iconModel.icon = icon;
    iconModel.color = color;

    notifyListeners();
  }

  int getTargetTime() {
    return targetTime ~/ 60;
  }

  void updateTargetTime(int value) {
    targetTime = value;
    notifyListeners();
  }

  int getShortRelaxTime() {
    return shortRelaxTime ~/ 60;
  }

  void updateShortRelaxTime(int value) {
    shortRelaxTime = value;
    notifyListeners();
  }

  int getLongRelaxTime() {
    return longRelaxTime ~/ 60;
  }

  void updateLongRelaxTime(int value) {
    longRelaxTime = value;
    notifyListeners();
  }

  int getLongRelaxInterval() {
    return longRelaxInterval;
  }

  void updateLongRelaxInterval(int value) {
    longRelaxInterval = value;
    notifyListeners();
  }

  bool getAutoRelax() {
    return autoRelax == 1;
  }

  void updateAutoRelax(bool value) {
    if (value) {
      autoRelax = 1;
    } else {
      autoRelax = 0;
    }

    notifyListeners();
  }

  void newFocus() {
    titleEditingController.text = '';
    targetTime = 300;
    shortRelaxTime = 300;
    longRelaxTime = 300;
    longRelaxInterval = 4;
    autoRelax = 0;
    iconModel = IconModel.defaultIconModel();
    remindModel = FocusRemindModel.defaultFocusRemindModel();
    notifyListeners();
  }

  Future<void> queryById(id) async {
    Map<String, Object?> mm = await focusRepository.selectById(id);
    titleEditingController.text = mm['title'].toString();
    targetTime = int.parse(mm['targetTime'].toString());
    shortRelaxTime = int.parse(mm['shortRelaxTime'].toString());
    longRelaxTime = int.parse(mm['longRelaxTime'].toString());
    longRelaxInterval = int.parse(mm['longRelaxInterval'].toString());
    autoRelax = int.parse(mm['autoRelax'].toString());
    autoRelax = int.parse(mm['autoRelax'].toString());
    type = mm['type'].toString();

    iconModel = IconModel.toBean(jsonDecode(mm['icons'].toString()));
    remindModel = FocusRemindModel.defaultFocusRemindModel();
    notifyListeners();
  }
}
