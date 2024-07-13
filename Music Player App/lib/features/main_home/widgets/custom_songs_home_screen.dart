import 'package:flutter/material.dart';
import 'package:music_player_app/core/resources/color_managers.dart';
import 'package:music_player_app/core/resources/font_managers.dart';
import 'package:music_player_app/core/resources/height_values_managers.dart';
import 'package:music_player_app/core/resources/radius_values_managers.dart';
import 'package:music_player_app/core/resources/width_values_managers.dart';

class CustomSongsHomeScreen extends StatelessWidget {
  const CustomSongsHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) =>
            const SizedBox(width: WidthValuesManagers.kWidth17),
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius:
                    BorderRadius.circular(RadiusValuesManagers.kRadius10),
                child: Image.asset(
                  'assets/images/test.png',
                  fit: BoxFit.cover,
                  width: WidthValuesManagers.kWidth151,
                  height: HeightValuesManagers.kHeight151,
                ),
              ),
              const SizedBox(height: HeightValuesManagers.kHeight9),
              const Text(
                'Who Says',
                style: TextStyle(
                  color: ColorManagers.kWhiteColor,
                  fontSize: FontSizeManagers.kFontSize15,
                  fontWeight: FontWeightManagers.kMedium,
                ),
              ),
              const SizedBox(height: HeightValuesManagers.kHeight4),
              const Text(
                'Selena Gomez',
                style: TextStyle(
                  color: ColorManagers.kLightWhiteColor,
                  fontSize: FontSizeManagers.kFontSize13,
                  fontWeight: FontWeightManagers.kMedium,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
