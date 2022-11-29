import 'package:selfrenew_space/selfrenew_flutter.dart';
import 'package:selfrenew_space/util/cache.dart';

class InstallUpdateAppProvider extends ChangeNotifier {
  late bool showBoarding = false;

  Future<void> loadBoarding() async {
    dynamic showBoarding = await CacheUtil.get('showBoarding');
    if (ObjectUtil.isNotEmpty(showBoarding)) {
      showBoarding = false;
      return;
    }

    await CacheUtil.put('showBoarding', 'showBoarding');

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
    dynamic updatePage = await CacheUtil.get('updatePage');
    if (ObjectUtil.isNotEmpty(updatePage)) {
      return false;
    }

    await CacheUtil.put('updatePage', 'updatePage');

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
