import 'package:fluent_ui/fluent_ui.dart';
import 'package:selfrenew_space/page-desktop/desktop_home.dart';
import 'package:selfrenew_space/page-mobile/routers/router.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';
import 'package:statsfl/statsfl.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  await ManagerInitialization.before();

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

  ManagerInitialization.after();
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

  @override
  Widget build(BuildContext context) {
    return PLUtil.isDesktop() ? const DesktopApp() : const MobileApp();
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class MobileApp extends StatefulWidget {
  const MobileApp({super.key});

  @override
  State<StatefulWidget> createState() => _MobileAppState();
}

class _MobileAppState extends State<MobileApp> {
  Size _getDesignSize() {
    return PLUtil.isIOS() ? const Size(375, 812) : const Size(360, 720);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: _getDesignSize(),
      builder: (BuildContext context, Widget? child) {
        Provider.of<AppSettingProvider>(context, listen: false).read();

        return StatusbarzCapturer(
          child: MaterialApp.router(
            builder: FlutterSmartDialog.init(),
            debugShowCheckedModeBanner: false,
            theme: AppThemeMode.lightTheme(context),
            darkTheme: AppThemeMode.darkTheme(context),
            themeMode: Provider.of<AppSettingProvider>(context).getThemeMode(),
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
}

class DesktopApp extends StatefulWidget {
  const DesktopApp({super.key});

  @override
  State<StatefulWidget> createState() => _DesktopAppState();
}

class _DesktopAppState extends State<DesktopApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
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
    );
  }
}
