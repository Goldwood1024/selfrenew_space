import 'package:selfrenew_space/selfrenew_flutter.dart';
import 'package:selfrenew_space/page/mobile/action/focus/form.dart';
import 'package:selfrenew_space/page/mobile/action/focus/home.dart';
import 'package:selfrenew_space/page/mobile/action/habit/form.dart';
import 'package:selfrenew_space/page/mobile/action/habit/icons.dart';
import 'package:selfrenew_space/page/mobile/action/habit/select.dart';

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
  static const String notification = "/notification";
  static const String habit = "/habit";
  static const String habitForm = "/habitForm";
  static const String habitSelect = "/habitSelect";
  static const String focusHome = "/focusHome";
  static const String focusForm = "/focusForm";
  static const String habitIcons = "/habitIcons";

  static GoRouter router = GoRouter(
    observers: [
      Statusbarz.instance.observer,
      FlutterSmartDialog.observer,
    ],
    routes: <GoRoute>[
      GoRoute(
        path: root,
        builder: (BuildContext context, GoRouterState state) {
          return const MobileHome();
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
      GoRoute(
        path: notification,
        builder: (BuildContext context, GoRouterState state) {
          return const NotificationSetting();
        },
      ),
      GoRoute(
        path: habit,
        builder: (BuildContext context, GoRouterState state) {
          return const HabitHome();
        },
      ),
      GoRoute(
        path: habitStatistics,
        builder: (BuildContext context, GoRouterState state) {
          return const HabitStatistics();
        },
      ),
      GoRoute(
        path: habitSelect,
        builder: (BuildContext context, GoRouterState state) {
          return const HabitSelect();
        },
      ),
      GoRoute(
        path: habitForm,
        builder: (BuildContext context, GoRouterState state) {
          return HabitForm(
            params: state.params,
          );
        },
      ),
      GoRoute(
        path: habitIcons,
        builder: (BuildContext context, GoRouterState state) {
          return const HabitIcons();
        },
      ),
      GoRoute(
        path: focusHome,
        builder: (BuildContext context, GoRouterState state) {
          return const FocusHome();
        },
      ),
      GoRoute(
        path: focusForm,
        builder: (BuildContext context, GoRouterState state) {
          return FocusForm(
            params: state.params,
          );
        },
      ),
    ],
  );

  static void go(String name) {
    router.push(name);
  }

  static void go4Params(String name, Map<String, String> params) {
    router.pushNamed(name, params: params);
  }

  static void pop() {
    router.pop();
  }
}
