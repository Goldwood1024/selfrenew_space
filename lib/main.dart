import 'package:selfrenew_space/selfrenew_flutter.dart';

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
          child: const MobileApp(),
        ),
      ),
    ),
  );

  ManagerInitialization.after();
}

class MobileApp extends StatefulWidget {
  const MobileApp({super.key});

  @override
  State<StatefulWidget> createState() => _MobileAppState();
}

class _MobileAppState extends State<MobileApp> with WidgetsBindingObserver {
  Size _getDesignSize() {
    return PLUtil.isIOS() ? const Size(375, 812) : const Size(360, 720);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<AppSettingProvider>(context, listen: false).loadSystem();
    });
  }

  /// 生命周期变化时回调
  //  resumed:应用可见并可响应用户操作
  //  inactive:用户可见，但不可响应用户操作
  //  paused:已经暂停了，用户不可见、不可操作
  //  suspending：应用被挂起，此状态IOS永远不会回调
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: _getDesignSize(),
      builder: (BuildContext context, Widget? child) {
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
              S.delegate,
            ],
            routerConfig: Routers.router,
            restorationScopeId: 'MainApp',
          ),
        );
      },
    );
  }
}
