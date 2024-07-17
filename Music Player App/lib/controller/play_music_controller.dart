import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:music_player_app/core/resources/constants_value.dart';

class PlayMusicController {
  late int index;
  late AudioPlayer audioPlayer;
  late AudioCache audioCache;
  late StreamController<bool> playStatusStreamController;
  late Sink<bool> playStatusInputData;
  late Stream<bool> playStatusOutputData;
  late Uri uri;
  late bool isPlaying;

  PlayMusicController._internal(this.index) {
    audioCache = AudioCache(prefix: '');
    audioPlayer = AudioPlayer();
    playStatusStreamController = StreamController<bool>();
    playStatusInputData = playStatusStreamController.sink;
    playStatusOutputData = playStatusStreamController.stream;
    playStatusOutputData =
        playStatusStreamController.stream.asBroadcastStream();
  }

  static PlayMusicController? instance;

  factory PlayMusicController(int index) {
    if (instance != null) instance!.index = index;
    instance ??= PlayMusicController._internal(index);
    return instance!;
  }

  void play() async {
    uri = await audioCache.load(ConstantsValue().listAlhan[index].pathSong);

    audioPlayer.play(UrlSource(uri.toString()));
    isPlaying = true;
    playStatusInputData.add(isPlaying);
  }

  void changePlayStatus() {
    if (audioPlayer.state == PlayerState.playing) {
      audioPlayer.pause();
      isPlaying = false;
    } else if (audioPlayer.state == PlayerState.paused) {
      audioPlayer.resume();
      isPlaying = true;
    }
    playStatusInputData.add(isPlaying);
  }

  void displayAudio() {
    // playStatusInputData.close();
    // playStatusStreamController.close();
  }
}
