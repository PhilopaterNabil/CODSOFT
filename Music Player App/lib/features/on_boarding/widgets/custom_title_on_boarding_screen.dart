import 'package:flutter/material.dart';
import 'package:music_player_app/core/resources/color_managers.dart';
import 'package:music_player_app/core/resources/font_managers.dart';
import 'package:music_player_app/core/resources/height_values_managers.dart';
import 'package:music_player_app/core/resources/strings_values_managers.dart';

class CustomTitleOnBoardingScreen extends StatelessWidget {
  const CustomTitleOnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          StringsValuesManagers.titleOnBoardingScreen,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ColorManagers.kWhiteColor,
            fontSize: FontSizeManagers.kFontSize50,
            fontWeight: FontWeight.bold,
            height: HeightValuesManagers.kHeight1_2,
          ),
        ),
        Text(
          StringsValuesManagers.music,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: ColorManagers.kLightBlueColor,
            fontSize: FontSizeManagers.kFontSize50,
            fontWeight: FontWeight.bold,
            height: HeightValuesManagers.kHeight1_2,
          ),
        ),
      ],
    );
  }
}
