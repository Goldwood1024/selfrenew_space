class SleekCount {
  final double min;
  final double max;
  late double value;
  final bool fail;
  final int day;
  final DateTime dateTime;

  SleekCount({
    this.min = 0,
    this.max = 1,
    this.value = 0,
    this.fail = false,
    this.day = 1,
    required this.dateTime,
  });
}
