import 'package:flutter/material.dart';
import 'package:music_player_app/core/resources/assets_managers.dart';
import 'package:music_player_app/core/resources/color_managers.dart';
import 'package:music_player_app/core/resources/font_managers.dart';
import 'package:music_player_app/core/resources/height_values_managers.dart';
import 'package:music_player_app/core/resources/padding_value.dart';
import 'package:music_player_app/core/resources/radius_values_managers.dart';
import 'package:music_player_app/core/resources/width_values_managers.dart';

class CustomTools2PlayMusicScreen extends StatelessWidget {
  const CustomTools2PlayMusicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: PaddingValue.kPadding11, horizontal: 13),
      margin: const EdgeInsets.symmetric(horizontal: 34, vertical: 25),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(RadiusValuesManagers.kRadius10),
        ),
        color: ColorManagers.kLightWhiteColor.withOpacity(0.5),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Up Next',
                style: TextStyle(
                  color: ColorManagers.kWhiteColor,
                  fontSize: FontSizeManagers.kFontSize8,
                  fontWeight: FontWeightManagers.kMedium,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: PaddingValue.kPadding8,
                    vertical: PaddingValue.kPadding3),
                decoration: BoxDecoration(
                  color: const Color(0xff8A86F4).withOpacity(0.5),
                  borderRadius:
                      BorderRadius.circular(RadiusValuesManagers.kRadius10),
                ),
                child: const Text(
                  'Queue >',
                  style: TextStyle(
                    color: ColorManagers.kWhiteColor,
                    fontSize: FontSizeManagers.kFontSize8,
                    fontWeight: FontWeightManagers.kMedium,
                  ),
                ),
              ),
            ],
          ),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 0, right: 4),
            leading: ClipRRect(
              borderRadius:
                  BorderRadius.circular(RadiusValuesManagers.kRadius10),
              child: Image.asset(
                AssetsManagers.test,
                fit: BoxFit.cover,
                width: 55,
                height: 55,
              ),
            ),
            title: const Text(
              'sing me to sleep',
              style: TextStyle(
                color: ColorManagers.kWhiteColor,
                fontSize: FontSizeManagers.kFontSize15,
                fontWeight: FontWeightManagers.kMedium,
              ),
            ),
            subtitle: const Padding(
              padding: EdgeInsets.only(left: PaddingValue.kPadding30),
              child: Text(
                'Alan Walker',
                style: TextStyle(
                  color: ColorManagers.kLightWhiteColor,
                  fontSize: FontSizeManagers.kFontSize12,
                  fontWeight: FontWeightManagers.kMedium,
                ),
              ),
            ),
            trailing: Image.asset(
              AssetsManagers.next,
              width: WidthValuesManagers.kWidth16_68,
              height: HeightValuesManagers.kHeight15_02,
            ),
          ),
        ],
      ),
    );
  }
}
