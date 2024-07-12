import 'package:flutter/material.dart';
import 'package:music_player_app/core/resources/alignment_managers.dart';
import 'package:music_player_app/core/resources/color_managers.dart';
import 'package:music_player_app/core/resources/font_managers.dart';

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
        child: const Center(
          child: Text(
            'Music Player',
            style:
                TextStyle(fontFamily: FontManagers.orbitronPath, fontSize: 40),
          ),
        ),
      ),
    );
  }
}
