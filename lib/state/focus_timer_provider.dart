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
    focusType = FocusType.uptime.name;
    timers = int.parse(mm['targetTime'].toString());
    relaxTimer = int.parse(mm['targetTime'].toString());
    autoRelax = int.parse(mm['autoRelax'].toString());
    countUp = false;
    infinityCountUp = false;

    notifyListeners();
  }
}
