import 'package:selfrenew_space/export/selfrenew_flutter.dart';

class Cache {
  static put(String key, String value) async {
    await (await SharedPreferences.getInstance()).setString(key, value);
  }

  static get(String key) async {
    return (await SharedPreferences.getInstance()).getString(key);
  }

  static delete(String key) async {
    await (await SharedPreferences.getInstance()).remove(key);
  }

  static hasKey(String key) async {
    return (await SharedPreferences.getInstance()).containsKey(key);
  }

  static clear() async {
    (await SharedPreferences.getInstance()).clear();
  }
}
