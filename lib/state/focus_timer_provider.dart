import 'package:selfrenew_space/selfrenew_flutter.dart';

class FocusTimerProvider extends ChangeNotifier {
  static final FocusRepository focusRepository = FocusRepository();

  late String id;
  late String title;
  late String focusType = '';
  late int timers;
  late int shortRelaxTime;
  late int longRelaxTime;
  late int longRelaxInterval;
  late bool countUp;
  late int autoRelax;
  late int skipRelax;
  late bool infinityCountUp;

  Future<void> timer(Map<String, dynamic> params) async {
    Map<String, Object?> mm =
        await focusRepository.selectById(params['id'].toString());
    id = mm['id'].toString();
    title = mm['title'].toString();
    focusType = mm['type'].toString();
    timers = int.parse(mm['targetTime'].toString());
    shortRelaxTime = int.parse(mm['shortRelaxTime'].toString());
    longRelaxTime = int.parse(mm['longRelaxTime'].toString());
    longRelaxInterval = int.parse(mm['longRelaxInterval'].toString());
    autoRelax = int.parse(mm['autoRelax'].toString());
    skipRelax = int.parse(mm['skipRelax'].toString());

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
    id = '';
    timers = 0;
    autoRelax = 0;
    skipRelax = 0;

    notifyListeners();
  }
}
