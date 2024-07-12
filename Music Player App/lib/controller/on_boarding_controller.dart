import 'package:flutter/material.dart';
import 'package:music_player_app/core/resources/routes_managers.dart';

class OnBoardingController {
  static void navigatorToHomeScreen({required BuildContext context}) {
    Navigator.pushNamed(context, RoutesName.kHomeScreen);
  }
}
