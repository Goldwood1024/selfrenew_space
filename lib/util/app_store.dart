import 'package:selfrenew_space/selfrenew_flutter.dart';

class AppStoreUtil {
  static openAppStore() {
    OpenStore.instance.open(
      appStoreId: ConstPool.iosAppId,
      appStoreIdMacOS: ConstPool.iosAppId,
    );
  }

  static openWebsite() async {
    await launchUrlString(
      'https://selfrenew.space',
      mode: LaunchMode.externalApplication,
    );
  }
}
