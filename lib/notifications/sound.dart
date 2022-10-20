import 'package:selfrenew_space/export/selfrenew_flutter.dart';

class SoundNotifications {
  static AudioPlayer createAudioPlayer() {
    return AudioPlayer()..setVolume(1.0);
  }
}
