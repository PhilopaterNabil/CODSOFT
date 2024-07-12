import 'package:flutter/material.dart';
import 'package:music_player_app/core/resources/padding_value.dart';
import 'package:music_player_app/core/resources/strings_values.dart';

class CustomSubTitleOnBoardingScreen extends StatelessWidget {
  const CustomSubTitleOnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: PaddingValue.kPadding64),
      child: Text(
        StringsValues.subTitleOnBoardingScreen,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
      ),
    );
  }
}
