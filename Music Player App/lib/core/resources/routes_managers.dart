import 'package:flutter/material.dart';
import 'package:music_player_app/features/splash/screens/splash_screen.dart';

class RoutesManagers {
  static Map<String, WidgetBuilder> routes = {
    RoutesName.kSplashScreen: (_) => const SplashScreen(),
  };
}

class RoutesName {
  static const String kSplashScreen = '/kSplashScreen';
}
