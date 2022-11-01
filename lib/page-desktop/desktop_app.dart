import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:selfrenew_space/theme/hex_color.dart';

import 'routers/router.dart';

class DesktopApp extends StatefulWidget {
  const DesktopApp({super.key});

  @override
  State<StatefulWidget> createState() => _DesktopAppState();
}

class _DesktopAppState extends State<DesktopApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1200, 800),
      builder: (BuildContext context, Widget? child) {
        return FluentApp.router(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.system,
          theme: ThemeData().copyWith(),
          routeInformationParser: DesktopRouters.router.routeInformationParser,
          routerDelegate: DesktopRouters.router.routerDelegate,
          color: HexColor('#165DFF'),
        );
      },
    );
  }
}
