import 'dart:async';

import 'package:flutter/material.dart';
import 'package:music_player_app/core/resources/assets_managers.dart';
import 'package:music_player_app/core/resources/color_managers.dart';
import 'package:music_player_app/core/resources/font_managers.dart';
import 'package:music_player_app/core/resources/height_values_managers.dart';
import 'package:music_player_app/core/resources/padding_value.dart';
import 'package:music_player_app/features/play_music/widgets/custom_single_button_controller.dart';

class CustomButtonControllerPlayMusicScreen extends StatelessWidget {
  const CustomButtonControllerPlayMusicScreen({
    super.key,
    required this.onChangedSlider,
    required this.onStop,
    required this.playStatusOutputData,
    required this.audioTime,
    required this.durationNowOutputData,
    required this.sliderValueOutputData,
    required this.onTapNext,
    required this.onTapBack,
    required this.onTapLoop,
    required this.loopStatusOutputData,
    required this.onTapRandom,
  });

  final void Function(double) onChangedSlider;
  final void Function() onStop;
  final Stream playStatusOutputData;
  final Stream<String> durationNowOutputData;
  final Stream<double> sliderValueOutputData;
  final Stream<bool> loopStatusOutputData;
  final String audioTime;
  final void Function() onTapNext;
  final void Function() onTapBack;
  final void Function() onTapLoop;
  final void Function() onTapRandom;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: onTapRandom,
              icon: Image.asset(AssetsManagers.random),
            ),
            CustomSingleButtonController(
              onPressed: onTapBack,
              image: AssetsManagers.previous,
            ),
            CircleAvatar(
              backgroundColor: ColorManagers.kLightWhiteColor,
              radius: HeightValuesManagers.kHeight30_5,
              child: StreamBuilder(
                stream: playStatusOutputData,
                builder: (context, snapshot) => IconButton(
                  onPressed: onStop,
                  icon: snapshot.data == true
                      ? Image.asset(AssetsManagers.pause)
                      : const Icon(
                          Icons.play_arrow,
                          color: ColorManagers.kWhiteColor,
                          size: 35,
                        ),
                ),
              ),
            ),
            CustomSingleButtonController(
              onPressed: onTapNext,
              image: AssetsManagers.next,
            ),
            IconButton(
              onPressed: onTapLoop,
              icon: StreamBuilder(
                stream: loopStatusOutputData,
                builder: (context, snapshot) => snapshot.data == false
                    ? Image.asset(AssetsManagers.loop)
                    : Image.asset(
                        AssetsManagers.loop,
                        color: ColorManagers.kLightBlueColor,
                      ),
              ),
            ),
          ],
        ),
        const SizedBox(height: HeightValuesManagers.kHeight29),
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: PaddingValue.kPadding26),
          child: SliderTheme(
            data: SliderThemeData(
              thumbShape: RoundSliderThumbShape(),
              overlayShape: SliderComponentShape.noOverlay,
            ),
            child: StreamBuilder<double>(
              stream: sliderValueOutputData,
              builder: (context, snapshot) => Slider(
                activeColor: ColorManagers.kLightWhiteColor,
                inactiveColor: ColorManagers.kBlueColor,
                value: snapshot.data == null ? 0 : snapshot.data!.toDouble(),
                onChanged: onChangedSlider,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: PaddingValue.kPadding26,
            vertical: PaddingValue.kPadding7,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StreamBuilder<String?>(
                stream: durationNowOutputData,
                builder: (context, snapshot) => Text(
                  snapshot.data.toString(),
                  style: const TextStyle(
                    color: ColorManagers.kLightWhiteColor,
                    fontSize: FontSizeManagers.kFontSize13,
                    fontWeight: FontWeightManagers.kMedium,
                  ),
                ),
              ),
              Text(
                audioTime,
                style: const TextStyle(
                  color: ColorManagers.kLightWhiteColor,
                  fontSize: FontSizeManagers.kFontSize13,
                  fontWeight: FontWeightManagers.kMedium,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class RoundSliderThumbShape extends SliderComponentShape {
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size(0.0, 0.0);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {required Animation<double> activationAnimation,
      required Animation<double> enableAnimation,
      required bool isDiscrete,
      required TextPainter labelPainter,
      required RenderBox parentBox,
      required SliderThemeData sliderTheme,
      required TextDirection textDirection,
      required double value,
      required double textScaleFactor,
      required Size sizeWithOverflow}) {
    final Canvas canvas = context.canvas;
    final Paint paint = Paint()
      ..color = ColorManagers.kLightWhiteColor
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2.0;

    canvas.drawCircle(center, 3.0, paint);
  }
}
