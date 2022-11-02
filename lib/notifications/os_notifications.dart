import 'package:selfrenew_space/selfrenew_flutter.dart';

// 系统通知
class OSNotifications {
  static int _id = 0;

  static getId() {
    return _id++;
  }

  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static DarwinInitializationSettings _initMacOSInitializationSettings() {
    const DarwinInitializationSettings initializationSettingsMacOS =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );
    return initializationSettingsMacOS;
  }

  static DarwinInitializationSettings _initIOSInitializationSettings() {
    final DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
      onDidReceiveLocalNotification:
          (int id, String? title, String? body, String? payload) async {
        Log.info('onDidReceiveLocalNotification');
      },
    );

    return initializationSettingsIOS;
  }

  static AndroidInitializationSettings _initAndroidInitializationSettings() {
    return AndroidInitializationSettings(ConstPool.appLogo);
  }

  static LinuxInitializationSettings _linuxInitializationSettings() {
    return const LinuxInitializationSettings(defaultActionName: 'focus');
  }

  static InitializationSettings initializationSettings() {
    return InitializationSettings(
      android: _initAndroidInitializationSettings(),
      iOS: _initIOSInitializationSettings(),
      macOS: _initMacOSInitializationSettings(),
      linux: _linuxInitializationSettings(),
    );
  }

  static init() async {
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings());
  }

  static LinuxNotificationDetails _linuxNotificationDetails() {
    return const LinuxNotificationDetails();
  }

  static DarwinNotificationDetails _macOSNotificationDetails() {
    return const DarwinNotificationDetails();
  }

  static AndroidNotificationDetails _androidNotificationDetails() {
    return const AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      channelDescription: 'your channel description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
  }

  static DarwinNotificationDetails _iosNotificationDetails() {
    return const DarwinNotificationDetails(
      badgeNumber: 0,
    );
  }

  static NotificationDetails notificationDetails() {
    return NotificationDetails(
      android: _androidNotificationDetails(),
      iOS: _iosNotificationDetails(),
      linux: _linuxNotificationDetails(),
      macOS: _macOSNotificationDetails(),
    );
  }

  static show(int id, String? title, String? body, String? payload) async {
    await _flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails(),
      payload: payload,
    );
  }
}
