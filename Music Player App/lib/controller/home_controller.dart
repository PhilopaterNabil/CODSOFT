import 'package:flutter/material.dart';
import 'package:music_player_app/core/resources/routes_managers.dart';

class HomeController {
  static void navigatorToPlayMusicScreen({required BuildContext context}) {
    Navigator.pushNamed(context, RoutesName.kPlayMusicScreen);
  }

  static void navigatorToPop({required BuildContext context}) {
    Navigator.pop(context);
  }
}
