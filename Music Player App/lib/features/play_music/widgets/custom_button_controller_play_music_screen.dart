import 'package:flutter/material.dart';
import 'package:music_player_app/core/resources/assets_managers.dart';
import 'package:music_player_app/core/resources/color_managers.dart';
import 'package:music_player_app/core/resources/height_values_managers.dart';
import 'package:music_player_app/features/play_music/widgets/custom_single_button_controller.dart';

class CustomButtonControllerPlayMusicScreen extends StatelessWidget {
  const CustomButtonControllerPlayMusicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            onPressed: () {},
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
    );
  }
}
