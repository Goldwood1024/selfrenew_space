import 'package:selfrenew_space/selfrenew_flutter.dart';

class AppSettingProvider extends ChangeNotifier {
  static final Repository appSettingRepository = Repository();

  late bool init = false;
  late String accentColor = '';
  late ThemeMode themeMode = ThemeMode.system;

  String getAccentColor() {
    return accentColor == '' ? '#165DFF' : accentColor;
  }

  Future<void> updateAccentColor(String color) async {
    accentColor = color;

    await appSettingRepository.update('accentColor', accentColor);
    notifyListeners();
  }

  ThemeMode getThemeMode() {
    return themeMode;
  }

  Future<void> updateThemeMode(String theme) async {
    if (theme == 'light') {
      themeMode = ThemeMode.light;
    } else if (theme == 'dark') {
      themeMode = ThemeMode.dark;
    } else {
      themeMode = ThemeMode.system;
    }

    await appSettingRepository.update('theme', theme);
    notifyListeners();
  }

  Future<void> read() async {
    if (init) {
      return;
    }

    Map<String, Object?> mm = await appSettingRepository.query();
    accentColor = '${mm['accentColor']}';

    String theme = '${mm['theme']}';
    if (theme == 'light') {
      themeMode = ThemeMode.light;
    } else if (theme == 'dark') {
      themeMode = ThemeMode.dark;
    } else {
      themeMode = ThemeMode.system;
    }

    init = true;
    notifyListeners();
  }
}
