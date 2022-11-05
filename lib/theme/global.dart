import 'dart:math';

import 'package:selfrenew_space/model/habit_lib.dart';

class Global {
  static final Random _random = Random();
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

  static final List<String> heartens = [
    '我们总会拨云见日',
    '坚持每天进步一点点',
    '只要养成良好的习惯，就能改变我们的人生',
    '失败只有一种，那就是半途而废',
    '更好的事会一起到来',
  ];

  static String randomHearten() {
    return heartens[_random.nextInt(heartens.length)];
  }

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
