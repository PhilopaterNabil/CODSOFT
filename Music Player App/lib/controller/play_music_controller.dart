import 'dart:async';
import 'dart:math';

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
  late StreamController<int> detailSongStreamController;
  late Sink<int> detailSongInputData;
  late Stream<int> detailSongOutputData;
  late StreamController<bool> loopStatusStreamController;
  late Sink<bool> loopStatusInputData;
  late Stream<bool> loopStatusOutputData;
  late Uri uri;
  bool isPlaying = true;
  double valueSlider = 0;
  bool loopStatus = false;

  PlayMusicController._internal(this.index) {
    audioCache = AudioCache(prefix: '');
    audioPlayer = AudioPlayer();
    playStatusStreamController = StreamController<bool>();
    playStatusInputData = playStatusStreamController.sink;
    playStatusOutputData =
        playStatusStreamController.stream.asBroadcastStream();
    loopStatusStreamController = StreamController<bool>();
    loopStatusInputData = loopStatusStreamController.sink;
    loopStatusOutputData =
        loopStatusStreamController.stream.asBroadcastStream();
    detailSongStreamController = StreamController<int>();
    detailSongInputData = detailSongStreamController.sink;
    detailSongOutputData =
        detailSongStreamController.stream.asBroadcastStream();
    sliderValueStreamController = StreamController();
    sliderValueInputData = sliderValueStreamController.sink;
    sliderValueOutputData = sliderValueStreamController.stream
        .asBroadcastStream()
        .map((event) => transferDurationToValueSlider(event));
    durationNowStreamController = StreamController<Duration>();
    durationNowInputData = durationNowStreamController.sink;
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
    valueSlider = valueSlider > 1 ? 1 : valueSlider;
    return valueSlider;
  }

  void onChangedThumSlider(double value) {
    Duration duration = transferValueSliderToDuration(value);
    audioPlayer.seek(duration);
  }

  void onTapRandom() {
    int i = index = Random().nextInt(ConstantsValue.listAlhan.length);
    if (i == index) {
      i = Random().nextInt(ConstantsValue.listAlhan.length);
    }
    index = i;
    play();
  }

  void onBackTap() {
    if (index == 0) {
      index = ConstantsValue.listAlhan.length - 1;
    } else {
      index--;
    }
    play();
  }

  void onNextTap() {
    if (index < ConstantsValue.listAlhan.length - 1) {
      index++;
    } else {
      index = 0;
    }
    play();
  }

  void onTapLoop() {
    if (audioPlayer.releaseMode == ReleaseMode.loop) {
      audioPlayer.setReleaseMode(ReleaseMode.release);
      loopStatus = false;
    } else {
      audioPlayer.setReleaseMode(ReleaseMode.loop);
      loopStatus = true;
    }
    loopStatusInputData.add(loopStatus);
  }

  Duration transferValueSliderToDuration(double sliderValue) {
    double valueNow = (sliderValue / 1.0) * audioTime!.inSeconds.toDouble();

    return Duration(seconds: valueNow.toInt());
  }

  Future<Duration> play() async {
    uri = await audioCache.load(ConstantsValue.listAlhan[index].pathSong);

    await audioPlayer.play(UrlSource(uri.toString()));
    audioTime = await audioPlayer.getDuration();
    detailSongInputData.add(index);
    audioPlayer.onPositionChanged.listen((event) {
      playStatusInputData.add(isPlaying);
      durationNowInputData.add(event);
      sliderValueInputData.add(event);
    });
    audioPlayer.onPlayerComplete.listen((event) {
      onNextTap();
    });
    isPlaying = true;

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
