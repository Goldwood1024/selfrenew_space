import 'package:selfrenew_space/dao/habit/repository.dart';
import 'package:selfrenew_space/model/focus_underway.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';

class FocusProvider extends ChangeNotifier {
  static final HabitRepository habitRepository = HabitRepository();

  bool hasUnderway() {
    return true;
  }

  List<FocusUnderwayModel> getFocusUnderway() {
    List<FocusUnderwayModel> list = [];

    list.add(FocusUnderwayModel(
      '33',
      '番茄钟',
      'assets/icons/timer.svg',
      '每天',
      [],
      [],
    ));

    return list;
  }
}
