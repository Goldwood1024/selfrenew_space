import 'package:selfrenew_space/selfrenew_flutter.dart';

class FocusTimerProvider extends ChangeNotifier {
  late String title;
  late String focusType;
  late int timers;
  late bool countUp;
  late bool infinityCountUp;

  void timer(Map<String, dynamic> params) {
    title = '11';
    focusType = FocusType.uptime.name;
    timers = 10;

    countUp = false;
    infinityCountUp = false;
    notifyListeners();
  }
}
