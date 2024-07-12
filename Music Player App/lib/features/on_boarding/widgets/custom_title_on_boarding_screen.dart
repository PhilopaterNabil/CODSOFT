import 'package:flutter/material.dart';

class CustomTitleOnBoardingScreen extends StatelessWidget {
  const CustomTitleOnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'Find Your Favourite',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 50,
            fontWeight: FontWeight.bold,
            height: 1.2,
          ),
        ),
        Text(
          'Music',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xff80CFF2),
            fontSize: 50,
            fontWeight: FontWeight.bold,
            height: 1.2,
          ),
        ),
      ],
    );
  }
}
