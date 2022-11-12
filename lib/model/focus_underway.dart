class FocusUnderwayModel {
  final String id;
  late String title;
  late int targetTime;
  late int shortRelaxTime;
  late int longRelaxTime;
  late int longRelaxInterval;
  late int autoRelax;

  FocusUnderwayModel({
    required this.id,
    required this.title,
    this.targetTime = 0,
    this.shortRelaxTime = 300,
    this.longRelaxTime = 1200,
    this.longRelaxInterval = 4,
    this.autoRelax = 0,
  });
}
