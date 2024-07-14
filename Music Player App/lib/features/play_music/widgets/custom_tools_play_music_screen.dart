import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player_app/core/resources/color_managers.dart';
import 'package:music_player_app/core/resources/font_managers.dart';
import 'package:music_player_app/core/resources/padding_value.dart';
import 'package:music_player_app/core/resources/radius_values_managers.dart';

class CustomToolsPlayMusicScreen extends StatelessWidget {
  const CustomToolsPlayMusicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(PaddingValue.kPadding7),
      margin: const EdgeInsets.symmetric(
          horizontal: PaddingValue.kPadding89,
          vertical: PaddingValue.kPadding7),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(RadiusValuesManagers.kRadius10),
        ),
        color: ColorManagers.kLightWhiteColor.withOpacity(0.5),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Icon(
                Icons.favorite_border_outlined,
                size: FontSizeManagers.kFontSize24,
                color: ColorManagers.kWhiteColor,
              ),
              Text(
                'Like',
                style: TextStyle(
                  color: ColorManagers.kWhiteColor,
                  fontSize: FontSizeManagers.kFontSize8,
                  fontWeight: FontWeightManagers.kMedium,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Icon(
                CupertinoIcons.heart,
                size: FontSizeManagers.kFontSize24,
                color: ColorManagers.kWhiteColor,
              ),
              Text(
                'playlist',
                style: TextStyle(
                  color: ColorManagers.kWhiteColor,
                  fontSize: FontSizeManagers.kFontSize8,
                  fontWeight: FontWeightManagers.kMedium,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Icon(
                Icons.download,
                size: FontSizeManagers.kFontSize24,
                color: ColorManagers.kWhiteColor,
              ),
              Text(
                'Download',
                style: TextStyle(
                  color: ColorManagers.kWhiteColor,
                  fontSize: FontSizeManagers.kFontSize8,
                  fontWeight: FontWeightManagers.kMedium,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Icon(
                Icons.more_vert,
                size: FontSizeManagers.kFontSize24,
                color: ColorManagers.kWhiteColor,
              ),
              Text(
                'More',
                style: TextStyle(
                  color: ColorManagers.kWhiteColor,
                  fontSize: FontSizeManagers.kFontSize8,
                  fontWeight: FontWeightManagers.kMedium,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
