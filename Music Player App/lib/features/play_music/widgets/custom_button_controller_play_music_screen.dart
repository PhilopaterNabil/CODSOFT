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
    required this.onChanged,
    required this.value,
    required this.pathSong, required this.onStop,
  });

  final void Function(double) onChanged;
  final double value;
  final String pathSong;
  final void Function() onStop;

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
              onPressed: () {},
              image: AssetsManagers.previous,
            ),
            CircleAvatar(
              backgroundColor: ColorManagers.kLightWhiteColor,
              radius: HeightValuesManagers.kHeight30_5,
              child: IconButton(
                onPressed: onStop,
                icon: Image.asset(AssetsManagers.pause),
              ),
            ),
            CustomSingleButtonController(
              onPressed: () {},
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
            child: Slider(
              activeColor: ColorManagers.kLightWhiteColor,
              inactiveColor: const Color(0xff2F5D9A),
              value: 0.5,
              onChanged: onChanged,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: PaddingValue.kPadding26,
            vertical: PaddingValue.kPadding7,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '2:05',
                style: TextStyle(
                  color: ColorManagers.kLightWhiteColor,
                  fontSize: FontSizeManagers.kFontSize13,
                  fontWeight: FontWeightManagers.kMedium,
                ),
              ),
              Text(
                '3:45',
                style: TextStyle(
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
