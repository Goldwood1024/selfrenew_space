import 'dart:convert';

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
    return IconModel(color: '#f3f5f5', icon: 'assets/icons/question.svg');
  }

  static IconModel toBean(Map<dynamic, dynamic> values) {
    return IconModel(
      color: values['color'].toString(),
      icon: values['icon'].toString(),
    );
  }
}
