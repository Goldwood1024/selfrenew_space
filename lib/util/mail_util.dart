import 'package:flutter/widgets.dart';
import 'package:mailto/mailto.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MailUtil {
  static sendFeedBack2Developers(BuildContext context) async {
    String body = '''
    
        
    ------------
    ''';

    final mailtoLink = Mailto(
      to: ['2862379252@qq.com'],
      subject: '问题反馈或功能建议',
      body: body,
    );

    await launchUrlString('$mailtoLink');
  }
}
