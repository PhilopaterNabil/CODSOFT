import 'package:flutter/material.dart';
import 'package:music_player_app/core/resources/color_managers.dart';

class HomeController{
      static List<Widget> homeIcon = [
      Image.asset('assets/images/bottom_nav_images/Vector.png'),
      Image.asset(
        'assets/images/bottom_nav_images/Home.png',
        color: ColorManagers.kWhiteColor,
      ),
      Image.asset('assets/images/bottom_nav_images/heart.png'),
      Image.asset('assets/images/bottom_nav_images/list_ul.png'),
      Image.asset('assets/images/bottom_nav_images/Setting.png'),
    ];
}