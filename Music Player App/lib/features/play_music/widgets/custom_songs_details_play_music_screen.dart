import 'package:flutter/material.dart';
import 'package:music_player_app/core/resources/color_managers.dart';
import 'package:music_player_app/core/resources/font_managers.dart';
import 'package:music_player_app/core/resources/height_values_managers.dart';
import 'package:music_player_app/core/resources/radius_values_managers.dart';
import 'package:music_player_app/core/resources/width_values_managers.dart';
import 'package:music_player_app/models/songs_model.dart';

class CustomSongsDetailsPlayMusicScreen extends StatelessWidget {
  const CustomSongsDetailsPlayMusicScreen(
      {super.key, required this.songsModel});

  final SongsModel songsModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(RadiusValuesManagers.kRadius10),
          child: Image.asset(
            songsModel.image,
            fit: BoxFit.cover,
            width: WidthValuesManagers.kWidth247,
            height: HeightValuesManagers.kHeight261,
          ),
        ),
        const SizedBox(height: HeightValuesManagers.kHeight23),
        Text(
          songsModel.song,
          style: const TextStyle(
            color: ColorManagers.kWhiteColor,
            fontSize: FontSizeManagers.kFontSize18,
            fontWeight: FontWeightManagers.kMedium,
          ),
        ),
        const SizedBox(height: HeightValuesManagers.kHeight4),
        Text(
          songsModel.singer,
          style: const TextStyle(
            color: ColorManagers.kLightWhiteColor,
            fontSize: FontSizeManagers.kFontSize12,
            fontWeight: FontWeightManagers.kMedium,
          ),
        ),
      ],
    );
  }
}
