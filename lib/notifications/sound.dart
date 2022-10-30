import 'package:selfrenew_space/selfrenew_flutter.dart';

class SoundNotifications {
  static AudioPlayer createAudioPlayer() {
    return AudioPlayer()..setVolume(1.0);
  }

  static Future<void> play(String source) async {
    await createAudioPlayer().play(AssetSource(source));
  }

  static void player() {
    play('voice/bells.mp3');
  }
}
