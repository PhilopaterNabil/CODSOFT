import 'package:flutter/material.dart';
import 'package:music_player_app/core/resources/alignment_managers.dart';
import 'package:music_player_app/core/resources/assets_managers.dart';
import 'package:music_player_app/core/resources/color_managers.dart';
import 'package:music_player_app/core/resources/height_values_managers.dart';
import 'package:music_player_app/core/resources/radius_values_managers.dart';
import 'package:music_player_app/core/resources/width_values_managers.dart';

class CustomButtonControllerPlayMusicScreen extends StatelessWidget {
  const CustomButtonControllerPlayMusicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: Image.asset(AssetsManagers.random),
        ),
        Container(
          width: WidthValuesManagers.kWidth36,
          height: HeightValuesManagers.kHeight36,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(RadiusValuesManagers.kRadius20),
            gradient: LinearGradient(
              begin: const Alignment(
                  AlignmentManagersX.x0_00, AlignmentManagersY.y_1_00),
              end: const Alignment(
                  AlignmentManagersX.x0_00, AlignmentManagersY.y1_00),
              colors: [
                ColorManagers.kThirdPrimaryColor.withOpacity(0.5),
                ColorManagers.kLightWhiteColor.withOpacity(0.5),
              ],
            ),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Image.asset(
              AssetsManagers.previous,
              width: WidthValuesManagers.kWidth20,
              height: HeightValuesManagers.kHeight20,
            ),
          ),
        ),
        CircleAvatar(
          backgroundColor: ColorManagers.kLightWhiteColor,
          radius: HeightValuesManagers.kHeight30_5,
          child: IconButton(
            onPressed: () {},
            icon: Image.asset(AssetsManagers.pause),
          ),
        ),
        Container(
          width: WidthValuesManagers.kWidth36,
          height: HeightValuesManagers.kHeight36,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(RadiusValuesManagers.kRadius20),
            gradient: LinearGradient(
              begin: const Alignment(
                  AlignmentManagersX.x0_00, AlignmentManagersY.y_1_00),
              end: const Alignment(
                  AlignmentManagersX.x0_00, AlignmentManagersY.y1_00),
              colors: [
                ColorManagers.kThirdPrimaryColor.withOpacity(0.5),
                ColorManagers.kLightWhiteColor.withOpacity(0.5),
              ],
            ),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Image.asset(
              AssetsManagers.next,
              width: WidthValuesManagers.kWidth36,
              height: HeightValuesManagers.kHeight36,
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset(AssetsManagers.loop),
        ),
      ],
    );
  }
}
