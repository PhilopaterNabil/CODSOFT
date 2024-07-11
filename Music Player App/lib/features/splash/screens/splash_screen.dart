import 'package:flutter/material.dart';
import 'package:music_player_app/core/resources/color_managers.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: const Alignment(0.20, -0.98),
            end: const Alignment(-0.2, 0.98),
            colors: [
              ColorManagers.kPrimaryColor,
              ColorManagers.kSecondPrimaryColor.withOpacity(0.54),
            ],
          ),
        ),
        child: Center(
          child: Image.asset(
            'assets/images/drums.gif',
            width: MediaQuery.sizeOf(context).width * 0.6,
            height: MediaQuery.sizeOf(context).height * 0.6,
          ),
        ),
      ),
    );
  }
}
