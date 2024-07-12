import 'package:flutter/material.dart';
import 'package:music_player_app/core/resources/alignment_managers.dart';
import 'package:music_player_app/core/resources/assets_managers.dart';
import 'package:music_player_app/core/resources/color_managers.dart';

class CustomLogoSplashScreen extends StatelessWidget {
  const CustomLogoSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Center(
        child: Image.asset(
          AssetsManagers.logo,
          width: MediaQuery.sizeOf(context).width * 0.6,
          height: MediaQuery.sizeOf(context).height * 0.6,
        ),
      ),
    );
  }
}
