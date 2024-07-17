import 'package:flutter/material.dart';
import 'package:music_player_app/core/resources/routes_managers.dart';
import 'package:music_player_app/core/resources/time_managers.dart';

class SplashController {
  static void navigatorToOnBoardingScreen({required BuildContext context}) {
    Future.delayed(
      const Duration(seconds: SecondsValues.kSeconds3),
      () =>
          Navigator.pushReplacementNamed(context, RoutesName.kOnBoardingScreen),
    );
  }
}
