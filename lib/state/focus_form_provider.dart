import 'dart:convert';

import 'package:selfrenew_space/selfrenew_flutter.dart';

class FocusFormProvider extends ChangeNotifier {
  static final FocusRepository focusRepository = FocusRepository();

  late int targetTime = 0;
  late int shortRelaxTime = 0;
  late int longRelaxTime = 0;
  late int longRelaxInterval = 0;
  late int autoRelax = 0;
  late int skipRelax = 0;
  late String type = FocusType.tomato.name;
  late IconModel iconModel;

  TextEditingController titleEditingController = TextEditingController();

  // 重复
  late RepeatModel repeatModel;
  late FocusRemindModel remindModel;

  FocusRemindModel getFocusRemindModel() {
    return remindModel;
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

  String getTargetTimeText() {
    int minutes = getTargetTime();

    String text = '';
    int hours = minutes ~/ 60;
    if (hours > 0) {
      text += ('$hours小时');
    }

    int minute = getTargetTime() % 60;
    if (minute > 0) {
      text += ('$minute分');
    }

    return text;
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

  bool getSkipRelax() {
    return skipRelax == 1;
  }

  void updateAutoRelax(bool value) {
    if (value) {
      autoRelax = 1;
    } else {
      autoRelax = 0;
    }

    notifyListeners();
  }

  void updateSkipRelax(bool value) {
    if (value) {
      skipRelax = 1;
    } else {
      skipRelax = 0;
    }

    notifyListeners();
  }

  void newFocus(String type, String key) {
    if (ObjectUtil.isEmpty(key)) {
      titleEditingController.text = '';
    } else {
      for (TipChip tipChip in Global.getFocusChips()) {
        if (tipChip.value == key) {
          titleEditingController.text = tipChip.title;
        }
      }
    }

    targetTime = 300;
    shortRelaxTime = 300;
    longRelaxTime = 300;
    longRelaxInterval = 4;
    autoRelax = 0;
    skipRelax = 0;
    repeatModel = RepeatModel.defaultRepeatModel();
    remindModel = FocusRemindModel.defaultFocusRemindModel();

    if (type == FocusType.tomato.name) {
      iconModel = IconModel.defaultIconModel();
    } else if (type == FocusType.uptime.name) {
      iconModel = IconModel(
        color: '#dfe1e0',
        icon: 'assets/icons/uptime.svg',
      );
    } else if (type == FocusType.downtime.name) {
      iconModel = IconModel(
        color: '#dfe1e0',
        icon: 'assets/icons/downtime.svg',
      );
    }

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
    skipRelax = int.parse(mm['skipRelax'].toString());
    type = mm['type'].toString();

    iconModel = IconModel.toBean(jsonDecode(mm['icons'].toString()));
    remindModel = FocusRemindModel.defaultFocusRemindModel();
    notifyListeners();
  }

  void updateRepeatDay(List<int> values) {
    repeatModel.repeatDays = values;
    notifyListeners();
  }

  void updateRepeatType(int index) {
    repeatModel.type = index;
    notifyListeners();
  }
}
