import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:selfrenew_space/selfrenew_flutter.dart';

class AppThemeMode {
  static ThemeData lightTheme(BuildContext context) {
    AppSettingProvider provider = Provider.of(context);

    return ThemeData().copyWith(
      primaryColor: HexColor(provider.getAccentColor()),
      scaffoldBackgroundColor: CupertinoColors.systemGroupedBackground,
      backgroundColor: CupertinoColors.systemBackground,
      useMaterial3: true,
      appBarTheme: const AppBarTheme().copyWith(
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      textTheme: const TextTheme().copyWith(
        labelSmall: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: Color.fromRGBO(28, 37, 32, 1),
          fontFeatures: [FontFeature.tabularFigures()],
        ),
        labelLarge: const TextStyle(
          color: Color.fromRGBO(28, 37, 32, 1),
          fontFeatures: [FontFeature.tabularFigures()],
        ),
      ),
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    AppSettingProvider provider = Provider.of(context);

    return ThemeData().copyWith(
      primaryColor: HexColor(provider.getAccentColor()),
      scaffoldBackgroundColor: HexColor('000000'),
      backgroundColor: HexColor('1F1F1F'),
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      textTheme: const TextTheme(
        labelSmall: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: Colors.white,
          fontFeatures: [FontFeature.tabularFigures()],
        ),
      ),
    );
  }
}
