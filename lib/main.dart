import 'package:fluent_ui/fluent_ui.dart';
import 'package:selfrenew_space/page-desktop/desktop_home.dart';
import 'package:selfrenew_space/page-mobile/routers/router.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';
import 'package:statsfl/statsfl.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  ManagerInitialization.runAppBefore();

  handleError(
    () => runApp(
      ManagerProvider(
        child: StatsFl(
          isEnabled: false,
          width: 300,
          height: 120,
          align: Alignment.center,
          child: const MainApp(),
        ),
      ),
    ),
  );

  ManagerInitialization.runAppAfter();
}

// 主页配置
class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
  }

  Size _getDesignSize() {
    return PLUtil.isIOS() ? const Size(375, 812) : const Size(360, 720);
  }

  @override
  Widget build(BuildContext context) {
    return PLUtil.isDesktop()
        ? ScreenUtilInit(
            // 设计稿大小
            designSize: const Size(1200, 800),
            builder: (BuildContext context, Widget? child) {
              return FluentApp(
                debugShowCheckedModeBanner: false,
                initialRoute: '/',
                routes: {
                  '/': (_) {
                    return const DesktopHome();
                  },
                },
              );
            },
          )
        : ScreenUtilInit(
            // 设计稿大小
            designSize: _getDesignSize(),
            builder: (BuildContext context, Widget? child) {
              return StatusbarzCapturer(
                child: MaterialApp.router(
                  builder: FlutterSmartDialog.init(),
                  debugShowCheckedModeBanner: false,
                  theme: AppThemeMode.theme(),
                  darkTheme: AppThemeMode.darkTheme(),
                  themeMode: ThemeMode.system,
                  // 国际化
                  supportedLocales: S.delegate.supportedLocales,
                  localizationsDelegates: const [
                    GlobalMaterialLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    S.delegate
                  ],
                  routerConfig: Routers.router,
                  restorationScopeId: 'MainApp',
                ),
              );
            },
          );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
