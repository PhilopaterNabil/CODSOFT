import 'package:flutter/material.dart';
import 'package:music_player_app/core/resources/color_managers.dart';
import 'package:music_player_app/core/resources/font_managers.dart';
import 'package:music_player_app/core/resources/padding_value.dart';
import 'package:music_player_app/core/resources/strings_values_managers.dart';

class CustomTitleHomeScreen extends StatelessWidget {
  const CustomTitleHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
          left: PaddingValue.kPadding34, top: PaddingValue.kPadding32),
      child: Text(
        StringsValuesManagers.recentlyPlayed,
        style: TextStyle(
          color: ColorManagers.kWhiteColor,
          fontSize: FontSizeManagers.kFontSize18,
          fontWeight: FontWeightManagers.kMedium,
        ),
      ),
    );
  }
}