import 'package:flutter/material.dart';
import 'package:music_player_app/core/resources/alignment_managers.dart';
import 'package:music_player_app/core/resources/color_managers.dart';
import 'package:music_player_app/core/resources/font_managers.dart';
import 'package:music_player_app/core/resources/height_values_managers.dart';
import 'package:music_player_app/core/resources/radius_values_managers.dart';
import 'package:music_player_app/core/resources/width_values_managers.dart';

class CustomButtonOnBoardingScreen extends StatelessWidget {
  const CustomButtonOnBoardingScreen(
      {super.key, required this.onPressed, required this.text});

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        width: WidthValuesManagers.kWidth171,
        height: HeightValuesManagers.kHeight68,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: ColorManagers.kWhiteColor,
          borderRadius:
              BorderRadiusDirectional.circular(RadiusValuesManagers.kRadius50),
          border: const Border(
            top: BorderSide(
              color: ColorManagers.kWhiteColor,
              width: WidthValuesManagers.kWidth1,
            ),
          ),
          gradient: const LinearGradient(
            begin:
                Alignment(AlignmentManagersX.x0_00, AlignmentManagersY.y_1_00),
            end: Alignment(AlignmentManagersX.x0_00, AlignmentManagersY.y1_00),
            colors: [
              ColorManagers.kLight2BlueColor,
              ColorManagers.kLightBlueColor,
            ],
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: ColorManagers.kWhiteColor,
            fontSize: FontSizeManagers.kFontSize18,
            fontWeight: FontWeightManagers.kMedium,
          ),
        ),
      ),
    );
  }
}
