import 'package:flutter/material.dart';
import 'package:music_player_app/core/resources/alignment_managers.dart';
import 'package:music_player_app/core/resources/color_managers.dart';
import 'package:music_player_app/core/resources/height_values_managers.dart';
import 'package:music_player_app/features/on_boarding/widgets/custom_button_on_boarding_screen.dart';
import 'package:music_player_app/features/on_boarding/widgets/custom_sub_title_on_boarding_screen.dart';
import 'package:music_player_app/features/on_boarding/widgets/custom_title_on_boarding_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: const Alignment(
                AlignmentManagersX.x0_20, AlignmentManagersY.y_0_98),
            end: const Alignment(
                AlignmentManagersX.x_0_20, AlignmentManagersY.y0_98),
            colors: [
              ColorManagers.kPrimaryColor,
              ColorManagers.kSecondPrimaryColor.withOpacity(0.54),
            ],
          ),
        ),
        child: const SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: HeightValuesManagers.kHeight111),
              CustomTitleOnBoardingScreen(),
              SizedBox(height: HeightValuesManagers.kHeight11),
              CustomSubTitleOnBoardingScreen(),
              SizedBox(height: HeightValuesManagers.kHeight58),
              CustomButtonOnBoardingScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
