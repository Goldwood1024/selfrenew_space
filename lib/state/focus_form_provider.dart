import 'package:selfrenew_space/selfrenew_flutter.dart';

class FocusFormProvider extends ChangeNotifier {
  late int targetTime;
  late int shortRelaxTime;
  late int longRelaxTime;
  late int longRelaxInterval;
  late int autoRelax;

  int getTargetTime() {
    return targetTime ~/ 60;
  }

  void updateTargetTime(int value) {
    targetTime = value;
    notifyListeners();
  }

  int getShortRelaxTime() {
    return shortRelaxTime ~/ 60;
  }

  void updateShortRelaxTime(int value) {
    shortRelaxTime = value;
    notifyListeners();
  }

  int getLongRelaxTime() {
    return longRelaxTime ~/ 60;
  }

  void updateLongRelaxTime(int value) {
    longRelaxTime = value;
    notifyListeners();
  }

  int getLongRelaxInterval() {
    return longRelaxInterval;
  }

  void updateLongRelaxInterval(int value) {
    longRelaxInterval = value;
    notifyListeners();
  }

  bool getAutoRelax() {
    return autoRelax == 1;
  }

  void updateAutoRelax(bool value) {
    if (value) {
      autoRelax = 1;
    } else {
      autoRelax = 0;
    }

    notifyListeners();
  }

  void query() {
    targetTime = 300;
    shortRelaxTime = 300;
    longRelaxTime = 300;
    longRelaxInterval = 4;
    autoRelax = 0;
    notifyListeners();
  }
}
