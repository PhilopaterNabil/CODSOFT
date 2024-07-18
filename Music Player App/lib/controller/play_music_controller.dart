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
  late StreamController<Duration> sliderValueStreamController;
  late Sink<Duration> sliderValueInputData;
  late Stream<double> sliderValueOutputData;
  late Uri uri;
  late bool isPlaying = true;
  late double valueSlider = 0;

  PlayMusicController._internal(this.index) {
    audioCache = AudioCache(prefix: '');
    audioPlayer = AudioPlayer();
    playStatusStreamController = StreamController<bool>();
    playStatusInputData = playStatusStreamController.sink;
    playStatusOutputData = playStatusStreamController.stream;
    playStatusOutputData =
        playStatusStreamController.stream.asBroadcastStream();
    sliderValueStreamController = StreamController();
    sliderValueInputData = sliderValueStreamController.sink;
    sliderValueOutputData = sliderValueStreamController.stream
        .asBroadcastStream()
        .map((event) => transferDurationToValueSlider(event));
    sliderValueOutputData = sliderValueStreamController.stream
        .asBroadcastStream()
        .map((event) => transferDurationToValueSlider(event));
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

  double transferDurationToValueSlider(Duration duration) {
    double durationNowInSecond = duration.inSeconds.toDouble();
    double maxTime = audioTime!.inSeconds.toDouble();
    valueSlider = (durationNowInSecond / maxTime) * 1.0;
    return valueSlider;
  }

  void onChangedThumSlider(double value) {
    Duration duration = transferValueSliderToDuration(value);
    audioPlayer.seek(duration);
  }

  void onNextTap() {
    if (index < ConstantsValue.listAlhan.length - 1) {
      index++;
    } else {
      index = 0;
    }
    play();
  }

  Duration transferValueSliderToDuration(double sliderValue) {
    double valueNow = (sliderValue / 1.0) * audioTime!.inSeconds.toDouble();

    return Duration(seconds: valueNow.toInt());
  }

  Future<Duration> play() async {
    uri = await audioCache.load(ConstantsValue.listAlhan[index].pathSong);

    await audioPlayer.play(UrlSource(uri.toString()));
    audioTime = await audioPlayer.getDuration();
    audioPlayer.onPositionChanged.listen((event) {
      durationNowInputData.add(event);
      sliderValueInputData.add(event);
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
