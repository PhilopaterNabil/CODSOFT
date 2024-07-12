import 'package:flutter/material.dart';
import 'package:music_player_app/core/resources/color_managers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorManagers.kPrimaryColor,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset('assets/images/bottom_nav_images/Vector.png'),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset(
              'assets/images/bottom_nav_images/Home.png',
              color: ColorManagers.kWhiteColor,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset('assets/images/bottom_nav_images/heart.png'),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset('assets/images/bottom_nav_images/list_ul.png'),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset('assets/images/bottom_nav_images/Setting.png'),
          ),
        ],
      ),
    );
  }
}
