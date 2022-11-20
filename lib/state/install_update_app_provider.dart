import 'package:selfrenew_space/selfrenew_flutter.dart';

class InstallUpdateAppProvider extends ChangeNotifier {
  late bool showBoarding = false;

  Future<void> loadBoarding() async {
    if (await FileStorage.hasFile(
      KeyPool.showBoarding,
      StorageType.applicationSupportDirectory,
    )) {
      showBoarding = false;
    } else {
      showBoarding = true;
    }

    notifyListeners();
  }

  Future<void> updateBoarding(bool value) async {
    showBoarding = value;
    notifyListeners();

    await FileStorage.create(
      KeyPool.showBoarding,
      StorageType.applicationSupportDirectory,
    );
  }

  bool getShowBoarding() {
    return showBoarding;
  }

  Future<bool> loadUpdate() async {
    if (await FileStorage.hasFile(
      KeyPool.showUpdate,
      StorageType.applicationSupportDirectory,
    )) {
      String value = await FileStorage.readAsData(
          KeyPool.showUpdate, StorageType.applicationSupportDirectory);
      if (ConstPool.appVersion == value) {
        return false;
      }

      return true;
    } else {
      return false;
    }
  }

  Future<void> updateUpdate(String value) async {
    await FileStorage.createAsData(
      KeyPool.showUpdate,
      value,
      StorageType.applicationSupportDirectory,
    );

    notifyListeners();
  }
}
