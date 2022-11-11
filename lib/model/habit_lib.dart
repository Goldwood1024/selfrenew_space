import 'package:selfrenew_space/model/repeat_day.dart';

class HabitLibModel {
  final String key;
  final String title;
  final String hearten;
  late bool goodHabit = true;
  late IconModel iconModel;

  HabitLibModel({
    required this.key,
    required this.title,
    required this.iconModel,
    required this.hearten,
  });
}
