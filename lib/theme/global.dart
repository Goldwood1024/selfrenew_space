import 'dart:math';

import 'package:selfrenew_space/model/notice.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';

class Global {
  static final Random _random = Random();
  static final List<HabitLibModel> _habitLibs = [
    HabitLibModel(
      key: 'water',
      title: '喝一杯水',
      iconModel: IconModel(color: '#1e7069', icon: 'assets/icons/喝水.svg'),
      hearten: '我们总会拨云见日',
    ),
    HabitLibModel(
      key: 'fitness',
      title: '健身',
      iconModel: IconModel(color: '#d4896a', icon: 'assets/icons/健身.svg'),
      hearten: '更好的事会一起到来',
    ),
    HabitLibModel(
      key: 'readbook',
      title: '阅读',
      iconModel: IconModel(color: '#730517', icon: 'assets/icons/读书.svg'),
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

  static final List<TipChip> chips = [
    TipChip(
      value: 'working',
      title: '工作',
      image: 'assets/icons/工作.svg',
      type: FocusType.tomato.name,
    ),
    TipChip(
      value: 'read',
      title: '阅读',
      image: 'assets/icons/读书.svg',
      type: FocusType.tomato.name,
    ),
  ];

  static List<NoticeSound> audioLibrary = [
    NoticeSound(
      id: '0',
      title: '无',
      selected: false,
      canSelect: true,
      source: '',
    ),
    NoticeSound(
      id: '8356',
      title: '水滴',
      selected: false,
      canSelect: true,
      source: 'voice/8356.mp3',
    ),
    NoticeSound(
      id: '15275',
      title: '叮',
      selected: false,
      canSelect: true,
      source: 'voice/15275.mp3',
    ),
    NoticeSound(
      id: 'blister',
      title: '水泡',
      selected: false,
      canSelect: true,
      source: 'voice/blister.mp3',
    ),
    NoticeSound(
      id: 'bells',
      title: '贝壳风铃',
      selected: false,
      canSelect: true,
      source: 'voice/bells.mp3',
    ),
    NoticeSound(
      id: 'copper',
      title: '铜铃',
      selected: false,
      canSelect: true,
      source: 'voice/copper.mp3',
    ),
    NoticeSound(
      id: 'chirp',
      title: '鸟叫',
      selected: false,
      canSelect: true,
      source: 'voice/chirp.mp3',
    ),
    NoticeSound(
      id: '20181214141346',
      title: '快门',
      selected: false,
      canSelect: true,
      source: 'voice/20181214141346.mp3',
    ),
    NoticeSound(
      id: '20190108114811',
      title: '烟花',
      selected: false,
      canSelect: true,
      source: 'voice/20190108114811.mp3',
    ),
    NoticeSound(
      id: '20181219134834',
      title: '惊喜',
      selected: false,
      canSelect: true,
      source: 'voice/20181219134834.mp3',
    ),
    NoticeSound(
      id: '20190107141854',
      title: '滴滴滴',
      selected: false,
      canSelect: true,
      source: 'voice/20190107141854.wav',
    ),
    NoticeSound(
      id: '20190108150302',
      title: '弹一下',
      selected: false,
      canSelect: true,
      source: 'voice/20190108150302.wav',
    ),
    NoticeSound(
      id: '13277',
      title: '背景音',
      selected: false,
      canSelect: false,
      source: 'voice/13277.mp3',
    ),
  ];

  static List<NoticeSound> getAudioLibraries() {
    List<NoticeSound> list = [];
    for (NoticeSound sound in audioLibrary) {
      if (sound.canSelect) {
        list.add(sound);
      }
    }

    return list;
  }

  static List<TipChip> getTipChips() {
    List<TipChip> chips = [];
    List<HabitLibModel> list = getHabit(true);
    for (int i = 0; i < 3; i++) {
      HabitLibModel model = list[i];
      chips.add(
        TipChip(
          value: model.key,
          title: model.title,
          image: model.iconModel.icon,
        ),
      );
    }
    return chips;
  }

  static List<TipChip> getFocusChips() {
    return chips;
  }

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
