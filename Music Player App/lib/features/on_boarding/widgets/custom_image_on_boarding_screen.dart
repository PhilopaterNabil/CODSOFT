import 'package:flutter/material.dart';
import 'package:music_player_app/core/resources/alignment_managers.dart';
import 'package:music_player_app/core/resources/assets_managers.dart';
import 'package:music_player_app/core/resources/color_managers.dart';
import 'package:music_player_app/core/resources/height_values_managers.dart';

class CustomImageOnBoardingScreen extends StatelessWidget {
  const CustomImageOnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              AssetsManagers.onBoardingImage,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            width: MediaQuery.sizeOf(context).width,
            height: HeightValuesManagers.kHeight199,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: const Alignment(
                      AlignmentManagersX.x0_00, AlignmentManagersY.y1_00),
                  end: const Alignment(
                      AlignmentManagersX.x0_00, AlignmentManagersY.y_1_00),
                  colors: [
                    ColorManagers.kPrimaryColor,
                    ColorManagers.kLightColor.withOpacity(0.04),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
