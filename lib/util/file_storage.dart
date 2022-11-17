import 'package:get_storage/get_storage.dart';

class FileStorage {
  static dynamic getKey(String key) {
    return GetStorage().read(key);
  }

  static Future<void> setKey(String key, dynamic value) async {
    GetStorage().remove(key);
    await GetStorage().writeIfNull(key, value);
  }
}
