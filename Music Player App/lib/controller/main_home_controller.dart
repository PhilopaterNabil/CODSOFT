import 'package:flutter/material.dart';

class MainHomeController {
  static List<Icon> homeIcon = [
    const Icon(Icons.subject),
    const Icon(Icons.home_outlined),
    const Icon(Icons.favorite_outline),
    const Icon(Icons.format_list_bulleted_outlined),
    const Icon(Icons.settings),
  ];
  static List<Widget> homePages = [
    const Scaffold(
      body: Center(
        child: Text('Align_horizontal_center'),
      ),
    ),
    const Scaffold(
      body: Center(
        child: Text('Home'),
      ),
    ),
    const Scaffold(
      body: Center(
        child: Text('Heart_broken'),
      ),
    ),
    const Scaffold(
      body: Center(
        child: Text('Align_horizontal_left'),
      ),
    ),
    const Scaffold(
      body: Center(
        child: Text('Settings'),
      ),
    ),
  ];
}
