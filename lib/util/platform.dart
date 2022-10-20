import 'package:selfrenew_space/export/selfrenew_flutter.dart';

class PLUtil {
  static bool isPortrait(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  static isAndroid() {
    return Platform.isAndroid;
  }

  static isIOS() {
    return Platform.isIOS;
  }

  static isFuchsia() {
    return Platform.isFuchsia;
  }

  static isMacOS() {
    return Platform.isMacOS;
  }

  static isLinux() {
    return Platform.isLinux;
  }

  static isWeb() {
    return kIsWeb;
  }

  static isWindows() {
    return Platform.isWindows;
  }

  static isDesktop() {
    return isMacOS() || isWindows() || isLinux() || isWeb() || isFuchsia();
  }

  static isApp() {
    return isIOS() || isAndroid();
  }
}
