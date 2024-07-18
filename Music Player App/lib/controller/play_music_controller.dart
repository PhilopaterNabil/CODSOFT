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
  late StreamController<Duration> durationNowStreamController;
  late Sink<Duration> durationNowInputData;
  late Stream<String> durationNowOutputData;
  late Uri uri;
  late bool isPlaying = true;

  PlayMusicController._internal(this.index) {
    audioCache = AudioCache(prefix: '');
    audioPlayer = AudioPlayer();
    playStatusStreamController = StreamController<bool>();
    playStatusInputData = playStatusStreamController.sink;
    playStatusOutputData = playStatusStreamController.stream;
    playStatusOutputData =
        playStatusStreamController.stream.asBroadcastStream();
    durationNowStreamController = StreamController<Duration>();
    durationNowInputData = durationNowStreamController.sink;
    durationNowOutputData = durationNowStreamController.stream
        .map((event) => transferDurationToMinuteAndSecond(event));
    durationNowOutputData = durationNowStreamController.stream
        .asBroadcastStream()
        .map((event) => transferDurationToMinuteAndSecond(event));
  }

  static PlayMusicController? instance;

  factory PlayMusicController(int index) {
    if (instance != null) instance!.index = index;
    instance ??= PlayMusicController._internal(index);
    return instance!;
  }

  Duration? audioTime;
  Future<Duration> play() async {
    uri = await audioCache.load(ConstantsValue().listAlhan[index].pathSong);

    await audioPlayer.play(UrlSource(uri.toString()));
    audioTime = await audioPlayer.getDuration();
    audioPlayer.onPositionChanged.listen((event) {
      durationNowInputData.add(event);
    });
    isPlaying = true;
    playStatusInputData.add(isPlaying);

    return audioTime!;
  }

  Future<String> myDuration() async {
    await Future.delayed(const Duration(seconds: 4));

    return "hello";
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
    playStatusInputData.close();
    playStatusStreamController.close();
  }

  String transferDurationToMinuteAndSecond(Duration? duration) {
    String minute =
        duration!.inMinutes.remainder(60).toString().padLeft(2, '0');
    String second = (duration.inSeconds % 60).toString().padLeft(2, '0');

    return '$minute:$second';
  }
}
