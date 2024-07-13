import 'package:flutter/material.dart';
import 'package:music_player_app/core/resources/alignment_managers.dart';
import 'package:music_player_app/core/resources/color_managers.dart';
import 'package:music_player_app/core/resources/padding_value.dart';
import 'package:music_player_app/core/resources/strings_values_managers.dart';
import 'package:music_player_app/features/main_home/widgets/custom_row_recommended_music.dart';
import 'package:music_player_app/features/main_home/widgets/custom_songs_home_screen.dart';
import 'package:music_player_app/features/main_home/widgets/custom_text_field_home_screen.dart';
import 'package:music_player_app/features/main_home/widgets/custom_title_home_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(AlignmentManagersX.x0_20, AlignmentManagersY.y_0_98),
          end: Alignment(AlignmentManagersX.x_0_20, AlignmentManagersY.y0_98),
          colors: [
            ColorManagers.kPrimaryColor,
            ColorManagers.kDarkBlueColor,
          ],
        ),
      ),
      child: const SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFieldHomeScreen(),
            CustomTitleHomeScreen(
              title: StringsValuesManagers.recentlyPlayed,
              top: PaddingValue.kPadding32,
            ),
            CustomSongsHomeScreen(
              musicName: 'Who Says',
              singerName: 'Selena Gomez',
              itemCount: 3,
            ),
            CustomTitleHomeScreen(
              title: StringsValuesManagers.recommandedMusic,
              top: PaddingValue.kPadding31,
            ),
            CustomRowRecommendedMusic(),
          ],
        ),
      ),
    );
  }
}