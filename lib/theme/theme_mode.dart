import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';

class AppThemeMode {
  static ThemeData theme(BuildContext context) {
    AppSettingProvider provider = Provider.of(context);
    return FlexThemeData.light(
      primary: HexColor(provider.getAccentColor()),
      scaffoldBackground: CupertinoColors.systemGroupedBackground,
      background: CupertinoColors.systemBackground,
      useMaterial3: true,
      useMaterial3ErrorColors: true,
      appBarElevation: 0,
      appBarStyle: FlexAppBarStyle.background,
      appBarOpacity: 0,
      bottomAppBarElevation: 0,
      error: HexColor('#F53F3F'),
      textTheme: const TextTheme(
        labelSmall: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: Color.fromRGBO(28, 37, 32, 1), // 1C2520
          fontFeatures: [FontFeature.tabularFigures()],
        ),
        displayMedium: TextStyle(),
      ),
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    AppSettingProvider provider = Provider.of(context);

    return FlexThemeData.dark(
      primary: HexColor(provider.getAccentColor()),
      background: Colors.black,
      appBarElevation: 0,
      appBarStyle: FlexAppBarStyle.background,
      appBarOpacity: 0,
      bottomAppBarElevation: 0,
      textTheme: const TextTheme(
        labelSmall: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: Colors.white,
          // fontFeatures: [FontFeature.tabularFigures()],
        ),
        displayMedium: TextStyle(),
      ),
    );
  }
}
