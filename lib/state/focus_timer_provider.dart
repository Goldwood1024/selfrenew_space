import 'package:selfrenew_space/selfrenew_flutter.dart';

class FocusTimerProvider extends ChangeNotifier {
  static final FocusRepository focusRepository = FocusRepository();

  late String title;
  late String focusType;
  late int timers;
  late bool countUp;
  late bool infinityCountUp;

  Future<void> timer(Map<String, dynamic> params) async {
    Map<String, Object?> mm =
        await focusRepository.selectById(params['id'].toString());
    title = mm['title'].toString();
    focusType = FocusType.uptime.name;
    timers = int.parse(mm['shortRelaxTime'].toString()) * 60;
    countUp = false;
    infinityCountUp = false;

    notifyListeners();
  }
}
