import 'package:lifecycle/lifecycle.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';

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
      defaultLifecycleObserver,
    ],
    routes: <GoRoute>[
      GoRoute(
        path: root,
        builder: (BuildContext context, GoRouterState state) {
          return const MobileHome();
        },
      ),
      GoRoute(
        name: about,
        path: about,
        builder: (BuildContext context, GoRouterState state) {
          return const About();
        },
      ),
      GoRoute(
        name: themeSetting,
        path: themeSetting,
        builder: (BuildContext context, GoRouterState state) {
          return const ThemeSetting();
        },
      ),
      GoRoute(
        name: notification,
        path: notification,
        builder: (BuildContext context, GoRouterState state) {
          return const NotificationSetting();
        },
      ),
      GoRoute(
        name: habit,
        path: habit,
        builder: (BuildContext context, GoRouterState state) {
          return const HabitHome();
        },
      ),
      GoRoute(
        name: habitStatistics,
        path: habitStatistics,
        builder: (BuildContext context, GoRouterState state) {
          return const HabitStatistics();
        },
      ),
      GoRoute(
        name: habitSelect,
        path: habitSelect,
        builder: (BuildContext context, GoRouterState state) {
          return HabitLib(
            params: state.queryParams,
          );
        },
      ),
      GoRoute(
        name: habitForm,
        path: habitForm,
        builder: (BuildContext context, GoRouterState state) {
          return HabitForm(
            params: state.queryParams,
          );
        },
      ),
      GoRoute(
        name: habitIcons,
        path: habitIcons,
        builder: (BuildContext context, GoRouterState state) {
          return const HabitIcons();
        },
      ),
      GoRoute(
        name: focusHome,
        path: focusHome,
        builder: (BuildContext context, GoRouterState state) {
          return const FocusHome();
        },
      ),
      GoRoute(
        path: focusForm,
        builder: (BuildContext context, GoRouterState state) {
          return FocusForm(
            params: state.queryParams,
          );
        },
      ),
    ],
  );

  static void push(String name) {
    router.push(name);
  }

  static void pushParams(String name, Map<String, dynamic> queryParams) {
    router.pushNamed(name, queryParams: queryParams);
  }

  static void go(String name) {
    router.go(name);
  }

  static void goParams(String name, Map<String, dynamic> queryParams) {
    router.goNamed(name, queryParams: queryParams);
  }

  static void pop() {
    router.pop();
  }
}
