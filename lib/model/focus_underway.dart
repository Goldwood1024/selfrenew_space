import 'package:selfrenew_space/model/repeat_day.dart';

class FocusUnderwayModel {
  final String id;
  late String title;
  late int targetTime;
  late String type;
  late int shortRelaxTime;
  late int longRelaxTime;
  late int longRelaxInterval;
  late int autoRelax;
  late IconModel iconModel;

  FocusUnderwayModel({
    this.id = '',
    this.title = '',
    required this.iconModel,
    this.targetTime = 0,
    this.shortRelaxTime = 0,
    this.longRelaxTime = 0,
    this.longRelaxInterval = 0,
    this.autoRelax = 0,
    this.type = '',
  });
}
