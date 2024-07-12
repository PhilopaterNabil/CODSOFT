import 'package:flutter/material.dart';
import 'package:music_player_app/core/resources/assets_managers.dart';

class CustomImageOnBoardingScreen extends StatelessWidget {
  const CustomImageOnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: Image.asset(
          AssetsManagers.onBoardingImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}