import 'package:flutter/material.dart';
import 'package:music_player_app/features/splash/widgets/custom_logo_splash_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomLogoSplashScreen(),
    );
  }
}
