import 'package:flutter/material.dart';
import 'package:music_player_app/core/resources/color_managers.dart';
import 'package:music_player_app/core/resources/font_managers.dart';
import 'package:music_player_app/core/resources/height_values_managers.dart';
import 'package:music_player_app/core/resources/padding_value.dart';
import 'package:music_player_app/core/resources/radius_values_managers.dart';
import 'package:music_player_app/core/resources/width_values_managers.dart';
import 'package:music_player_app/models/songs_model.dart';

class CustomSongsHomeScreen extends StatelessWidget {
  const CustomSongsHomeScreen(
      {super.key, required this.songsModel, required this.onTap, required this.itemCount});

  final List<SongsModel> songsModel;
  final int itemCount;
  final void Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: HeightValuesManagers.kHeight230,
      child: Padding(
        padding: const EdgeInsets.only(
            left: PaddingValue.kPadding20, top: PaddingValue.kPadding22),
        child: ListView.separated(
          itemCount: itemCount,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) =>
              const SizedBox(width: WidthValuesManagers.kWidth17),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => onTap(index),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(RadiusValuesManagers.kRadius10),
                    child: Image.asset(
                      songsModel[index].image,
                      fit: BoxFit.cover,
                      width: WidthValuesManagers.kWidth151,
                      height: HeightValuesManagers.kHeight151,
                    ),
                  ),
                  const SizedBox(height: HeightValuesManagers.kHeight9),
                  Text(
                    songsModel[index].song,
                    style: const TextStyle(
                      color: ColorManagers.kWhiteColor,
                      fontSize: FontSizeManagers.kFontSize15,
                      fontWeight: FontWeightManagers.kMedium,
                    ),
                  ),
                  // const SizedBox(height: HeightValuesManagers.kHeight4),
                  Text(
                    songsModel[index].singer,
                    style: const TextStyle(
                      color: ColorManagers.kLightWhiteColor,
                      fontSize: FontSizeManagers.kFontSize13,
                      fontWeight: FontWeightManagers.kMedium,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
