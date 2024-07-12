import 'package:flutter/material.dart';
import 'package:music_player_app/controller/home_controller.dart';
import 'package:music_player_app/features/home/widgets/custom_boottom_nav_bar_home_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeController.homePages[index],
      bottomNavigationBar: CustomBoottomNavBarHomeScreen(
        onTap: (value) {
          index = value;
          setState(() {});
        },
        selectedIndex: index,
      ),
    );
  }
}
