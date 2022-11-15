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
    required this.id,
    required this.title,
    required this.iconModel,
    required this.targetTime,
    required this.shortRelaxTime,
    required this.longRelaxTime,
    required this.longRelaxInterval,
    required this.autoRelax,
    required this.type,
  });
}
