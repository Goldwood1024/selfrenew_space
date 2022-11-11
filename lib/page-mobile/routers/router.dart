import 'package:flutter/cupertino.dart';
import 'package:lifecycle/lifecycle.dart';
import 'package:selfrenew_space/page-mobile/action/focus/relax.dart';
import 'package:selfrenew_space/page-mobile/onboarding/boarding_screen.dart';
import 'package:selfrenew_space/page-mobile/onboarding/update.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';

class Routers {
  static const String root = "/";
  static const String mobileHome = "/mobileHome";
  static const String update = "/update";
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
  static const String focusRelax = "/focusRelax";

  static GoRouter router = GoRouter(
    observers: [
      Statusbarz.instance.observer,
      FlutterSmartDialog.observer,
      defaultLifecycleObserver,
    ],
    routes: <GoRoute>[
      GoRoute(
        name: 'root',
        path: root,
        builder: (BuildContext context, GoRouterState state) {
          return const BoardingScreen();
        },
      ),
      GoRoute(
        name: removePrefix(mobileHome),
        path: mobileHome,
        builder: (BuildContext context, GoRouterState state) {
          return const MobileHome();
        },
      ),
      GoRoute(
        name: removePrefix(update),
        path: update,
        builder: (BuildContext context, GoRouterState state) {
          return const Update();
        },
      ),
      GoRoute(
        name: removePrefix(about),
        path: about,
        builder: (BuildContext context, GoRouterState state) {
          return const About();
        },
      ),
      GoRoute(
        name: removePrefix(themeSetting),
        path: themeSetting,
        builder: (BuildContext context, GoRouterState state) {
          return const ThemeSetting();
        },
      ),
      GoRoute(
        name: removePrefix(notification),
        path: notification,
        builder: (BuildContext context, GoRouterState state) {
          return const NotificationSetting();
        },
      ),
      GoRoute(
        name: removePrefix(habit),
        path: habit,
        builder: (BuildContext context, GoRouterState state) {
          return const HabitHome();
        },
      ),
      GoRoute(
        name: removePrefix(habitStatistics),
        path: habitStatistics,
        builder: (BuildContext context, GoRouterState state) {
          return const HabitStatistics();
        },
      ),
      GoRoute(
        name: removePrefix(habitSelect),
        path: habitSelect,
        builder: (BuildContext context, GoRouterState state) {
          return HabitLib(params: state.queryParams);
        },
      ),
      GoRoute(
        name: removePrefix(habitForm),
        path: habitForm,
        builder: (BuildContext context, GoRouterState state) {
          return HabitForm(params: state.queryParams);
        },
      ),
      GoRoute(
        name: removePrefix(habitIcons),
        path: habitIcons,
        builder: (BuildContext context, GoRouterState state) {
          return const HabitIcons();
        },
      ),
      GoRoute(
        name: removePrefix(focusHome),
        path: focusHome,
        builder: (BuildContext context, GoRouterState state) {
          return const FocusHome();
        },
      ),
      GoRoute(
        name: removePrefix(focusForm),
        path: focusForm,
        builder: (BuildContext context, GoRouterState state) {
          return FocusForm(params: state.queryParams);
        },
      ),
      GoRoute(
        name: removePrefix(focusTimer),
        path: focusTimer,
        builder: (BuildContext context, GoRouterState state) {
          return FocusTimer(params: state.queryParams);
        },
      ),
      GoRoute(
        name: removePrefix(focusRelax),
        path: focusRelax,
        builder: (BuildContext context, GoRouterState state) {
          return FocusRelax(params: state.queryParams);
        },
      ),
    ],
  );

  static void push(String name) {
    pushParams(name, {});
  }

  static void pushParams(String name, Map<String, Object> queryParams) {
    router.pushNamed(removePrefix(name), queryParams: queryParams);
  }

  static void go(String name) {
    goParams(name, {});
  }

  static void goParams(String name, Map<String, Object> queryParams) {
    router.goNamed(removePrefix(name), queryParams: queryParams);
  }

  static void pop() {
    router.pop();
  }

  static String removePrefix(String path) {
    if (path == root) {
      return 'root';
    }
    return path.substring(1, path.length);
  }
}
