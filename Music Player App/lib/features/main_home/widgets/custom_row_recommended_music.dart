import 'package:flutter/material.dart';
import 'package:music_player_app/core/resources/color_managers.dart';
import 'package:music_player_app/core/resources/font_managers.dart';
import 'package:music_player_app/core/resources/padding_value.dart';
import 'package:music_player_app/core/resources/radius_values_managers.dart';

class CustomRowRecommendedMusic extends StatelessWidget {
  const CustomRowRecommendedMusic({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: PaddingValue.kPadding21),
      child: ListTile(
        leading: CircleAvatar(
          radius: RadiusValuesManagers.kRadius35,
          backgroundImage: AssetImage('assets/images/test.png'),
        ),
        title: Text(
          'Magenta Riddim',
          style: TextStyle(
            color: ColorManagers.kWhiteColor,
            fontSize: FontSizeManagers.kFontSize15,
            fontWeight: FontWeightManagers.kMedium,
          ),
        ),
        subtitle: Text(
          'Dj Snake',
          style: TextStyle(
            color: ColorManagers.kLightWhiteColor,
            fontSize: FontSizeManagers.kFontSize12,
            fontWeight: FontWeightManagers.kMedium,
          ),
        ),
        trailing: Icon(
          Icons.favorite_border_outlined,
          color: ColorManagers.kWhiteColor,
        ),
      ),
    );
  }
}
