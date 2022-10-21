import 'package:selfrenew_space/export/selfrenew_flutter.dart';
import 'package:selfrenew_space/page/mobile/setting/theme.dart';

class Routers {
  static const String root = "/";
  static const String habitSkeleton = "/habitSkeleton";
  static const String tomatoTime = "/tomatoTime";
  static const String notFound = "/notFound";
  static const String promptTone = "/promptTone";
  static const String about = "/about";
  static const String habitStatistics = "/habitStatistics";
  static const String focusTimer = "/focusTimer";
  static const String themeSetting = "/themeSetting";

  static GoRouter router = GoRouter(
    observers: [
      Statusbarz.instance.observer,
      FlutterSmartDialog.observer,
    ],
    routes: <GoRoute>[
      GoRoute(
        path: root,
        builder: (BuildContext context, GoRouterState state) {
          return const Skeleton();
        },
      ),
      GoRoute(
        path: about,
        builder: (BuildContext context, GoRouterState state) {
          return const About();
        },
      ),
      GoRoute(
        path: themeSetting,
        builder: (BuildContext context, GoRouterState state) {
          return const ThemeSetting();
        },
      ),
    ],
  );

  static void go(String name) {
    router.push(name);
  }

  static void pop() {
    router.pop();
  }
}
