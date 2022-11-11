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
  late List<RepeatDay> repeatDays = [];
  late List<DateTime> selectedDates = [];
}

class IconModel {
  late String icon;
  late String color;

  static IconModel toBean(Map<dynamic, dynamic> values) {
    IconModel iconModel = IconModel();
    iconModel.color = values['color'].toString();
    iconModel.icon = values['icon'].toString();
    return iconModel;
  }
}
