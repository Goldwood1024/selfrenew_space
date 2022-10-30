import 'package:selfrenew_space/selfrenew_flutter.dart';

class Notifications {
  static show(int id, String? title, String? body, String? payload) async {
    await OSNotifications.show(id, title, body, payload);
  }

  static showDefaultId(String? title, String? body, String? payload) async {
    await show(OSNotifications.getId(), title, body, payload);
  }

  static initNotification() async {
    // 初始化os通知
    await OSNotifications.init();

    Log.info('加载消息插件完成');
  }
}
