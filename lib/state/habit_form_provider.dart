import 'package:selfrenew_space/dao/habit/repository.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';

class HabitFormProvider extends ChangeNotifier {
  static final HabitRepository habitRepository = HabitRepository();

  late String title;
  late String icons;
  late String repeat;
  late String target;
  late String remind;
  late String hearten;
  late String startDate;
}
