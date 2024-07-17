import 'package:audioplayers/audioplayers.dart';
import 'package:music_player_app/core/resources/constants_value.dart';

class PlayMusicController {
  late int index;
  late AudioPlayer audioPlayer;
  late AudioCache audioCache;
  late Uri uri;

  PlayMusicController._internal(this.index);
  static PlayMusicController? instance;
  factory PlayMusicController(int index) {
    instance ??= PlayMusicController._internal(index);
    return instance!;
  }

  void play() async {
    uri = await audioCache.load(ConstantsValue().listAlhan[index].pathSong);

    audioPlayer.play(UrlSource(uri.toString()));
  }

  void stopAudio() {
    if (audioPlayer.state == PlayerState.playing) {
      audioPlayer.pause();
    } else if (audioPlayer.state == PlayerState.paused) {
      audioPlayer.resume();
    }
  }

  void displayAudio() {
    audioPlayer.dispose();
  }
}
