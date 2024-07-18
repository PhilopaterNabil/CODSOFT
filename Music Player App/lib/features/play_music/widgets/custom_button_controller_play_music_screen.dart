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
    required this.onNext,
    required this.onBack,
  });

  final void Function(double) onChangedSlider;
  final void Function() onStop;
  final Stream playStatusOutputData;
  final Stream<String> durationNowOutputData;
  final Stream<double> sliderValueOutputData;
  final String audioTime;
  final void Function() onNext;
  final void Function() onBack;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: Image.asset(AssetsManagers.random),
            ),
            CustomSingleButtonController(
              onPressed: onBack,
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
              onPressed: onNext,
              image: AssetsManagers.next,
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset(AssetsManagers.loop),
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
                inactiveColor: const Color(0xff2F5D9A),
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
