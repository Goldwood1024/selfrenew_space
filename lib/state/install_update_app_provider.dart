import 'package:selfrenew_space/selfrenew_flutter.dart';

class InstallUpdateAppProvider extends ChangeNotifier {
  late bool showBoarding = false;

  Future<void> loadBoarding() async {
    dynamic value = await FileStorage.getKey('showBoarding');
    if (ObjectUtil.isEmpty(value)) {
      showBoarding = true;
    } else {
      showBoarding = value;
    }

    notifyListeners();
  }

  Future<void> updateBoarding(bool value) async {
    showBoarding = value;

    await FileStorage.setKey('showBoarding', value);
    notifyListeners();
  }

  bool getShowBoarding() {
    return showBoarding;
  }

  Future<bool> loadUpdate() async {
    dynamic value = await FileStorage.getKey('showUpdate');
    if (ObjectUtil.isEmpty(value)) {
      return true;
    } else {
      if (ConstPool.appVersion == value) {
        return false;
      }

      return true;
    }
  }

  Future<void> updateUpdate(String value) async {
    await FileStorage.setKey('showUpdate', value);
    notifyListeners();
  }
}
