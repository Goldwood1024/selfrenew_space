import 'package:selfrenew_space/selfrenew_flutter.dart';

class ManagerInitialization {
  static Future<void> before() async {
    // 控制屏幕方向
    await orientations();

    Log.info("准备处理数据库...");
    await SqliteProxy.openLocalDatabase();
  }

  static Future<void> after() async {
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
