import 'package:audioplayers/audioplayers.dart';
import 'package:music_player_app/core/resources/constants_value.dart';

class PlayMusicController {
  late int index;
  late AudioPlayer audioPlayer;
  late AudioCache audioCache;
  PlayMusicController(this.index) {
    audioPlayer = AudioPlayer();
    audioCache = AudioCache(prefix: '');
  }

  void play() async {
    Uri uri = await audioCache.load(ConstantsValue().listAlhan[index].pathSong);

    audioPlayer.play(UrlSource(uri.toString()));
  }

  void displayAudio() {
    audioPlayer.dispose();
  }
}
