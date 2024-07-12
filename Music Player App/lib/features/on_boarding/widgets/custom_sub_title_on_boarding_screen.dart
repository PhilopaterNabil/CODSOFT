import 'package:flutter/material.dart';
import 'package:music_player_app/core/resources/color_managers.dart';
import 'package:music_player_app/core/resources/font_managers.dart';
import 'package:music_player_app/core/resources/padding_value.dart';
import 'package:music_player_app/core/resources/strings_values_managers.dart';

class CustomSubTitleOnBoardingScreen extends StatelessWidget {
  const CustomSubTitleOnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: PaddingValue.kPadding64),
      child: Text(
        StringsValuesManagers.subTitleOnBoardingScreen,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: ColorManagers.kWhiteColor,
          fontWeight: FontWeightManagers.kMedium,
          fontSize: FontSizeManagers.kFontSize15,
        ),
      ),
    );
  }
}
