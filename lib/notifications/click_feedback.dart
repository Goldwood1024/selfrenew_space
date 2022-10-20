import 'package:selfrenew_space/export/selfrenew_flutter.dart';

// 震动反馈
class ClickFeedback {
  static Future<void> clickImpact() async {
    Vibrate.feedback(FeedbackType.impact);
  }

  static Future<void> successImpact() async {
    Vibrate.feedback(FeedbackType.success);
  }

  static Future<void> vibrate() async {
    await HapticFeedback.vibrate();
  }

  static Future<void> rulerSelectImpact() async {
    Vibrate.feedback(FeedbackType.selection);
  }
}
