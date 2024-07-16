import 'package:flutter/material.dart';
import 'package:music_player_app/core/resources/color_managers.dart';
import 'package:music_player_app/core/resources/font_managers.dart';
import 'package:music_player_app/core/resources/radius_values_managers.dart';
import 'package:music_player_app/models/songs_model.dart';

class CustomRowRecommandedMusic extends StatelessWidget {
  const CustomRowRecommandedMusic({super.key, required this.songsModel});

  final SongsModel songsModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: RadiusValuesManagers.kRadius35,
        backgroundImage: AssetImage(songsModel.image),
      ),
      title: Text(
        songsModel.song,
        style: const TextStyle(
          color: ColorManagers.kWhiteColor,
          fontSize: FontSizeManagers.kFontSize15,
          fontWeight: FontWeightManagers.kMedium,
        ),
      ),
      subtitle: Text(
        songsModel.singer,
        style: const TextStyle(
          color: ColorManagers.kLightWhiteColor,
          fontSize: FontSizeManagers.kFontSize12,
          fontWeight: FontWeightManagers.kMedium,
        ),
      ),
      trailing: const Icon(
        Icons.favorite_border_outlined,
        color: ColorManagers.kWhiteColor,
      ),
    );
  }
}
