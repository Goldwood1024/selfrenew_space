import 'package:fluent_ui/fluent_ui.dart';
import 'package:selfrenew_space/page-desktop/desktop_app.dart';
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
          child: PLUtil.isDesktop() ? const DesktopApp() : const MobileApp(),
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

class _MobileAppState extends State<MobileApp> {
  Size _getDesignSize() {
    return PLUtil.isIOS() ? const Size(375, 812) : const Size(360, 720);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: _getDesignSize(),
      builder: (BuildContext context, Widget? child) {
        Provider.of<AppSettingProvider>(context, listen: false).loadSystem();

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
