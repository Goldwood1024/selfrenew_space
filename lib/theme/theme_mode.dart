import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';

class AppThemeMode {
  static ThemeData theme(BuildContext context) {
    AppSettingProvider provider = Provider.of(context);
    return FlexThemeData.light(
      primary: HexColor(provider.getAccentColor()),
      secondary: HexColor('#0E42D2'),
      useMaterial3: true,
      useMaterial3ErrorColors: true,
      appBarElevation: 0,
      appBarStyle: FlexAppBarStyle.background,
      appBarOpacity: 0,
      bottomAppBarElevation: 0,
      error: HexColor('#F53F3F'),
      // subThemesData: const FlexSubThemesData(
      //   defaultRadius: 8.0,
      //   dialogElevation: 0.0,
      // ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 56.0,
          fontWeight: FontWeight.w400,
          color: Color.fromRGBO(28, 37, 32, 1), // 1C2520
          fontFeatures: [FontFeature.tabularFigures()],
        ),
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
      appBarElevation: 0,
      appBarStyle: FlexAppBarStyle.background,
      appBarOpacity: 0,
      bottomAppBarElevation: 0,
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 56.0,
          fontWeight: FontWeight.w400,
          color: Color.fromRGBO(28, 37, 32, 1), // 1C2520
          // fontFeatures: [FontFeature.tabularFigures()],
        ),
        labelSmall: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: Color.fromRGBO(28, 37, 32, 1), // 1C2520
          // fontFeatures: [FontFeature.tabularFigures()],
        ),
        displayMedium: TextStyle(),
      ),
    );
  }
}
