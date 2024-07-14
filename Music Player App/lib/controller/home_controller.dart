import 'package:flutter/material.dart';
import 'package:music_player_app/core/resources/routes_managers.dart';

class HomeController {
  static void navigatorToPlayMusicScreen(BuildContext context) {
    Navigator.pushNamed(context, RoutesName.kPlayMusicScreen);
  }
}
