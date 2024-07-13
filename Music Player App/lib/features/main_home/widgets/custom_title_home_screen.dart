import 'package:flutter/material.dart';
import 'package:music_player_app/core/resources/color_managers.dart';
import 'package:music_player_app/core/resources/font_managers.dart';
import 'package:music_player_app/core/resources/padding_value.dart';

class CustomTitleHomeScreen extends StatelessWidget {
  const CustomTitleHomeScreen({super.key, required this.title, required this.top});

  final String title;
  final double top;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: PaddingValue.kPadding34, top: top),
      child: Text(
        title,
        style: const TextStyle(
          color: ColorManagers.kWhiteColor,
          fontSize: FontSizeManagers.kFontSize18,
          fontWeight: FontWeightManagers.kMedium,
        ),
      ),
    );
  }
}
