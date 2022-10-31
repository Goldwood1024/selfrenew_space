import 'package:selfrenew_space/selfrenew_flutter.dart';

class AppSettingProvider extends ChangeNotifier {
  late bool init = false;
  late String accentColor = '';
  static final Repository appSettingRepository = Repository();

  String getAccentColor() {
    return accentColor == '' ? '165DFF' : accentColor;
  }

  Future<void> read() async {
    if (init) {
      return;
    }

    Map<String, Object?> mm = await appSettingRepository.query();
    accentColor = mm['accentColor'].toString();

    init = true;
    notifyListeners();
  }
}
