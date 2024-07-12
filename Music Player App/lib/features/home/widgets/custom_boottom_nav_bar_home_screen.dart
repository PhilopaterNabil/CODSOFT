import 'package:flutter/material.dart';
import 'package:music_player_app/controller/home_controller.dart';
import 'package:music_player_app/core/resources/color_managers.dart';

class CustomBoottomNavBarHomeScreen extends StatelessWidget {
  const CustomBoottomNavBarHomeScreen(
      {super.key, required this.onTap, required this.selectedIndex});

  final void Function(int) onTap;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: ColorManagers.kPurpleDarkColor,
      onTap: onTap,
      selectedItemColor: ColorManagers.kThirdPrimaryColor,
      unselectedItemColor: ColorManagers.kWhiteColor,
      currentIndex: selectedIndex,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        for (int i = 0; i < HomeController.homeIcon.length; i++)
          BottomNavigationBarItem(
            label: '',
            icon: HomeController.homeIcon[i],
          ),
      ],
    );
  }
}
