import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/export/selfrenew_flutter.dart';

class AppThemeMode {
  static ThemeData theme() {
    return FlexThemeData.light(
      primary: HexColor('#165DFF'),
      secondary: HexColor('#0E42D2'),
      scaffoldBackground: CupertinoColors.systemBackground,
      background: CupertinoColors.systemGrey6,
      useMaterial3: true,
      useMaterial3ErrorColors: true,
      appBarElevation: 0,
      // appBarBackground: HexColor('#0E42D2'),
      appBarStyle: FlexAppBarStyle.primary,
      appBarOpacity: 1,
      bottomAppBarElevation: 0,
      error: HexColor('#F53F3F'),
      subThemesData: const FlexSubThemesData(
        defaultRadius: 8.0,
        dialogElevation: 0.0,
        appBarCenterTitle: true,
        navigationBarHeight: 180.0,
      ),
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

  static ThemeData darkTheme() {
    return FlexThemeData.dark(
      primary: HexColor('#165DFF'),
      scaffoldBackground: CupertinoColors.white,
      background: CupertinoColors.systemGrey6,
      appBarElevation: 0,
      useMaterial3: true,
      useMaterial3ErrorColors: true,
      appBarBackground: Colors.white,
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
