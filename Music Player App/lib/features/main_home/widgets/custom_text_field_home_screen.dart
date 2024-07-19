import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player_app/core/resources/color_managers.dart';
import 'package:music_player_app/core/resources/font_managers.dart';
import 'package:music_player_app/core/resources/padding_value.dart';
import 'package:music_player_app/core/resources/radius_values_managers.dart';
import 'package:music_player_app/core/resources/strings_values_managers.dart';

class CustomTextFieldHomeScreen extends StatelessWidget {
  const CustomTextFieldHomeScreen({super.key, required this.onTap});

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: PaddingValue.kPadding53,
          left: PaddingValue.kPadding31,
          right: PaddingValue.kPadding31),
      child: TextField(
        onTap: onTap,
        decoration: InputDecoration(
          filled: true,
          fillColor: ColorManagers.kLightWhiteColor,
          prefixIcon: const Padding(
            padding: EdgeInsets.only(
                left: PaddingValue.kPadding15, right: PaddingValue.kPadding10),
            child:
                Icon(CupertinoIcons.search, color: ColorManagers.kWhiteColor),
          ),
          contentPadding: const EdgeInsets.all(PaddingValue.kPadding15),
          hintText: StringsValuesManagers.searchSong,
          hintStyle: const TextStyle(
            color: ColorManagers.kWhiteColor,
            fontSize: FontSizeManagers.kFontSize13,
            fontWeight: FontWeightManagers.kRegular,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(RadiusValuesManagers.kRadius50),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(RadiusValuesManagers.kRadius50),
          ),
        ),
      ),
    );
  }
}
