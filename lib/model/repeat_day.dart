import 'dart:convert';

import 'package:selfrenew_space/common/common_enum.dart';

class RepeatDay {
  final String day;
  final String value;
  late bool selected;

  RepeatDay({
    required this.day,
    required this.value,
    this.selected = true,
  });
}

class RepeatModel {
  late int type = 1;
  late List<int> repeatDays = [];
  late List<DateTime> selectedDates = [];

  static RepeatModel defaultRepeatModel() {
    RepeatModel repeatModel = RepeatModel();
    repeatModel.type = 0;
    repeatModel.repeatDays.addAll([1, 2, 3, 4, 5, 6, 7]);
    return repeatModel;
  }

  static RepeatModel toBean(Map<dynamic, dynamic> values) {
    RepeatModel repeatModel = RepeatModel();
    repeatModel.type = int.parse(values['type'].toString());

    List<int> list = [];
    for (int a in jsonDecode(values['repeatDays'].toString())) {
      list.add(a);
    }

    repeatModel.repeatDays = list;
    repeatModel.selectedDates = [];
    return repeatModel;
  }
}

class IconModel {
  late String icon;
  late String color;

  IconModel({
    required this.color,
    required this.icon,
  });

  static IconModel defaultIconModel() {
    return IconModel(color: '#f3f5f5', icon: 'assets/icons/timer.svg');
  }

  static IconModel toBean(Map<dynamic, dynamic> values) {
    return IconModel(
      color: values['color'].toString(),
      icon: values['icon'].toString(),
    );
  }
}

class TargetModel {
  late double min = 0;
  late double max = 1;
  late double value;
  late double clickCount;
  late TargetEnum type;

  TargetModel({
    required this.min,
    required this.max,
    required this.value,
    required this.clickCount,
    this.type = TargetEnum.day,
  });

  static TargetModel defaultTargetModel() {
    return TargetModel(
      min: 0,
      max: 1,
      value: 0,
      type: TargetEnum.day,
      clickCount: 1,
    );
  }

  static TargetModel toBean(Map<dynamic, dynamic> values) {
    return TargetModel(
      min: double.parse(values['min'].toString()),
      max: double.parse(values['max'].toString()),
      value: double.parse(values['value'].toString()),
      clickCount: double.parse(values['clickCount'].toString()),
    );
  }
}

class FocusRemindModel {
  late String completedMusic;
  late String relaxdMusic;
  late int feedback;

  FocusRemindModel({
    required this.completedMusic,
    required this.relaxdMusic,
    required this.feedback,
  });

  static FocusRemindModel defaultFocusRemindModel() {
    return FocusRemindModel(
      completedMusic: '',
      relaxdMusic: '',
      feedback: 0,
    );
  }

  static FocusRemindModel toBean(Map<dynamic, dynamic> values) {
    return FocusRemindModel(
      completedMusic: values['completedMusic'].toString(),
      relaxdMusic: values['relaxdMusic'].toString(),
      feedback: int.parse(values['feedback'].toString()),
    );
  }
}
