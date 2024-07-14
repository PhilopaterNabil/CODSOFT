import 'package:flutter/material.dart';
import 'package:music_player_app/core/resources/alignment_managers.dart';
import 'package:music_player_app/core/resources/color_managers.dart';
import 'package:music_player_app/core/resources/height_values_managers.dart';
import 'package:music_player_app/core/resources/radius_values_managers.dart';
import 'package:music_player_app/core/resources/width_values_managers.dart';

class CustomSingleButtonController extends StatelessWidget {
  const CustomSingleButtonController(
      {super.key, required this.onPressed, required this.image});

  final void Function() onPressed;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        onPressed: onPressed,
        icon: Image.asset(
          image,
          width: WidthValuesManagers.kWidth20,
          height: HeightValuesManagers.kHeight20,
        ),
      ),
    );
  }
}
