import 'package:selfrenew_space/export/selfrenew_flutter.dart';

class ManagerInitialization {
  static Future<void> runAppBefore() async {
    // Log.info("准备处理数据库...");
    // await SqliteStorage.openLocalDatabase();

    // 控制屏幕方向
    await orientations();
  }

  static Future<void> runAppAfter() async {
    Log.info("设置默认配置...");

    // 通知初始化
    await Notifications.initNotification();
  }

  static orientations() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }
}
