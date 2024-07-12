import 'package:flutter/material.dart';
import 'package:music_player_app/features/home/widgets/custom_boottom_nav_bar_home_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: CustomBoottomNavBarHomeScreen(),
    );
  }
}
