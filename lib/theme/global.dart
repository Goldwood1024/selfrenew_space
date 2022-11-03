import 'package:selfrenew_space/model/habit_lib.dart';

class Global {
  static final List<HabitLibModel> _habitLibs = [
    HabitLibModel(
      'water',
      '喝一杯水',
      'assets/icons/喝水.svg',
      '',
      '方法',
    ),
    HabitLibModel(
      'readbook',
      '阅读',
      'assets/icons/读书.svg',
      '',
      '方法',
    ),
    HabitLibModel(
      'ropeskipping',
      '阅读',
      'assets/icons/读书.svg',
      '',
      '方法',
    ),
  ];

  static List<HabitLibModel> getHabit(bool good) {
    List<HabitLibModel> list = [];

    for (HabitLibModel habitLibModel in _habitLibs) {
      if (habitLibModel.goodHabit == good) {
        list.add(habitLibModel);
      }
    }

    return list;
  }
}
