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
