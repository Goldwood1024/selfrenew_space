import 'package:selfrenew_space/selfrenew_flutter.dart';

class FocusTimerProvider extends ChangeNotifier {
  static final FocusRepository focusRepository = FocusRepository();

  late String title;
  late String focusType;
  late int timers;
  late int relaxTimer;
  late bool countUp;
  late int autoRelax;
  late bool infinityCountUp;

  Future<void> timer(Map<String, dynamic> params) async {
    Map<String, Object?> mm =
        await focusRepository.selectById(params['id'].toString());
    title = mm['title'].toString();
    focusType = mm['type'].toString();
    timers = int.parse(mm['targetTime'].toString());
    relaxTimer = int.parse(mm['targetTime'].toString());
    autoRelax = int.parse(mm['autoRelax'].toString());

    print(mm);
    if (focusType == FocusType.tomato.name) {
      countUp = false;
      infinityCountUp = false;
    } else if (focusType == FocusType.uptime.name) {
      countUp = true;
      infinityCountUp = false;
    } else if (focusType == FocusType.downtime.name) {
      countUp = false;
      infinityCountUp = false;
    }

    notifyListeners();
  }

  int getTimers() {
    return timers;
  }

  void reset() {
    timers = 0;
    relaxTimer = 0;
    autoRelax = 0;

    notifyListeners();
  }
}
