import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player_app/core/resources/color_managers.dart';
import 'package:music_player_app/core/resources/font_managers.dart';

class CustomTextFieldHomeScreen extends StatelessWidget {
  const CustomTextFieldHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 53, left: 31, right: 31),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xffB1AFE9),
          prefixIcon: const Icon(CupertinoIcons.search,
              color: ColorManagers.kWhiteColor),
          hintText: 'Search Song',
          hintStyle: const TextStyle(
            color: ColorManagers.kWhiteColor,
            fontSize: FontSizeManagers.kFontSize12,
            fontWeight: FontWeightManagers.kRegular,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }
}