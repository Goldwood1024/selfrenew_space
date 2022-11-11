import 'dart:math';

import 'package:selfrenew_space/model/habit_lib.dart';
import 'package:selfrenew_space/model/repeat_day.dart';

class Global {
  static final Random _random = Random();
  static final List<HabitLibModel> _habitLibs = [
    HabitLibModel(
      key: 'water',
      title: '喝一杯水',
      iconModel: IconModel(color: '#000000', icon: 'assets/icons/喝水.svg'),
      hearten: '我们总会拨云见日',
    ),
    HabitLibModel(
      key: 'fitness',
      title: '健身',
      iconModel: IconModel(color: '#000000', icon: 'assets/icons/健身.svg'),
      hearten: '更好的事会一起到来',
    ),
    HabitLibModel(
      key: 'readbook',
      title: '阅读',
      iconModel: IconModel(color: '#000000', icon: 'assets/icons/读书.svg'),
      hearten: '只要养成良好的习惯，就能改变我们的人生',
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
