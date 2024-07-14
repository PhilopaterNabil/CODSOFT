import 'package:flutter/material.dart';
import 'package:music_player_app/core/resources/color_managers.dart';
import 'package:music_player_app/core/resources/font_managers.dart';
import 'package:music_player_app/core/resources/radius_values_managers.dart';

class CustomRowRecommendedMusic extends StatelessWidget {
  const CustomRowRecommendedMusic(
      {super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        radius: RadiusValuesManagers.kRadius35,
        backgroundImage: AssetImage('assets/images/test.png'),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: ColorManagers.kWhiteColor,
          fontSize: FontSizeManagers.kFontSize15,
          fontWeight: FontWeightManagers.kMedium,
        ),
      ),
      subtitle: Text(
        subtitle,
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
