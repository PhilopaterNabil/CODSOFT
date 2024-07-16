import 'package:flutter/material.dart';
import 'package:music_player_app/controller/home_controller.dart';
import 'package:music_player_app/core/resources/alignment_managers.dart';
import 'package:music_player_app/core/resources/color_managers.dart';
import 'package:music_player_app/core/resources/constants_value.dart';
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
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomTextFieldHomeScreen(),
              const CustomTitleHomeScreen(
                title: StringsValuesManagers.recentlyPlayed,
                top: PaddingValue.kPadding32,
              ),
              CustomSongsHomeScreen(
                songsModel: ConstantsValue().listAlhan,
                onTap: () => HomeController.navigatorToPlayMusicScreen(context),
              ),
              const CustomTitleHomeScreen(
                title: StringsValuesManagers.recommandedMusic,
                top: PaddingValue.kPadding31,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: PaddingValue.kPadding21, left: PaddingValue.kPadding8),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) =>
                      const CustomRowRecommendedMusic(
                    title: 'Magenta Riddim',
                    subtitle: 'Dj Snake',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
