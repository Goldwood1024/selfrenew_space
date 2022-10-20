import 'package:selfrenew_space/export/selfrenew_flutter.dart';

void main() {
  handleError(() => runApp(const ManagerProvider(child: MainApp())));
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
    return PLUtil.isDesktop()
        ? const Size(800, 600)
        : (PLUtil.isIOS() ? const Size(375, 812) : const Size(360, 720));
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // 设计稿大小
      designSize: _getDesignSize(),
      builder: (BuildContext context, Widget? child) {
        return StatusbarzCapturer(
          child: MaterialApp.router(
            builder: FlutterSmartDialog.init(),
            debugShowCheckedModeBanner: false,
            showPerformanceOverlay: false,
            // theme: LightTheme.theme(),
            // darkTheme: DarkTheme.theme(),
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
