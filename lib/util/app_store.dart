import 'package:selfrenew_space/selfrenew_flutter.dart';

class AppStoreUtil {
  static openAppStore() {
    OpenStore.instance.open(
      appStoreId: ConstPool.iosAppId,
      appStoreIdMacOS: ConstPool.iosAppId,
    );
  }
}
